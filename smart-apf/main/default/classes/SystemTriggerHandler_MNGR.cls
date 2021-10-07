/**
 * @File Name          : SystemTriggerHandler_MNGR.cls
 * @Description        :
 * @Author             : Smart Apps Pty Ltd
 * @Group              :
 * @Last Modified By   : Nikhil Sharma | Smart Apps Pty Ltd
 * @Last Modified On   : 06-10-2021
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      		      Modification
 *==============================================================================
 * 1.0    5/8/2019, 9:53:15 AM   Smart Apps Pty Ltd     Initial Version
 **/
public with sharing class SystemTriggerHandler_MNGR {
  private static final String NAMESPACE = '';

  public static void handle(String objectName) {
    System_TriggerHandler__mdt[] handlers = new List<System_TriggerHandler__mdt>{};

    switch on Trigger.operationType {
      when BEFORE_INSERT {
        handlers = getHandlers(objectName, NAMESPACE + 'Before_Insert__c');
      }
      when AFTER_INSERT {
        handlers = getHandlers(objectName, NAMESPACE + 'After_Insert__c');
      }
      when BEFORE_UPDATE {
        handlers = getHandlers(objectName, NAMESPACE + 'Before_Update__c');
      }
      when AFTER_UPDATE {
        handlers = getHandlers(objectName, NAMESPACE + 'After_Update__c');
      }
      when BEFORE_DELETE {
        handlers = getHandlers(objectName, NAMESPACE + 'Before_Delete__c');
      }
      when AFTER_DELETE {
        handlers = getHandlers(objectName, NAMESPACE + 'After_Delete__c');
      }
      when AFTER_UNDELETE {
        handlers = getHandlers(objectName, NAMESPACE + 'After_Undelete__c');
      }
    }

    if (!handlers.isEmpty()) {
      for (System_TriggerHandler__mdt handler : handlers) {
        SystemTriggerHandler_INTF handlerInterface = null;

        try {
          Type classType = Type.forName(handler.Class__c);
          handlerInterface = (SystemTriggerHandler_INTF) classType.newInstance();
        } catch (Exception ex) {
          System.debug(LoggingLevel.ERROR, ex.getStackTraceString());
        }

        if (handlerInterface != null) {
          handlerInterface.execute(Trigger.old, Trigger.new);
        }
      }
    }
  }

  private static System_TriggerHandler__mdt[] getHandlers(
    String objectName,
    String filterField
  ) {
    String query = 'SELECT Class__c FROM System_TriggerHandler__mdt WHERE {FIELD} = true ';
    query += 'AND Active__c = true AND Object__c = :objectName ORDER BY Load_Order__c';

    return (System_TriggerHandler__mdt[]) Database.query(
      query.replace('{FIELD}', filterField)
    );
  }
}
