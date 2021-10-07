/**
 * @File Name          : System_GlobalConstant_MNGR.cls
 * @Description        : 
 * @Author             : Smart Apps Pty Ltd
 * @Group              : 
 * @Last Modified By   : SmartApps Pty Ltd
 * @Last Modified On   : 05-10-2021
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author                    Modification
 *==============================================================================
 * 1.0    5/8/2019, 10:51:29 AM   Smart Apps Pty Ltd     Initial Version
**/
public class System_GlobalConstant_MNGR {
    
    //Run Contact Creation
    public static Boolean isContactRequired = false;
    //Error Messages
    //public static final String ERR_MSG= Label.ERR_MSG;
    
    public static Boolean isTriggerRun = false;
    public static Boolean isUpdSessionsRun = false;
    public static Id getRecordTypeIdbyName(String objectName, String strRecordTypeName)
    {
        return  Schema.getGlobalDescribe().get(objectName).getDescribe().getRecordTypeInfosByName().get(strRecordTypeName).getRecordTypeId();
    }
    
    public static String getRecordTypeNameById(String objectName, Id strRecordTypeId)
    {
        return Schema.getGlobalDescribe().get(objectName).getDescribe().getRecordTypeInfosById().get(strRecordTypeId).getName();
    }
    
    public static String formatDate(Date d) {
        return d.year() + '-' + d.month() + '-' + d.day();
    }
    /*
    //This method needs to be fine tuned
    public static Id getNetworkId(Id userId){  
        String communityName = Label.COMMUNITY_NAME;
        List<NetworkMember> networkMembers = [select id,NetworkId from NetworkMember where Network.Name =:communityName and MemberId =:userId];
        if(networkMembers.isEmpty() ) return null;
        return networkMembers.get(0).NetworkId;
    }
    */
}