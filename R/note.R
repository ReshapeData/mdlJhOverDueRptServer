#' 查看即时库存更新报表
#'
#' @param input 输入
#' @param output 输出
#' @param session 会话
#' @param dms_token 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' note()
note <- function(input,output,session,dms_token) {
  var_txt_note_FBillNO = tsui::var_text('txt_note_FBillNO')
  var_txt_note_RemarkText = tsui::var_text('txt_note_RemarkText')
  
  shiny::observeEvent(input$dl_saleOrderTable_note_query,{
    token <- dms_token
    FBillNO <- var_txt_note_FBillNO()
    RemarkText <- var_txt_note_RemarkText()
    
    
    data <- mdlJhOverDueRptr::saleOrderTable_note_query(token = token,FBillNO = FBillNO, RemarkText =RemarkText )
    
    
    tsui::run_dataTable2(id = 'dt_saleOrderTable_note_query',data = data)
    
  })
  
  
  
  
}
