import 'package:flutter/material.dart';
import 'dart:async';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  int milliseconds = 0;
  bool isTicking = false;
  final laps = <int>[];
  late Timer timer;
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void _onTick(Timer time) {
    if (mounted) {
      setState(() {
        milliseconds += 100;
      });
    }
  }

  String _secondsText(int milliseconds) => '${milliseconds / 1000} seconds';

  void _startTimer() {
    timer = Timer.periodic(const Duration(milliseconds: 100), _onTick);
    setState(() {
      milliseconds = 0;
      isTicking = true;
      laps.clear();
    });
  }

  void _stopTimer() {
    timer.cancel();
    setState(() {
      isTicking = false;
    });
  }

  void _lap() {
    setState(() {
      laps.add(milliseconds);
      milliseconds = 0;
    });
    setState(() {
      _scrollController.animateTo(
        // TODO this does not bring the last item fully into view!
        _scrollController.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 500),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StopWatch'),
      ),
      body: Column(
        children: [
          Expanded(child: _buildCounter(context)),
          Expanded(
            child: Scrollbar(
                controller: _scrollController, child: _buildLapDisplay(this)),
          ),
        ],
      ),
    );
  }

  Widget _buildCounter(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Lap ${laps.length + 1}',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Colors.white),
          ),
          Text(
            _secondsText(milliseconds),
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Colors.white),
          ),
          const SizedBox(height: 20),
          _buildControls(context, this),
        ],
      ),
    );
  }
}

Widget _buildControls(BuildContext context, _StopWatchState state) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ElevatedButton(
        // style: ButtonStyle(
        //   backgroundColor:
        //       MaterialStateProperty.all<Color>(Colors.green),
        //   foregroundColor:
        //       MaterialStateProperty.all<Color>(Colors.white),
        // ),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            textStyle:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: state.isTicking ? null : state._startTimer,
        child: const Text('Start'),
      ),
      const SizedBox(width: 20),
      ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.yellow)),
        onPressed: state.isTicking ? state._lap : null,
        child: const Text('Lap'),
      ),
      const SizedBox(width: 20),
      TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        onPressed: state.isTicking ? state._stopTimer : null,
        child: const Text('Stop'),
      ),
      const SizedBox(width: 20),
    ],
  );
}

Widget _buildLapDisplay(_StopWatchState state) {
  return ListView(
    controller: state._scrollController,
    children: [
      for (int milliseconds in state.laps)
        ListTile(
          title: Text(
            state._secondsText(milliseconds),
          ),
        ),
    ],
  );
}
