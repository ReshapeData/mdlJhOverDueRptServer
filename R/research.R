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
#' research()
research <- function(input,output,session,dms_token) {
  var_txt_research_FBillNO = tsui::var_text('txt_research_FBillNO')
  var_txt_research_FRdNumber = tsui::var_text('txt_research_FRdNumber')
  
  shiny::observeEvent(input$dl_saleOrderTable_research_query,{
    token <- dms_token
    FBillNO <- var_txt_research_FBillNO()
    FRdNumber <- var_txt_research_FRdNumber()
    
    
    data <- mdlJhOverDueRptr::saleOrderTable_research_query(token = token,FBillNO = FBillNO,FRdNumber = FRdNumber)
    
    
    tsui::run_dataTable2(id = 'dt_saleOrderTable_research_query',data = data)
    
  })
  
  
  
  
}
