/**
 * @File Name          : SystemTriggerHandler_INTF.cls
 * @Description        :
 * @Author             : Smart Apps Pty Ltd
 * @Group              :
 * @Last Modified By   : SmartApps Pty Ltd
 * @Last Modified On   : 06-10-2021
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      		      Modification
 *==============================================================================
 * 1.0    5/8/2019, 9:47:59 AM   Smart Apps Pty Ltd     Initial Version
 **/
public interface SystemTriggerHandler_INTF {
  void execute(sObject[] oldRecords, sObject[] newRecords);
}
