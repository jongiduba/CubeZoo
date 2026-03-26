/**
 * RecordLifecycleTrigger
 * Manages the lifecycle and workflow logic for records
 * Evaluates technical judgement in trigger design and execution
 */
trigger RecordLifecycleTrigger on Account (before insert, after insert, before update, after update) {
    
    if (Trigger.isBefore && Trigger.isInsert) {
        // Handle before insert logic
        RecordLifecycleHandler.beforeInsert(Trigger.new);
    }
    
    if (Trigger.isAfter && Trigger.isInsert) {
        // Handle after insert logic
        RecordLifecycleHandler.afterInsert(Trigger.new);
    }
    
    if (Trigger.isBefore && Trigger.isUpdate) {
        // Handle before update logic
        RecordLifecycleHandler.beforeUpdate(Trigger.new, Trigger.oldMap);
    }
    
    if (Trigger.isAfter && Trigger.isUpdate) {
        // Handle after update logic
        RecordLifecycleHandler.afterUpdate(Trigger.new, Trigger.oldMap);
    }
}
