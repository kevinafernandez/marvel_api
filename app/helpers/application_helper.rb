module ApplicationHelper
    def bootstrap_icon_for flash_type
        { success: "ok-sign", error: "remove-sign", alert: "warning-sign", notice: "exclamation-sign" }[flash_type] || 'info-sign'
    end

  def flash_class(level)
    case level
        when :notice then "alert alert-info"
        when :success then "alert alert-success"
        when :error then "alert alert-error"
        when :alert then "alert alert-error"
    end
  end
  
end
