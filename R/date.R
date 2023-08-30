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
#' date()
date <- function(input,output,session,dms_token) {
  var_txt_date_FCustName = tsui::var_text('txt_date_FCustName')
  var_txt_date_FStartDate = tsui::var_date('txt_date_FStartDate')
  var_txt_date_FEndDate = tsui::var_date('txt_date_FEndDate')
  
  shiny::observeEvent(input$dl_saleOrderTable_date_query,{
    token <- dms_token
    FCustName <- var_txt_date_FCustName()
    FStartDate <- var_txt_date_FStartDate()
    FEndDate <-var_txt_date_FEndDate()
   
    
    data <- mdlJhOverDueRptr::saleOrderTable_date_query(token =token ,FCustName =FCustName ,FStartDate =FStartDate ,FEndDate =FEndDate )
    
    tsui::run_dataTable2(id = 'dt_saleOrderTable_date_query',data = data)
    
  })
  
  
  
  
}
