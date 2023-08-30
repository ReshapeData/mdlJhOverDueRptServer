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
#' organization()
organization <- function(input,output,session,dms_token) {
  var_txt_organization_FCustName = tsui::var_text('txt_organization_FCustName')
  var_txt_organization_FStartDate = tsui::var_date('txt_organization_FStartDate')
  var_txt_organization_FEndDate = tsui::var_date('txt_organization_FEndDate')
  var_txt_organization_FOrgNumber = tsui::var_ListChoose1('txt_organization_FOrgNumber')
  
  shiny::observeEvent(input$dl_saleOrderTable_date_organization_query,{
    token <- dms_token
    FCustName <- var_txt_organization_FCustName()
    FStartDate <- var_txt_organization_FStartDate()
    FEndDate <-var_txt_organization_FEndDate()
    FOrgNumber <-var_txt_organization_FOrgNumber()
    
    
    data <- mdlJhOverDueRptr::saleOrderTable_date_organization_query(token = token,FCustName =FCustName ,FStartDate =FStartDate ,
                                                                     FEndDate =FEndDate ,FOrgNumber =FOrgNumber )
    
    
    tsui::run_dataTable2(id = 'dt_saleOrderTable_date_organization_query',data = data)
    
  })
  
  
  
  
}
