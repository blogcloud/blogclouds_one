
{if $ErrorMsg}
<script>
$(function () {
  toastr.error('{$ErrorMsg}');
});
</script>
{else /}

    {if $Action == "upgrade_configoption_page"}
					{foreach $UpgradeConfig.host_config_options as $host_config}
						<div class="form-group row configureproduct" style="display:none;">   
							<label class="btn btn-primary btn-sm active">
								<input id="config{$host_config.configid}_{$host_config.optionid}" type="radio" checked="" name="configoption[{$host_config.configid}]"  value="{if $host_config.qty>0}{$host_config.qty}{else/}{$host_config.optionid}{/if}" >
							</label>
                        </div>      
                    {/foreach}
                    <form data-class="configoption_form">
                        
						{foreach $UpgradeConfig.host as $option}
                        {if $option.option_type==1}
                          <div class="form-group row configureproduct">
                            <label for="example-search-input" class="col-md-2 col-form-label">{$option.option_name}
                            </label>
                            <div class="col-md-3">										
                              <select id="config{$option.oid}" name="configoption[{$option.oid}]" class="form-control selectpicker" data-style="btn-default">
                                {foreach $option.sub as $sub}
                                <option id="sub{$sub.id}" {if $option.subid==$sub.id} selected="" {/if} value="{$sub.id}">{$sub.option_name}</option>
                                {/foreach}
                              </select>
                            </div>
                          </div>
                          {elseif $option.option_type==2 /}
                          <div class="form-group row configureproduct">   
                            <label for="example-search-input" class="col-md-2 col-form-label">{$option.option_name}</label> 
                            <div class="col-md-10"> 
                              {foreach $option.sub as $sub_key=>$sub_val}
                              <div class="form-check mb-3">
                                <input id="config{$option.oid}_{$sub_val.id}" type="radio" name="configoption[{$option.oid}]" value="{$sub_val.id}" class="form-check-input" {if $option.subid==$sub_val.id}checked=""{/if}>
                                <label class="form-check-label" for="config{$option.oid}_{$sub_val.id}">{$sub_val.option_name}</label>
                                </div>
                              {/foreach}								
                            </div>              
                          </div>
                          {elseif $option.option_type==3 /}
                          <div class="form-group row configureproduct">   
                            <label for="example-search-input" class="col-md-2 col-form-label">{$option.option_name}</label> 
                            <div class="col-md-10"> 
                              {foreach $option.sub as $sub_key=>$sub_val}
                              <div class="custom-control custom-checkbox mb-3">
                                <input id="config{$option.oid}_{$sub_val.id}" type="checkbox" name="configoption[{$option.oid}]" class="custom-control-input" {if $option.subid==$sub_val.id} checked="" {/if}  value="{$sub_val.id}">
                                <label class="custom-control-label" for="config{$option.oid}_{$sub_val.id}">{$sub_val.option_name}</label>
                              </div>
                              {/foreach}	
                            </div>              
                          </div>
                          {elseif $option.option_type==4 || $option.option_type==7 || $option.option_type==9 || $option.option_type==11 || $option.option_type==14 || $option.option_type==15 || $option.option_type==16 || $option.option_type==17 || $option.option_type==18 || $option.option_type==19  /}
                          <div class="form-group row configureproduct">
                            <label for="example-search-input" class="col-md-2 col-form-label">{$option.option_name}</label>
                            <div class="col-md-10 d-flex align-items-center" style="padding:0px">
                              <!-- <input type="range" min="{$option.qty_minimum}" max="{$option.qty_maximum}" value="{$option.qty}" data-sub='{:json_encode($option.sub)}'  class="form-control-range configoption_range"> -->
                              <input type="range" min="{$option.qty_minimum}" max="{$option.qty_maximum}" qty_stage="{$option.qty_stage == 0 ? 1 : $option.qty_stage}" value="{$option.qty}" data-sub='{:json_encode($option.sub)}'  class="form-control-range configoption_range float-left mr-2"  style="width: 80%;">
                              <input id="config{$option.oid}" data-type="number" class="col-md-1 form-control form-control-sm configoption_range_val" name="configoption[{$option.oid}]"  onkeydown="numberKeyup(this)" type="text" min="{$option.qty_minimum}" max="{$option.qty_maximum}" qty_stage="{$option.qty_stage == 0 ? 1 : $option.qty_stage}"  value="{$option.qty}" >
                              <span>{$option.unit}</span>
                                <!--{if $option.option_type == '4' || $option.option_type == '15'}
                                <span>???</span>
                              {elseif $option.option_type == '7' || $option.option_type == '16'}
                                <span>???</span>
                              {elseif $option.option_type == '9' || $option.option_type == '17'}
                                <span>GB</span>
                              {elseif $option.option_type == '11' || $option.option_type == '18'}
                                <span>Mbps</span>
                              {elseif $option.option_type == '14' || $option.option_type == '19'}
                                <span>GB</span>
                              {/if}-->
                            </div>
                          </div>
                          {elseif $option.option_type==6 || $option.option_type==8 || $option.option_type==10 || $option.option_type==13 /}
                          <div class="form-group row configureproduct">   
                            <label for="example-search-input" class="col-md-2 col-form-label">{$option.option_name}</label> 
                            <div class="col-md-10"> 
                              <div class="btn-group btn-group-toggle mt-2 mt-xl-0" data-toggle="buttons">
                                {foreach $option.sub as $sub_key=>$sub_val}
                                <label class="btn btn-primary btn-sm {if $option.subid==$sub_val.id}active{/if}">
                                  <input id="config{$option.oid}_{$sub_val.id}" type="radio" {if $option.subid==$sub_val.id}checked="" {/if} name="configoption[{$option.oid}]"  value="{$sub_val.id}" > {$sub_val.option_name}
                                </label>
                                {/foreach}	
                              </div>
                            </div>              
                          </div>
                          {/if}
                        {/foreach}
						
						
						
                    </form>
                   <div class="modal-footer">
                      <button type="button" class="btn btn-primary waves-effect waves-light submit">?????????</button>
                      <button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal">??????</button>
                  </div>




    <script>
		var UpgradeConfigStepOne=$('#modalUpgradeConfigStepOne form').serialize();
        $('#modalUpgradeConfigStepOne .submit').on('click', function(){
			if($('#modalUpgradeConfigStepOne form').serialize()==UpgradeConfigStepOne) return false;
            if(!$(this).data('submit')){
                $(this).data('submit', 1);
				$(this).prepend('<i class="bx bx-loader bx-spin font-size-16 align-middle mr-2"></i>')
                let _this = $(this);
                $.ajax({
                    url: "/servicedetail?id={$Think.get.id}&action=upgrade_config",
                    type: 'POST',
                    data: $('#modalUpgradeConfigStepOne form').serialize() + '&action=upgrade_config',
                    success: function(res){
                        if(res.indexOf('modalUpgradeConfigStepTwo') > -1){
                            $('#modalUpgradeConfigStepOne').modal('hide')
                            $('.modal-backdrop.fade.show').remove()

                            if($('#modalUpgradeConfigStepTwoDiv').length == 0){
                                $("#upgradeConfigDiv").after('<div id="modalUpgradeConfigStepTwoDiv"></div>');
                            }
                            $('#modalUpgradeConfigStepTwoDiv').html(res);

                            //$("#upgradeConfigDiv").html(res);
                            $('#modalUpgradeConfigStepTwo').modal("show");
                        }else if(res.indexOf('<script>') === 0){
                            $("#upgradeConfigDiv").append(res);
                        }
                        _this.removeData('submit')
						_this.html("?????????");
                    },
                    error: function(){
                        _this.removeData('submit')
						_this.html("?????????");
                    }
                })
            }
        })
    </script>


<link rel="stylesheet" href="/themes/clientarea/default/assets/libs/bootstrap-select/css/bootstrap-select.min.css?v={$Ver}">
<script src="/themes/clientarea/default/assets/libs/bootstrap-select/js/bootstrap-select.min.js?v={$Ver}"></script>
<script>
var links={:json_encode($UpgradeConfig.links)};
$('.selectpicker').selectpicker();
//??????
$("form[data-class=\"configoption_form\"] select").change(function(){
	configoption_ajax();
})
//??????
$('form[data-class="configoption_form"] input[type="radio"],form[data-class="configoption_form"] input[type="checkbox"]').click(function(){
    configoption_ajax();
})
$(".configoption_range").mousedown(function(){
	$(this).data("active",true);
});
$(".configoption_range").mousemove(function(){
	rangeChange($(this));
	$(this).removeData("active");
	configoption_ajax();
});
var range = 0;
var dataSub;
var sectionShow;
function rangeNum(val,min,max,qty_stage){
    sectionShow = false;
    if(val%qty_stage == 0 || val == min || val == max) {
        dataSub.map(item => {
            if(val >= item.qty_minimum && val<=item.qty_maximum) {
                sectionShow = true;
            }
        })
        if(sectionShow) {
            range = val;
            return
        } else {
            val++;
            rangeNum(val,min,max,qty_stage)
        }
    } else {
        val++;
        rangeNum(val,min,max,qty_stage)
    }
}
function rangeChange(_this) {
    let qty_stage = parseInt($(_this).attr('qty_stage'));
    let minNum = parseInt($(_this).attr('min'));
    let maxNum = parseInt($(_this).attr('max'));
    dataSub = JSON.parse($(_this).attr('data-sub'));
	//if($(_this).data("active")){
		range = $(_this).val();
        rangeNum(parseInt(range),parseInt(minNum),parseInt(maxNum),parseInt(qty_stage));
        // if (range_sub($(_this), range)) {
        //     $(_this).siblings(".configoption_range_val").val(range);		
        // } else {
        //     // $(_this).val($(_this).siblings(".configoption_range_val").val());
        //     $(_this).val(range);
        // }
        $(_this).siblings(".configoption_range_val").val(range);		
        $(_this).val(range);
        $(_this).siblings('.range_none').each(function(){
            if(parseFloat($(this).attr('title')) < parseFloat(range)) {
                $(this).hide();
            } else {
                $(this).show();
            }
        })
        let blNum = (parseInt(range) - parseInt(minNum)) / (parseInt(maxNum) - parseInt(minNum)) * 100
        $(_this).css( 'background', 'linear-gradient(to right, #2948df, #F1F3F8 ' + blNum + '%, #F1F3F8)' );
	//}
}
// ???????????????
$(".main-content").on("touchend",".configoption_range", function(e) {
    rangeChange(this)
})
$(".main-content").on("touchmove",".configoption_range", function(e) {
    rangeChange(this)
 })

$(document).on('click',':not(.configoption_range_val)',function(){
	$(".configoption_range_val").each(function (i) {
		if($(this).data("active")){
			$(this).removeData("active");
			numberKeyup2($(this));
		}	
	})
})

function numberKeyup(_this) {
	$(_this).data("active",true);
}
function numberKeyup2(_this) {
    //??????
    _this.val(_this.val().replace(/[^\d]/g, ''));
    var min = _this.attr("min");
    var max = _this.attr("max");
    var val = (min != "") ? (min) : "0";
    if (_this.val() == "") _this.val(val);
    var number = _this.val();
    if (range_sub(_this.siblings(".configoption_range"), number)) {
        _this.siblings(".configoption_range").val(number);

    } else {
        _this.val(_this.siblings(".configoption_range").val());
        number = _this.siblings(".configoption_range").val()
    }
    let blNum = (parseInt(_this.val()) - parseInt(min)) / (parseInt(max) - parseInt(min)) * 100
    _this.siblings(".configoption_range").css( 'background', 'linear-gradient(to right, #2948df, #F1F3F8 ' + blNum + '%, #F1F3F8)' );
    if($(_this).val()%$(_this).attr('qty_stage')!=0 && $(_this).val() != $(_this).attr('min') && $(_this).val() != $(_this).attr('max')) {
        toastr.error(`?????????${$(_this).attr('qty_stage')}?????????`);
        _this.val($(_this).attr('min'));
        _this.siblings(".configoption_range").css('background','#ebeff4').val($(_this).attr('min'));
    }
    _this.siblings('.range_none').each(function(){
        if(parseFloat($(this).attr('title')) < parseFloat(number)) {
            $(this).hide();
        } else {
            $(this).show();
        }
    })
    configoption_ajax();
}

//??????
function range_sub (range, val) {
    var sub = range.data("sub");
    var range_v = 0, range_i;
    $.each(sub, function (i, v) {
        range_i = i + 1;
        if (v.qty_minimum > val || v.qty_maximum < val) range_v += 1;
    })
    if (range_i == range_v) return false;
    return true;
}
config_options_links();
function configoption_ajax(){
	
	config_options_links();//???????????????????????????????????????????????????????????????
	$('.selectpicker').selectpicker("refresh");
}
window.onload=function(){
	configoption_ajax();
}

//???????????????
function config_options_links () {
    if (!links) return false;
    clear_disabled();
	var config_result_array={};var key_num=0;
    $.each(links, function (key, val) {
        //??????
        var configcondition = config_condition(val);
        
        // console.log(val.result);
        //??????
        if (configcondition) {
			$.each(val.result, function (result_key, result_val) {
				var val_config={},sneq={},seq={},config_result_json={};
				if(config_result_array[result_val.config_id]==undefined) config_result_array[result_val.config_id]={};
				else config_result_json=config_result_array[result_val.config_id];
				//console.log(config_result_json);
				val_config['config_id']=result_val.config_id;							
				val_config['sneq']=config_result_json.sneq;
				val_config['seq']=config_result_json.seq;
				if(result_val.relation=="sneq"){
					if(!config_result_json.hasOwnProperty('sneq')){	
						sneq=result_val.sub_id;
					}else{
						$.each(config_result_json.sneq, function (seq_key, seq_val) {
							sneq[seq_key]=seq_val;
						});
						$.each(result_val.sub_id, function (seq_key, seq_val) {
							sneq[seq_key]=seq_val;
						});
					}
					val_config['sneq']=sneq;
				}else if(result_val.relation=="seq"){
					if(!config_result_json.hasOwnProperty('seq')){		
						seq=result_val.sub_id;
					}else{
						$.each(config_result_json.seq, function (seq_key, seq_val) {
							seq[seq_key]=seq_val;
						});
						$.each(result_val.sub_id, function (seq_key, seq_val) {
							seq[seq_key]=seq_val;
						});						
					}
					val_config['seq']=seq;
				}							
				config_result_array[result_val.config_id]=val_config;
				
			});
			//console.log(val.result);
            //config_result(val.result);
        }
		
    });
	$.each(config_result_array, function (key, val) {
		var seq_sub_id={},result={},result_v={};
		if(val.seq && val.sneq){			
			$.each(val.seq, function (seq_key, seq_val) {
				$.each(val.sneq, function (sneq_key, sneq_val) {
					if(sneq_key!=seq_key){
						seq_sub_id[seq_key]=seq_val;
					}
				})
				
			})
			result_v['config_id']=val.config_id;
			result_v['relation']="seq";
			result_v['sub_id']=seq_sub_id;
		}else if(val.seq){
			result_v['config_id']=val.config_id;
			result_v['relation']="seq";
			result_v['sub_id']=val.seq;			
		}else if(val.sneq){
			result_v['config_id']=val.config_id;
			result_v['relation']="sneq";
			result_v['sub_id']=val.sneq;
		}
		result[0]=result_v;
		config_result(result);
		//console.log(result);
    });
	
	//console.log(config_result_array);
	
}
//??????disabled
function clear_disabled () {
    $(".configureproduct input").parent().removeClass("disabled");
    $(".configureproduct input").removeAttr("disabled");
    $(".configureproduct select option").removeAttr("disabled");
    $(".configureproduct select").removeClass("disabled");
}
//????????????????????????
function config_condition (condition) {
    var _condition = false, _condition2 = true;
    if (condition.relation == "seq") {
        $.each(condition.sub_id, function (sub_key, sub_val) {
            if ($("#config" + condition.config_id).length > 0) {
                conditionTagName = $("#config" + condition.config_id)[0].tagName.toLowerCase();
                if (conditionTagName == "select" && $("#config" + condition.config_id).val() == sub_key) {
                    _condition = true;
                } else if (conditionTagName == "input" && $("#config" + condition.config_id).val() >= sub_val.qty_minimum && $("#config" + condition.config_id).val() <= sub_val.qty_maximum) {
                    _condition = true;
                }

            } else if ($("#config" + condition.config_id + "_" + sub_key).length > 0) {
                if ($("#config" + condition.config_id + "_" + sub_key + ":checked").val() == sub_key) {
                    _condition = true;
                }
            }
        });
    } else if (condition.relation == "sneq") {
        $.each(condition.sub_id, function (sub_key, sub_val) {
            if ($("#config" + condition.config_id).length > 0) {
                conditionTagName = $("#config" + condition.config_id)[0].tagName.toLowerCase();
                if (conditionTagName == "select") {
					if($("#config" + condition.config_id).val() != sub_key){
						_condition = true; 
					}else{
						_condition2=false;
					}
                } else if (conditionTagName == "input") {
                    if($("#config" + condition.config_id).val() <= sub_val.qty_minimum || $("#config" + condition.config_id).val() >= sub_val.qty_maximum){
						_condition = true; 
					}else{
						_condition2=false;
					}
                }

            } else if ($("#config" + condition.config_id + "_" + sub_key).length > 0) {
                if ($("#config" + condition.config_id + "_" + sub_key + ":checked").val() != sub_key) {
                    _condition = true;
                }else{
					_condition2=false;
				}
            }
            //console.log($("#config"+condition.config_id).val());
            //console.log(sub_key);
        });
        //_condition=false;
    }
	if(_condition2==false) return _condition2;
    return _condition;
}
//??????
function config_result(result){ 
	$.each(result,function(result_key,result_val){
		var       configoption=$("input[name='configoption["+result_val.config_id+"]']");//??????????????????????????????

        //console.log(result_val);
        var conditionConfig = "#config" + result_val.config_id;
        if ($(conditionConfig).length > 0) {
            //console.log($(conditionConfig).length);
            conditionTagName = $(conditionConfig)[0].tagName.toLowerCase();
            if (result_val.relation == "seq") {
                if (conditionTagName == "select") {
					var selected_val=$(conditionConfig).val();
                    $(conditionConfig).find("option").attr("disabled", "disabled");
                } else if (conditionTagName == "input") {
                    $(conditionConfig).attr("disabled", "disabled");
                    $(conditionConfig).parent().addClass("disabled");
                }
            } else {
                if (conditionTagName == "select") {
					var selected_val=$(conditionConfig).val();
                    $(conditionConfig).find("option").removeAttr("disabled");
                } else if (conditionTagName == "input") {
                    $(conditionConfig).removeAttr("disabled");
                    $(conditionConfig).parent().removeClass("disabled");
				}
			}

		}else{
			if(result_val.relation=="seq"){
				configoption.attr("disabled","disabled");
                configoption.parent().addClass("disabled");
			}else if( result_val.relation=="sneq"){
				configoption.removeAttr("disabled");
                configoption.parent().removeClass("disabled");
			}
		}
		var subSeq=[],subSeqChecked=false,subSneq=[],subSneqChecked=false,
		subSeqNumber=[],subSeqNum=false,subSeqQtyMin;
		var count=Object.keys(result_val.sub_id).length,num=0;
		$.each(result_val.sub_id,function(key,val){
			var conditionConfigId=conditionConfig+"_"+key;
			
			if($(conditionConfig).length > 0){
			//?????????ID
				condition_subid=Number($(conditionConfig).val());
				
				if(result_val.relation=="seq"){
				//????????????????????? ????????????????????????????????????
					
					if($(conditionConfig).data("type")=="number"){
					//????????????
						$(conditionConfig).removeAttr("disabled");
                        $(conditionConfig).parent().removeClass("disabled");
                        if (!subSeqQtyMin) subSeqQtyMin = val.qty_minimum;
                        if (condition_subid < val.qty_minimum || condition_subid > val.qty_maximum) {
                            num++;
                            if (count == num) {
                                number = subSeqQtyMin;
                                $(conditionConfig).val(number);
                                $(conditionConfig).siblings(".configoption_range").val(number);
                            }
                            //console.log("count:"+count);
                            //console.log("num:"+num);
                        }
                    } else {
                        $(conditionConfig).find("#sub" + key).removeAttr("disabled");
                        //$(conditionConfig).find("#sub" + key).prop("selected", false);
                        //if ($(conditionConfig).is(":selected")) subSneqChecked = true;
						if (selected_val==$("#sub" + key).val()) subSeqChecked = true;
                        subSeq[key] = conditionConfig;
                    }
                } else if (result_val.relation == "sneq") {
                    //???????????????????????? ?????????????????????
                    if ($(conditionConfig).data("type") == "number") {
                        //????????????

                    } else {
                        $(conditionConfig).find("#sub" + key).attr("disabled", "disabled");
                        //$(conditionConfig).find("#sub" + key).prop("selected", false);
                        //if ($(conditionConfig).is(":selected")) subSeqChecked = true;
						if (selected_val==$("#sub" + key).val()) subSneqChecked = true;
                        subSneq[key] = conditionConfig;
                    }

                }
            } else if ($(conditionConfigId).length > 0) {
                //???????????????ID
                if (result_val.relation == "seq") {
                    //?????????????????????
                    subSeq[key] = conditionConfigId;
                    if ($(conditionConfigId).is(":checked")) subSeqChecked = true;
                    $(conditionConfigId).removeAttr("disabled");
                    $(conditionConfigId).parent().removeClass("disabled");
				}else if( result_val.relation=="sneq"){
					subSneq[key]=conditionConfigId;
					if($(conditionConfigId).is(":checked")) subSneqChecked=true;
					//???????????????????????? ?????????????????????							
					$(conditionConfigId).attr("disabled","disabled");
                    $(conditionConfigId).parent().addClass("disabled");
					$(conditionConfigId).prop("checked",false);
					$(conditionConfigId).parent().removeClass("active");
				}
			}
			
		});
		var checkedSubSeq=false,checkedSnubSeq=false;
		if($(conditionConfig).length > 0){
		//conditionConfig ??????????????????
			$.each($(conditionConfig).find("option"),function(){
				if(subSeq.length>0){
					//console.log(subSeq);
					if($(this).attr("disabled")){
						$(this).prop("selected",false);						
					}else if(!checkedSubSeq && subSeq[$(this).val()] && !subSeqChecked){					
						$(this).prop("selected",true);						
						checkedSubSeq=true;
					} 
				}else if(subSneq.length>0){					
					if($(this).attr("disabled")){
						$(this).prop("selected",false);						
					}else if(!checkedSnubSeq  && subSneqChecked){
						$(this).prop("selected",true);						
						checkedSnubSeq=true;
					}
				}
				
			});
		}else{
		//conditionConfigId ??????????????????
			$.each(configoption,function(i,v){
				if(subSeq.length>0){					
					//console.log(subSeq);
					if($(this).attr("disabled")){
						//console.log($(this).val());
						$(this).prop("checked",false);
						$(this).parent().removeClass("active");
					}else if(!checkedSubSeq && subSeq[$(this).val()] && !subSeqChecked){					
						$(this).prop("checked",true);							
						$(this).parent().addClass("active");
						checkedSubSeq=true;
					} 
				}else if(subSneq.length>0){
					
					if($(this).attr("disabled")){
						$(this).prop("checked",false);
						$(this).parent().removeClass("active");
					}else if(!checkedSnubSeq  && subSneqChecked){
						$(this).prop("checked",true);
						$(this).parent().addClass("active");
						checkedSnubSeq=true;
					}
				}
				
			});
		}
	});
}
</script>

    
    {else /}
    <div class="modal fade" id="modalUpgradeConfigStepTwo" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered " style="min-width: 42%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title mt-0" id="myLargeModalLabel">??????</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <input type="hidden" value="{$Token}" style="display: none;" />

                        <div class="table-responsive">
                            <table class="table table-centered mb-0 table-nowrap">
                                <thead class="thead-light">
                                    <tr>
                                        <th scope="col">?????????</th>
                                        <th scope="col">?????????</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach $UpgradeConfig.alloption as $item}
                                    <tr>
                                        <td scope="row">
                                            <h5 class="font-size-14 text-truncate" style="position: relative;">{$item.option_name}:{if $item.old_qty} {$item.old_qty} {else/}{$item.old_suboption_name}{/if}<img style="position: absolute; width:16px; right:20%;top:3px" src="/themes/clientarea/default/assets/images/left-icon.png" /></h5>
                                        </td>
                                        <td>
                                            <h5 class="font-size-14 text-truncate">{$item.option_name}:{if $item.old_qty} {$item.qty} {else/}{$item.suboption_name}{/if}</h5>
                                        </td>
                                        
                                    </tr>
                                    {/foreach}
                                    
                                </tbody>
                            </table>
                        </div>
                        <script>
                        $('.get-input-focus').focus(function(){
                            $('.use_promo_code').removeAttr('disabled').removeClass('focus-button');
                            $('.tips-text,.clear-icon').show();
                            $('.tips-text').css({'color':'#999'})
                            $(this).css({'border':'1px solid #6064FF','color':'#6064FF'});
                            $('.error-text').hide();
                            $('.change-height').css({'height':'37px'})
                        })
                        $('.get-input-focus').blur(function(){
                            if($('.get-input-focus').val().trim() == '') {
                                $('.use_promo_code').addClass('focus-button').attr('disabled','disabled');
                                $('.tips-text,.clear-icon').hide();
                                $(this).css({'border':'1px solid #ced4da','color':'#6064FF'})
                            }
                        })
                        $(".modal-body").on('click','.tips-div font',function(){
                            $('.tips-div').hide()
                        })
                        $(".modal-body").on('click','.clear-icon',function(){
                            $('.get-input-focus').val('').focus();
                        })
                        </script>
                        <div class="yhm-flex">
                            <div style="width:60%">
                                <div class="d-flex mb-3 change-height"style="position:relative; margin-bottom: 0px !important">
                                <span class="tips-text">?????????</span>
                                <img class="clear-icon" src="/themes/clientarea/default/assets/images/clear-icon.png" />
                                <span class="error-text"></span>
                                    {if !$UpgradeConfig.promo_code}
                                    <input type="text" name="pormo_code" class="form-control get-input-focus" value="{$UpgradeConfig.promo_code}" placeholder="?????????" style="width:108px"/>
                                    <button class="btn btn-primary ml-2 use_promo_code focus-button" disabled type="button" style="width: 56px; height:38px">??????</button>
                                    {else /}
                                        <span class="tips-text" style="display: block;">?????????</span>
                                    <span class="form-control" style="width:108px">{$UpgradeConfig.promo_code}</span>
                                    <button class="btn btn-primary ml-2 remove_promo_code" type="button" style="width: auto; height:38px" >??????</button>
                                    {/if}
                                </div>
                                {if $UpgradeConfig.has_renew == true}
                                    <div class="tips-div"><img src="/themes/clientarea/default/assets/images/warning-icon.png">???????????????????????????????????????????????????????????????<font>x</font></div>
                                {/if}
                            </div>
                            <div style="width: 40%;">
                                <div class="text-right font-size-18" style="font-size: 12px !important; color:#999 !important; margin-bottom:10px !important">
                                    ?????????<span class="text-primary" style="color:#6064FF !important;font-size:12px !important">{$UpgradeConfig.currency.prefix}<font style="font-weight: bold !important; font-size:18px !important">{$UpgradeConfig.total}</font>{$UpgradeConfig.currency.suffix}/{$UpgradeConfig.billingcycle_zh}</span>
                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="hid" style="display: none;" value="{$Think.get.id}">
                        {foreach $UpgradeConfig.configoptions as $key=>$item}
                        <input type="hidden" style="display: none;" name="configoption[{$key}]" value="{$item}">
                        {/foreach}
                    </form>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary waves-effect waves-light submit">?????????</button>
                        <button type="button" class="btn btn-secondary waves-effect goback">??????</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modalUpgradeConfigStepSure" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered ">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title mt-0" id="myLargeModalLabel">??????</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p style="line-height: 100px;">?????????????????????????????????????????????????????????????????????</p>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary waves-effect waves-light submit">??????</button>
                        <button type="button" class="btn btn-secondary waves-effect goback">??????</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
    function getUrlParam(name) {

    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //??????????????????????????????????????????????????????

    var r = window.location.search.substr(1).match(reg); //??????????????????

    if (r != null) return unescape(r[2]);

    return null; //???????????????

}
      var product_type = '{$Detail.host_data.type}'
     var flag = true
       $('#modalUpgradeConfigStepTwo .submit').on('click', function(){
         if(flag){
                $('#modalUpgradeConfigStepTwo').modal('hide')
                            $('.modal-backdrop.fade.show').remove()
             $('#modalUpgradeConfigStepSure').modal("show");
         }
       })
       $('#modalUpgradeConfigStepSure .submit').on('click', function(){
         if(flag){
           flag = false
			$(this).prepend('<i class="bx bx-loader bx-spin font-size-16 align-middle mr-2"></i>');
			let _this = $(this);
            let postRequest = function(){
                let url = "/upgrade/checkout_config_upgrade";
                $.ajax({
                    url: "/upgrade/checkout_config_upgrade",
                    data: $("#modalUpgradeConfigStepTwo form").serialize(),
                    type: "POST",
                    success: function(res){
                      // flag = true
                        if(res.status == 200){
                            window.location.href = "/viewbilling?id="+ res.data.invoiceid;
                        }else if(res.status == 1001){
                            toastr.success(res.msg)
                            window.location.reload()
                        }else{
                            toastr.error(res.msg)
                        }
             $('#modalUpgradeConfigStepSure').modal("hide");
                    },
                    error: function(){
                      //  flag = true
             $('#modalUpgradeConfigStepSure').modal("hide");
                    }
                })
            };
            if(product_type == 'cloud' || product_type == 'dcimcloud'){
                $('#modalUpgradeConfigStepTwo').modal('hide');
                $('.modal-backdrop.fade.show').remove()
                let content = "<div>"
                            + "<p>???????????????????????????????????????????????????</p>"
                            + "<p> ????????????????????????????????????????????????????????????????????????????????? </p>"
                            + "<p> ????????????????????????????????????????????????????????????????????????????????????????????????????????????</p>"
                            + "</div>";
                getModalConfirm(content, function(){
                    postRequest();
                });
            }else{
                postRequest();
            }
             }
        })
       

        $('#modalUpgradeConfigStepTwo .use_promo_code').on('click', function(){
            if(!$(this).data('submit')){
                $(this).data('submit', 1)
				/* $(this).prepend('<i class="bx bx-loader bx-spin font-size-16 align-middle mr-2"></i>'); */
                let _this = $(this)
                $.ajax({
                    url: "/servicedetail?id={$Think.get.id}&action=upgrade_config_use_promo_code",
                    type: 'POST',
                    data: $('#modalUpgradeConfigStepTwo form').serialize(),
                    success: function(res){
                        if(res.indexOf('modalUpgradeConfigStepTwo') > -1){
                            $('#modalUpgradeConfigStepTwo').modal('hide');
                            $('.modal-backdrop.fade.show').remove()
                            $("#modalUpgradeConfigStepTwoDiv").html(res);
                            $('#modalUpgradeConfigStepTwo').modal("show");
                        }else if(res.indexOf('<script>') === 0){
                            $("#upgradeConfigDiv").append(res);
                        }
                        _this.removeData('submit')
						_this.html("??????");
                    },
                    error: function(){
                        _this.removeData('submit')
						_this.html("??????");
                    }
                })
                $.ajax({
                    url: "/upgrade/add_promo_code_product",
                    type: 'POST',
                    data: {
                        hid:getUrlParam('id'),
                        pormo_code: $('.get-input-focus').val()
                    },
                    success: function(res){
                        if(res.status != 200) {
                            $('.get-input-focus').css({'border':'1px solid #FF0000','color':'#999999'}).blur();
                            $('.use_promo_code').addClass('focus-button').attr('disabled','disabled');
                            $('.tips-text').css({'color':'#FF0000'})
                            $('.change-height').css({'height':'60px'})
                            $('.error-text').html(res.msg).show();
                        }
                    }
                })
            }
        })

        $('#modalUpgradeConfigStepTwo .remove_promo_code').on('click', function(){
            if(!$(this).data('submit')){
                $(this).data('submit', 1)
				$(this).prepend('<i class="bx bx-loader bx-spin font-size-16 align-middle mr-2"></i>');
                let _this = $(this)
                $.ajax({
                    url: "/servicedetail?id={$Think.get.id}&action=upgrade_config_remove_promo_code",
                    type: 'POST',
                    data: $('#modalUpgradeConfigStepTwo form').serialize(),
                    success: function(res){
                        if(res.indexOf('modalUpgradeConfigStepTwo') > -1){
                            $('#modalUpgradeConfigStepTwo').modal('hide');
                            $('.modal-backdrop.fade.show').remove()
                            $("#modalUpgradeConfigStepTwoDiv").html(res);
                            $('#modalUpgradeConfigStepTwo').modal("show");
                        }else if(res.indexOf('<script>') === 0){
                            $("#upgradeConfigDiv").append(res);
                        }
                        _this.removeData('submit')
						_this.html("??????");
                    },
                    error: function(){
                        _this.removeData('submit')
						_this.html("??????");
                    }
                })
            }
        })

        $('#modalUpgradeConfigStepTwo .goback').on('click', function(){
            $('#modalUpgradeConfigStepTwo').modal('hide');
            $('.modal-backdrop.fade.show').remove()
            $('#modalUpgradeConfigStepTwoDiv').html('');

            $('#modalUpgradeConfigStepOne').modal('show');
        })

        $('#modalUpgradeConfigStepSure .goback').on('click', function(){
            $('#modalUpgradeConfigStepSure').modal('hide');
            $('.modal-backdrop.fade.show').remove()

            $('#modalUpgradeConfigStepTwo').modal('show');
        })
    </script>
    {/if}
{/if}
<style>
.focus-button:disabled{
    background: #DFDFDF;
    border: 0;
    width: 56px;
    color: #fff;
    cursor: no-drop;
}
.tips-text{
    position: absolute;
    font-size: 12px;
    transform: scale(0.5);
    top: -4px;
    left: 0px;
    color: #999999;
    display: none;
}
.clear-icon {
    position: absolute;
    width: 13px;
    height: 13px;
    left: 88px;
    top: 11px;
    cursor: pointer;
    display: none;
}
.error-text {
    position: absolute;
    bottom: 0px;
    font-size: 12px;
    color: #999999;
    display: none;
}
.tips-div{
    width: 70%;
    height: auto;
    background: #FDF6EC;
    border: 1px solid #FFD89F;
    opacity: 1;
    border-radius: 2px;
    color: #E6A23C;
    font-size: 12px;
    padding-left: 2px;
    position: relative;
    display: flex;
    align-items: center;
    padding: 6px 0px;
    margin-top: 10px;
}
.tips-div img {
    width: 13.5px;
    height: 13.5px;
    margin-left: 16px;
    margin-right: 5px;
}
.tips-div font {
    position: absolute;
    right: 13px;
    top: 4px;
    font-size: 12px;
    cursor: pointer;
}
.yhm-flex{
    display: flex;
    place-items: flex-end;
    padding-bottom: 10px;
}
/* ??????????????? */
input[type='range'] {
    background: #F1F3F8;
    outline: none;
    -webkit-appearance: none; /*????????????????????????*/
    height: 4px; /*???????????????*/
    border-radius: 3px;
}
input[type="range"]::-webkit-slider-thumb {
     -webkit-appearance: none;
     width: 10px;
     height: 23px;
     background-color: #fff;
     /*box-shadow: 0 0 2px rgba(0, 0, 0, 0.3),
     0 3px 5px rgba(0, 0, 0, 0.2);*/
     cursor: pointer;
     border: 4px solid #2948DF;
     border-top-width: 5px;
     border-bottom-width: 5px;
     border-radius: 2px;
 }
 input[type="range"]::-moz-range-thumb {
      -webkit-appearance: none;
      width: 2px;
      height: 15px;
      background-color: #fff;
      /*box-shadow: 0 0 2px rgba(0, 0, 0, 0.3),
      0 3px 5px rgba(0, 0, 0, 0.2);*/
      cursor: pointer;
      border: 4px solid #2948DF;
      border-top-width: 5px;
      border-bottom-width: 5px;
      border-radius: 2px;
  }
.range_none{
    position: absolute;
    height: 3px;
    display: block;
    background: #DEDEDE;
    cursor: not-allowed
}
</style>
<!-- ?????????????????? -->
<script>
	$('.configoption_range').each(function(){
		let sub = $(this).data('sub');
		let max = parseFloat($(this).attr('max'));
		let min = parseFloat($(this).attr('min'));
		let inputWidth = parseFloat($(this).width());
		let oneWidth = inputWidth / (max - min)
		let keyArr = [];
		sub.map(item => {
			let itemMin = parseFloat(item.qty_minimum)
			let itemMax = parseFloat(item.qty_maximum)
			keyArr.push(itemMin)
			for(var i = itemMin; i<itemMax; i++) {
				keyArr.push(i)
			}
			keyArr.push(itemMax)
		})
		keyArr = Array.from(new Set(keyArr));
		for(var t = min; t<max; t++) {
			if(keyArr.indexOf(t) == -1) {
				$(this).after('<span class="range_none" title="'+t+'" style="width: '+oneWidth+'px; left: '+oneWidth*(t-min)+'px "></span>')
			}
		}
	})					
</script>
