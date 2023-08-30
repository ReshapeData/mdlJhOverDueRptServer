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
#' day()
day <- function(input,output,session,dms_token) {
  var_txt_day_FCustName = tsui::var_text('txt_day_FCustName')
  
  shiny::observeEvent(input$dl_saleOrderTable_day_query,{
    token <- dms_token
    FCustName <- var_txt_day_FCustName()
    
    
    data <- mdlJhOverDueRptr::saleOrderTable_day_query(token = token,FCustName = FCustName)
    
    
    tsui::run_dataTable2(id = 'dt_saleOrderTable_day_query',data = data)
    
  })
  
  
  
  
}
