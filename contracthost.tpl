<script type="text/javascript" src="/themes/clientarea/default/assets/js/jSignature.js"></script>
<script src="/themes/clientarea/default/assets/libs/moment/moment.js?v={$Ver}"></script>
<style>
  .seeInformationDiv {
      margin: 10px 0px;
    }

    .signContract-modal-dialog {
      max-width: 900px;
      margin: 1.75rem auto;
    }

    .contractfirstParty {
      display: flex;
      padding: 0px 70px;
    }

    .contractfirstPartyDiv div {
      height: 30px;
    }

    .contractfirstPartyDivTwo {
      margin-left: auto;
    }

    .select_Div {
      display: flex;
      justify-content: flex-end;
    }



    .enclosure {
      padding: 0px 40px;
    }

    .cost {
      border-top: 1px solid #eff2f7;
      border-left: 1px solid #eff2f7;
      border-right: 1px solid #eff2f7;
      width: 100%;
      height: 40px;
      line-height: 40px;
    }

    #signature {
      width: 100%;
      display: flex;
      justify-content: center;
    }

    .signatureCanvas {
      border: 1px dashed #000 !important;
    }
    .tip-color {
      color: #f46a6a;
    }

    .ml-5 {
      margin-left: 5px !important;
    }

    .mr-5 {
      margin-right: 5px !important;
    }

    .w-150 {
      width: 150px;
    }

    .d-flex-center {
      display: flex;
      align-items: center;
      flex-flow: wrap;
    }

    .search-label {
      white-space: nowrap;
    }

    .afc-table-search-flex {
      display: flex;
      justify-content: space-between;
      align-items: center;
      flex-flow: wrap;
    }

    .afc-modal-tip {
      color: #929292;
      margin-bottom: 10px;
    }

    .d-j-a-center {
      display: flex;
      justify-content: center;
      align-items: center;
      flex-flow: wrap;
    }

    #afcContent .control-label {
      margin-bottom: 0;
      text-align: right;
    }

    .afc-update-name {
      cursor: pointer;
      color: #1890ff;
    }

    .display {
      display: none;
    }

    @media screen and (max-width: 768px) {
      #afcContent .control-label {
        margin-bottom: 0;
        text-align: left;
      }
    }
    #signContractContent {
      padding: 20px 40px;
    }
    .clear-search {
      margin-left: 20px;
    }
    .dis-input:disabled {
      border: 0px;
      background: transparent;
    }
    #searchIcon {
      position: absolute;
      left: 10px;
      top: 14px;
      font-size: 18px;
      cursor: pointer;
    }
    #keywords {
      text-indent: 20px;
    }
    .red-color{
      color: red;
      display: none;
    }
  </style>
<div class="card">
  <div class="card-body">
    <!-- ????????????start -->
    <div class="alert alert-info" role="alert">
      <div>
        ???????????????????????????????????????????????????
      </div>
    </div>
    <!-- ????????????end -->
    <div class="table-container">
      <div class="table-header">
        <div class="table-search afc-table-search-flex">
          <div>
            ????????????????????????????????????
          </div>
          <div class="ml-5 d-flex-center">
            <div style="position: relative;">
              <input type="text" class="form-control w-150" id="keywords" placeholder="?????????">
              <i class="bx bx-search-alt search-icon" id="searchIcon"></i>
            </div>
            <span class="search-label ml-5">
                ???????????????
              </span>
            <select class="form-control" id="statusSel" title="???????????????" style="width: 150px" onchange="searchAll()">
              <option value="nextduedate">??????????????????</option>
              <option value="create_time">????????????</option>
            </select>
            <input class="form-control w-150 ml-5" id="startTime" type="date" onchange="searchAll()">
            <span class="ml-5 mr-5">???</span>
            <input class="form-control w-150" id="endTime" type="date" onchange="searchAll()">
            <button class="btn btn-default clear-search">??????</button>
          </div>
        </div>

      </div>
      <div class="table-responsive">
        <table class="table tablelist">
          <thead class="bg-light">
          <tr>
            <th prop="id">
              <span>??????ID</span>
            </th>
            <th>
              <span>????????????</span>
            </th>
            <th prop="subtotal">
              <span>??????</span>
            </th>
            <th prop="paid_time">
              <span>????????????</span>
            </th>
            <th prop="due_time">
              <span>??????????????????</span>
            </th>
            <!-- <th prop="status">
              <span>????????????</span>
            </th> -->
            <th prop="status">
              <span>????????????</span>
            </th>
            <th width="180px">
              <span>??????</span>
            </th>
          </tr>
          </thead>
          <tbody>
          {foreach $pageInfo.hosts as $item}
            <tr>
              <td><a href="/servicedetail?id={$item.id}"><span class="badge badge-light">{$item.id}</span></a></td>
              <td>{$item.name}{if $item.domain}-{$item.domain}{/if}{if $item.dedicatedip}-{$item.dedicatedip}{/if}</td>
              <td>{$pageInfo.currency.prefix}{$item.amount}</td>
              <td>{if $item.create_time}{$item.create_time|date="Y-m-d"}{else}-{/if}</td>
              <td>{if $item.nextduedate}{$item.nextduedate|date="Y-m-d"}{else}-{/if}</td>
              <!-- <td>
                <span class="badge relatedContract">{$item.pdf_num}</span>
              </td> -->
              <td>
                <span class="badge" style="color: {$item.status_zh.color}">{$item.status_zh.name}</span>
              </td>
              <td>
                {if $item.pdf_num && $item.pdf_status!=0}
                  <button class="btn btn-default btn-sm" disabled>????????????</button>
                {else}
                  <button onclick="createContract({$item.id})" class="btn btn-primary btn-sm">????????????</button>
                {/if}
              </td>
            </tr>
          {/foreach}
          </tbody>
        </table>
      </div>
      <!-- ???????????????????????? -->
      <div class="table-footer">
        <div class="table-tools ">
        </div>
        <div class="table-pagination">
          <div class="table-pageinfo mr-2">
            <span>??? {$pageInfo.count} ???</span>
            <span class="mx-2">??????
              <select name="limit" id="limitSel" style="width: 60px;border-color:#ddd;border-radius:4px;background:#fff">
                <option value="10" {if $pageInfo.limit==10}selected{/if}>10</option>
                <option value="15" {if $pageInfo.limit==15}selected{/if}>15</option>
                <option value="20" {if $pageInfo.limit==20}selected{/if}>20</option>
                <option value="50" {if $pageInfo.limit==50}selected{/if}>50</option>
                <option value="100" {if $pageInfo.limit==100}selected{/if}>100</option>
              </select>
            ???</span>
          </div>
          <ul class="pagination pagination-sm">
            {$pageInfo.pages}
          </ul>
        </div>
      </div>
    </div>

    <!-- ????????????Modal??? -->
    <div class="modal fade" id="afcModal" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="popTitle"> ??????????????????</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body" id="afcContent">
            <div class="afc-modal-tip">
              ??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
            </div>
            <form>
              <div class="form-group d-j-a-center">
                <label for="paName" class="col-sm-3 control-label"><span class="red-color">*</span>????????????</label>
                <span style="margin-left: 26px;">
                  {$data.client_data.companyname}
                </span>
                <div class="col-sm-4" style="margin-left: auto;">
                  <span class="afc-update-name" data-toggle="popover" data-placement="top" data-trigger="hover"
                        data-content="??????????????????????????????????????????????????????"><a href="/verified">????????????</a></span>
                </div>
              </div>
              <div class="form-group d-j-a-center">
                <label for="paAddress" class="col-sm-3 control-label"><span class="red-color">*</span>??????</label>
                <div class="col-sm-9">
                  <input type="text" value="{$data.client_data.address1}" disabled class="form-control dis-input" id="paAddress" placeholder="">
                </div>
              </div>
              <div class="form-group d-j-a-center">
                <label for="paPhone" class="col-sm-3 control-label"><span class="red-color">*</span>????????????</label>
                <div class="col-sm-9">
                  <input type="text" value="{$data.client_data.phonenumber}" class="form-control dis-input" disabled id="paPhone" placeholder="">
                </div>
              </div>
              <div class="form-group d-j-a-center">
                <label for="paEmail" class="col-sm-3 control-label"><span class="red-color">*</span>????????????</label>
                <div class="col-sm-9">
                  <input type="text" value="{$data.client_data.email}" class="form-control dis-input" disabled id="paEmail"
                         placeholder="">
                </div>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button id="afcCreateBtn" type="button" class="btn btn-primary">????????????</button>
            <button id="afcUpdateBtn" type="button" class="btn btn-outline-light">??????</button>
            <!-- ??????/?????? -->
            <button id="afcSaveBtn" type="button" class="btn btn-primary display">??????</button>
            <button id="afcCancelBtn" type="button" class="btn btn-outline-light display">??????</button>
          </div>
        </div>
      </div>
    </div>

  <!-- ?????????????????? -->
  <div class="modal fade" id="signContract" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
    aria-hidden="true">
    <div class="signContract-modal-dialog modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header" style="border-color: #fff;">
          <h5 class="modal-title" id="customTitle"></h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body" id="qdhtBody" style="max-height: 600px;overflow-y: auto;">
          <div class="content_html">
            <div style="text-align:center;margin-bottom:30px;">
              <h3 class="content_title"></h3> 
            </div>
            <div class="contractfirstParty">
              <table border="0" cellspacing="0" cellpadding="7" style="width: 100%;">
                  <thead>
                  <tr>
                      <td align="left" style="width: 50%">?????????<span class="party_institutions"></span></td>
                      <td align="left" style="width: 50%">?????????<span class="party_b_institutions"></span></td>
                  </tr>
                  <tr>
                      <td align="left" style="width: 50%">?????????<span class="party_addr"></span></td>
                      <td align="left" style="width: 50%">?????????<span class="party_b_addr"></span></td>
                  </tr>
                  <tr>
                      <td align="left" style="width: 50%">????????????<span class="party_username"></span></td>
                      <td align="left" style="width: 50%">????????????<span class="party_b_username"></span></td>
                  </tr>
                  <tr>
                      <td align="left" style="width: 50%">???????????????<span class="party_phone"></span></td>
                      <td align="left" style="width: 50%">???????????????<span class="party_b_phone"></span></td>
                  </tr>
                  <tr>
                      <td align="left" style="width: 50%">???????????????<span class="party_email"></span></td>
                      <td align="left" style="width: 50%">???????????????<span class="party_b_email"></span></td>
                  </tr>
                  </thead>
              </table>
            </div>
            <div class="modal-body" id="signContractContent">
            </div>
            <div class="contractfirstParty">
              <table border="0" cellspacing="0" cellpadding="7" style="width: 100%;">
                  <thead>
                  <tr>
                      <td align="left" style="width: 50%">?????????<span class="party_institutions"></span></td>
                      <td align="left" style="width: 50%">?????????<span class="party_b_institutions"></span></td>
                  </tr>
                  <tr>
                      <td align="left" style="width: 50%">????????????</td>
                      <td align="left" style="width: 50%">????????????</td>
                  </tr>
                  <tr>
                      <td align="left" style="width: 50%" class="time-add">?????????&nbsp;&nbsp;&nbsp;???&nbsp;&nbsp;&nbsp;???&nbsp;&nbsp;&nbsp;???</td>
                      <td align="left" style="width: 50%" class="time-add">?????????&nbsp;&nbsp;&nbsp;???&nbsp;&nbsp;&nbsp;???&nbsp;&nbsp;&nbsp;???</td>
                  </tr>
                  </thead>
              </table>
            </div>
          </div>
          <div class="enclosure">
            <h5>??????</h5>
            <div style="width:100%;font-weight: 600;text-align: center;">????????????</div>
            <div class="cost">???????????????<span class="fj_amount"></span></div>
            <div style="max-width: 100%;overflow-x: auto;">
              <div>
                <table class="table table-bordered">
                  <thead>
                    <tr>
                      <th>??????</th>
                      <th>?????????</th>
                      <th>????????????</th>
                      <th>????????????</th>
                      <th>??????</th>
                      <th>??????</th>
                      <th>????????????</th>
                      <th>??????</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>1</td>
                      <td class="fj_ordernum"></td>
                      <td class="fj_name"></td>
                      <td class="fj_description"><pre></pre></td>
                      <td>1</td>
                      <td class="fj_amount"></td>
                      <td class="fj_nextduedate"></td>
                      <td class="fj_amount"></td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        <div class="modal-footer justify-content-center">
          <button type="button" style="width:100px;" class="btn btn-primary" id="signcontractSub" data-toggle="modal"
            data-target="#autographDialog">????????????</button>
          <button type="button" style="width:100px;" class="btn btn-outline-light" data-dismiss="modal">??????</button>
        </div>
      </div>
    </div>
  </div>

  <!-- ???????????? -->
  <div class="modal fade" id="autographDialog" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="customTitle">?????????</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body" id="deleteContractContent">
          <div id="signature"></div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary w-40" onclick="jSignatureTest()">????????????</button>
          <button type="button" class="btn btn-outline-light" onclick="reset()">????????????</button>
        </div>
      </div>
    </div>
  </div>
  </div>
</div>
<script type="text/javascript">
                  
  // ??????????????????hid
  var create_hid;
  var contract_id;
  var contract_html;
  $(function () {
    if(getQueryVariable('type')) {
      $("#statusSel option[value='"+getQueryVariable('type')+"']").attr("selected", "selected");
    }
    if(getQueryVariable('start_time')) {
      $('#startTime').val(moment(getQueryVariable('start_time')*1000).format('YYYY-MM-DD'))
    }
    if(getQueryVariable('end_time')) {
      $('#endTime').val(moment(getQueryVariable('end_time')*1000).format('YYYY-MM-DD'))
    }
    // popover??????
    $("span").popover()

    // ????????????????????????
    $('#afcUpdateBtn').on('click', function () {
      // ???????????????
      $('#paAddress').removeAttr('disabled')
      $('#paPhone').removeAttr('disabled')
      $('#paEmail').removeAttr('disabled')
      // ????????????
      $('#afcCreateBtn').hide()
      $('#afcUpdateBtn').hide()
      $('#afcSaveBtn').show()
      $('#afcCancelBtn').show()
      $('.red-color').show();
    })

    // ??????
    $('#afcCancelBtn').on('click', function () {
      // ??????????????????
      $('#paAddress').attr('disabled', true)
      $('#paPhone').attr('disabled', true)
      $('#paEmail').attr('disabled', true)
      // ????????????
      $('#afcCreateBtn').show()
      $('#afcUpdateBtn').show()
      $('#afcSaveBtn').hide()
      $('#afcCancelBtn').hide()
      $('.red-color').hide();
      // TODO ??????,??????????????????\??????\???????????????

    })

    // ??????
    $('#afcSaveBtn').on('click', function () {
      // ??????????????????
      $('#paAddress').attr('disabled', true)
      $('#paPhone').attr('disabled', true)
      $('#paEmail').attr('disabled', true)
      // ????????????
      $('#afcCreateBtn').show()
      $('#afcUpdateBtn').show()
      $('#afcSaveBtn').hide()
      $('#afcCancelBtn').hide()
      $.ajax({
          url: '/contract/base_info',
          type: 'POST',
          data: {
            address1: $('#paAddress').val(),
            phonenumber: $('#paPhone').val(),
            email: $('#paEmail').val()
          },
          success: function (res) {
              if (res.status != 200) {
                toastr.error(res.msg);
              } else {
                toastr.success('????????????');
              }
          }
      });
    })

    // ????????????
    $("#afcCreateBtn").on('click', function () {
      $.ajax({
          url: '/contract/contract',
          type: 'POST',
          data: {
            hid: create_hid,
          },
          success: function (res) {
              let resData = res.data;
              if (res.status != 200) {
                toastr.error(res.msg);
              } else {
                var checkedArr = []
                $('.row-checkbox:checked').each(function () {
                  checkedArr.push($(this).data('value'))
                })
                // console.log(checkedArr)
                // TODO ????????????
                $('.content_title').html(resData.contract.name)
                $('.party_addr').html(resData.party.addr)
                $('.party_email').html(resData.party.email)
                $('.party_institutions').html(resData.party.institutions)
                $('.party_phone').html(resData.party.phone)
                $('.party_username').html(resData.party.username)
                $('.party_b_addr').html(resData.party_b.addr)
                $('.party_b_email').html(resData.party_b.email)
                $('.party_b_institutions').html(resData.party_b.institutions)
                $('.party_b_phone').html(resData.party_b.phone)
                $('.party_b_username').html(resData.party_b.username)
                $('#signContractContent').html(HTMLDecode(resData.contract.content))
                if(resData.host.length == 0) {
                  $('.enclosure').hide()
                } else {
                  $('.fj_amount').html(resData.host.amount)
                  $('.fj_description').html(resData.host.description.replace(/[\n\r]/g,'<br>'))
                  $('.fj_name').html(resData.host.name)
                  $('.fj_ordernum').html(resData.host.ordernum)
                  $('.fj_nextduedate').html(moment(resData.host.nextduedate*1000).format('YYYY-MM-DD'))
                }
                $(".modal").modal('hide')
                $("#signContract").modal('show')
                contract_id = resData.id
              }
          }
      });
    })
    $('#signcontractSub').click(function () {
      if($(".signatureCanvas").width() == undefined) {
        setTimeout(() => {
          $('#signature').jSignature({ lineWidth: 1, width: $('#signature').width(), height: 200, cssclass: 'signatureCanvas' });
        }, 500)
      }
    })
    // ??????????????????
    $(".relatedContract").dblclick(function () {
      // TODO ??????????????????pdf
      window.open("");
    });
    $('#signContract').on('hidden.bs.modal', function () {
      location.reload();
    })
  })

   // ??????img
   function jSignatureTest() {
      if ($("#signature").jSignature("getData", "native").length == 0) {
        // ??????????????????
        toastr.error('??????????????????')
        return;
      } else {
        // ??????base64??????
        var datapair = $("#signature").jSignature("getData", "image")
        // ????????????
        var src_base64 = "data:" + datapair[0] + "," + datapair[1]
        $('.time-add').html("?????????"+moment(new Date()).format('YYYY???MM???DD???')+"")
        let contract_html = $('.content_html').html()
        let contract_table = $('.enclosure').html()
        $.ajax({
            url: '/contract/contract/'+contract_id,
            type: 'POST',
            data: {
              sign: src_base64,
              content: contract_html,
              enclosure: contract_table
            },
            success: function (res) {
                let resData = res.data;
                if (res.status != 200) {
                  toastr.error(res.msg);
                } else {
                  toastr.success('??????????????????');
                  location.href = '/contract'
                }
            }
        });
      }
      // ??????base64??????
      // var datapair = $("#signature").jSignature("getData", "image")
      // console.log(datapair);
      // var img = new Image();
      // ????????????
      // img.src = "data:" + datapair[0] + "," + datapair[1]
      // $("#image").empty();
      // $(img).appendTo($("#image"))
    }
    // ??????
    function reset() {
      $("#signature").jSignature("reset");
    }

  // ????????????
  function createContract(hid) {
    create_hid = hid
    $('#afcModal').modal('show')
    // ????????????
    $('#paAddress').attr('disabled', true)
    $('#paPhone').attr('disabled', true)
    $('#paEmail').attr('disabled', true)
    // ????????????
    $('#afcCreateBtn').show()
    $('#afcUpdateBtn').show()
    $('#afcSaveBtn').hide()
    $('#afcCancelBtn').hide()
  }

  // ????????????
  $("#limitSel").blur(function () {
    var limit = 'limit='+this.value;
    window.location.href="contracthost?"+limit;
  });
  // ???????????????
  $('#keywords').val('{$Think.get.keywords}')
  $('#keywords').on('keydown', function (e) {
    if (e.keyCode == 13) {
        searchAll()
    }
  })
  $('#searchIcon').on('click', function (e) {
    searchAll()
  })
  $('.clear-search').on('click',function(){
    location.href = '/contracthost'
  })
  // ????????????
  function searchAll() {
    let startTime = $('#startTime').val() == ''?$('#startTime').val():new Date($('#startTime').val()).getTime() / 1000
    let endTime = $('#endTime').val() == ''?$('#endTime').val():new Date($('#endTime').val()).getTime() / 1000
    location.href = '/contracthost?'+
    'keywords=' + $('#keywords').val()+'&page={$Think.get.page}&limit={$Think.get.limit}&type='+$("#statusSel option:selected").val()+'&start_time='+startTime+'&end_time='+endTime+''
  }
  // html??????
  function HTMLDecode (text) {
    var temp = document.createElement('div')
    temp.innerHTML = text
    var output = temp.innerText || temp.textContent
    temp = null
    return output
  }
  function getQueryVariable(variable) {
      var query = window.location.search.substring(1);
      var vars = query.split("&");
      for (var i = 0; i < vars.length; i++) {
        var pair = vars[i].split("=");
        if(pair[0] == variable){return pair[1];}
      }
      return (false);
    }
  
</script>