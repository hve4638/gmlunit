function GmlunitTcResultTimer(injected) constructor {
    injectedRef = weak_ref_create(injected);
    begintime = undefined;
    endtime = undefined;
    
    Start = function() {
    	begintime = get_timer();
    }
    
    Stop = function() {
        endtime = get_timer();
        
        if weak_ref_alive(injectedRef)
            injectedRef.ref.time = (endtime-begintime) / 1000000;
        else
            throw "Ref is dead."
    }
}