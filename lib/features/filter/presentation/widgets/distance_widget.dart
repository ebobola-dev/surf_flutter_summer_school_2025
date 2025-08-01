import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_2025/common/widgets/smart_value_listener_builder.dart';
import 'package:surf_flutter_summer_school_2025/features/filter/presentation/filter_wm.dart';

class DistanceFilterWidget extends StatelessWidget {
  final IFilterWM wm;
  const DistanceFilterWidget({required this.wm, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Расстояние',
              style: wm.textScheme.text,
            ),
            SmartValueListenableBuilder(
              listenable: wm.filters,
              buildWhen: (previous, current) => previous.distance != current.distance,
              builder: (_, filters) {
                return Text(
                  'от ${filters.distance.min} до ${filters.distance.max} км',
                  style: wm.textScheme.text.copyWith(color: wm.colorScheme.inactiveBlack),
                );
              },
            ),
          ],
        ),
        SmartValueListenableBuilder(
          listenable: wm.filters,
          buildWhen: (previous, current) => previous.distance != current.distance,
          builder: (_, filters) {
            return RangeSlider(
              max: 30,
              values: RangeValues(filters.distance.min.toDouble(), filters.distance.max.toDouble()),
              onChanged: (newRange) => wm.onDistanceChanged(newRange.start.toInt(), newRange.end.toInt()),
              inactiveColor: wm.colorScheme.inactiveBlack,
            );
          },
        ),
      ],
    );
  }
}
