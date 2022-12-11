function checkNullVal(val){
	if(typeof val == "undefined" || val == null){
		return '';
	}
	else {
		return val+'';
	}
}

function checkNullValR(val, replaceStr){
	if(typeof val == "undefined" || val == null){
		return replaceStr;
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

function priceWithComma(val){
	try {
		if(typeof val == "undefined" || val == null){
			return '0';
		}
		return (Math.round(val).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
	}
	catch(e){
		console.log(e);
		return '0';
	}
}

//새로고침
function fncRefresh(){
	$("#adv-search").find("input").val('');
	$("#adv-search").find("select").val('');
	findAll(0);
}

//부모창 새로고침
function fncParentRefresh(){
	window.opener.refresh();
}
