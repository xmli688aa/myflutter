import 'package:event_bus/event_bus.dart';

// 全局的eventBus对象 用来监听和发布
class EventBusManager {
  static final EventBus instance = EventBus();
}
