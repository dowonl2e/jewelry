function checkNullVal(val){
	if(typeof val == "undefined" || val == null){
		return '';
	}
	else {
		return val+'';
	}
}

function checkSubstringNullVal(val, startidx, endidx){
	if(typeof val == "undefined" || val == null){
		return '';
	}
	else {
		if(val.length < endidx){
			return val;
		}
		else {
			return val.substring(startidx, endidx);			
		}
	}
}

function addZeroFront(val, len){
	var addzeronum = checkNullVal(val);
	if(typeof val == "undefined" || val == null){
		return addzeronum;
	}
	else {
    while (addzeronum.length < len) {
        addzeronum = '0' + addzeronum;
    }
	}
	return addzeronum;
}

//데이터 없으면 삭제
function checkListNullParams(jsonObj){
	for(key in jsonObj) {
		if(jsonObj[key] == '')
			delete jsonObj[key];
	}
}