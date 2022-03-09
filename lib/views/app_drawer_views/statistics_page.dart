import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:mindwatch/connectors/app_connector.dart';
import 'package:mindwatch/intl/app_strings.dart';
import 'package:mindwatch/models/user_stats.dart';
import 'package:mindwatch/utils/app_description_card.dart';
import 'package:mindwatch/utils/app_loader.dart';
import 'package:mindwatch/utils/app_theme.dart';
import 'package:mindwatch/views/widgets/app_bar.dart';
import 'package:mindwatch/views/widgets/app_scaffold.dart';

enum ChartType { yesterday, today, overall }

class StatisticsPage extends StatefulWidget {
  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  bool init = true;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
        automaticallyImplyLeading: true,
        title: Text(AppStrings.of(context).statisticsTitle),
      ),
      body: AppConnector(
        builder: (BuildContext context, AppViewModel model) {
          if (init) {
            model.getUserStats();
            init = false;
          }
          if (model.isLoading) {
            return AppLoader();
          }

          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  DescriptionCard(
                    descriptionText:
                        AppStrings.of(context).statisticsDescription,
                    descriptionStyle: appTheme.textTheme.subtitle2,
                  ),
                  const Divider(),
                  Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    child: Center(
                      child: Text(
                        AppStrings.of(context).yesterdayData,
                        style: appTheme.textTheme.headline6,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          _ListTileWidget(
                            title:
                                AppStrings.of(context).mostClickedPrimaryButton,
                            trailingTitle: model
                                    .clickStats?.yesterday?.mostClickedButton ??
                                '-',
                          ),
                          _ListTileWidget(
                            title: AppStrings.of(context).mostClickedCause,
                            trailingTitle: model
                                    .clickStats?.yesterday?.mostClickedCause ??
                                '-',
                          ),
                        ],
                      ),
                    ),
                  ),
                  _buildChart(
                    context,
                    model,
                    ChartType.yesterday,
                  ),
                  const Divider(),
                  Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    child: Center(
                      child: Text(
                        AppStrings.of(context).todayData,
                        style: appTheme.textTheme.title,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          _ListTileWidget(
                            title:
                                AppStrings.of(context).mostClickedPrimaryButton,
                            trailingTitle:
                                model.clickStats?.today?.mostClickedButton ??
                                    '0',
                          ),
                          _ListTileWidget(
                              title: AppStrings.of(context).mostClickedCause,
                              trailingTitle:
                                  model.clickStats?.today?.mostClickedCause ??
                                      '0'),
                          _ListTileWidget(
                            title: AppStrings.of(context).totalVariation,
                            trailingTitle:
                                model.clickStats?.today?.percentage ?? '0',
                          ),
                          _ListTileWidget(
                            title: AppStrings.of(context).totalClicks,
                            trailingTitle:
                                model.clickStats?.today?.totalClicks ?? '0',
                          ),
                        ],
                      ),
                    ),
                  ),
                  _buildChart(
                    context,
                    model,
                    ChartType.today,
                  ),
                  const Divider(),
                  Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    child: Center(
                      child: Text(
                        AppStrings.of(context).overallData,
                        style: appTheme.textTheme.title,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          _ListTileWidget(
                            title:
                                AppStrings.of(context).mostClickedPrimaryButton,
                            trailingTitle:
                                model.clickStats?.overall?.mostClickedButton ??
                                    '0',
                          ),
                          _ListTileWidget(
                              title: AppStrings.of(context).mostClickedCause,
                              trailingTitle:
                                  model.clickStats?.overall?.mostClickedCause ??
                                      '0'),
                          _ListTileWidget(
                            title: AppStrings.of(context).totalClicks,
                            trailingTitle:
                                model.clickStats?.overall?.totalClicks ?? '0',
                          ),
                        ],
                      ),
                    ),
                  ),
                  _buildChart(context, model, ChartType.overall),
                  const Divider(),
                  DescriptionCard(
                    descriptionText: AppStrings.of(context).statisticsInfo,
                    descriptionStyle: appTheme.textTheme.subtitle2,
                  ),
                  const Divider(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildChart(BuildContext context, AppViewModel model, ChartType type) {
    Statistics stats;
    switch (type) {
      case ChartType.overall:
        {
          stats = model.userStats?.overall;
          break;
        }
      case ChartType.today:
        {
          stats = model.userStats?.today;
          break;
        }
      case ChartType.yesterday:
        {
          stats = model.userStats?.yesterday;
          break;
        }
      default:
        stats = null;
    }
    if (stats!=null) {
      if(stats.total>0){
        return Container(
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width,
          child: PieChart<dynamic>(
            model.getChartData(stats),
            animate: true,
            behaviors: [
              DatumLegend(
                position: BehaviorPosition.bottom,
                outsideJustification: OutsideJustification.middleDrawArea,
                horizontalFirst: false,
                cellPadding: const EdgeInsets.only(right: 4.0, bottom: 4.0),
                showMeasures: true,
                desiredMaxColumns: 2,
                desiredMaxRows: 5,
                legendDefaultMeasure: LegendDefaultMeasure.firstValue,
                measureFormatter: (num value) {
                  return value == null ? '-' : '$value';
                },
                entryTextStyle: const TextStyleSpec(
                  color: MaterialPalette.black,
                  fontFamily: 'Roboto',
                  fontSize: 16,
                ),
              ),
            ],
            defaultRenderer: ArcRendererConfig<dynamic>(
              arcWidth: 60,
              arcRendererDecorators: [
                ArcLabelDecorator<dynamic>(
                  insideLabelStyleSpec: const TextStyleSpec(
                    fontSize: 16,
                    color: Color.white,
                  ),
                )
              ],
            ),
          ),
        );
      }
    }
    return const Text('No details to be displayed');

  }
}

class _ListTileWidget extends StatelessWidget {
  const _ListTileWidget({Key key, this.title, this.trailingTitle})
      : super(key: key);

  final String title;
  final String trailingTitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: appTheme.textTheme.subtitle2,
      ),
      trailing: FittedBox(
        child: Text(
          '$trailingTitle',
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(fontWeight: FontWeight.w200),
        ),
      ),
    );
  }
}
