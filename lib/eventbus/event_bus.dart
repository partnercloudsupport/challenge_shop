import 'package:event_bus/event_bus.dart';

EventBus eventBus = new EventBus();

class ProductOrderClickEvent {
  int orderId;

  ProductOrderClickEvent(this.orderId);
}
