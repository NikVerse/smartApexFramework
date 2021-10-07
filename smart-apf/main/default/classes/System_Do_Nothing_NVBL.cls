/**
 * @File Name          : System_Do_Nothing_NVBL.cls
 * @Description        : 
 * @Author             : Smart Apps Pty Ltd
 * @Group              : 
 * @Last Modified By   : SmartApps Pty Ltd
 * @Last Modified On   : 05-10-2021
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author                    Modification
 *==============================================================================
 * 1.0    13/8/2019, 11:10:23 AM   Smart Apps Pty Ltd     Initial Version
**/
public class System_Do_Nothing_NVBL {
    @InvocableMethod
    public static void doNothing() {
        system.debug('');
    }
}