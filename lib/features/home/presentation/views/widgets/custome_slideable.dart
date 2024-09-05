import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:game_store/features/home/domain/entities/device.dart';
import 'package:game_store/features/home/presentation/blocs/home_bloc/device_bloc.dart';
import 'package:game_store/features/home/presentation/blocs/home_bloc/device_event.dart';

class CustomSlidable extends StatelessWidget {
  const CustomSlidable(
      {super.key, required this.child,required this.device});
  final Widget child;
  final DeviceEntity device;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      closeOnScroll: true,
      dragStartBehavior: DragStartBehavior.down,
      endActionPane: ActionPane(
        extentRatio: 0.25,
        motion: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 208, 207),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: InkWell(
              onTap: () {
                BlocProvider.of<DeviceBloc>(context)
                    .add(DeleteDeviceEvent(device: device));
              },
              child: const Icon(
                Icons.delete_outline_rounded,
                color: Colors.red,
              ),
            )),
        children: const [],
      ),
      startActionPane: ActionPane(
        extentRatio: 0.24,
        motion: Container(
          decoration: BoxDecoration(
            color: Colors.amber.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: const InkWell(
            child: Icon(
              Icons.edit,
              color: Colors.amber,
            ),
          ),
        ),
        children: const [],
      ),
      direction: Axis.horizontal,
      child: child,
    );
  }
}
