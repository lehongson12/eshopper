module Admin
  class Admin::CategoriesDatatable < DatatableBase

    include AjaxDatatablesRails::Extensions::Kaminari

    def_delegators :@view, :link_to, :admin_category_path, :edit_admin_category_path, :content_tag, :image_tag

    def sortable_columns
      # Declare strings in this format: ModelName.column_name
      @sortable_columns ||= %w(name)
    end

    def searchable_columns
      # Declare strings in this format: ModelName.column_name
      @searchable_columns ||= ["Category.name"]
    end

    private

    def data
      records.map do |record|
        {
          name: link_to(record.name, admin_category_path(record)),
          description: record.description,
          actions: get_actions(record)
        }
      end
    end

    def get_raw_records
      Category.all
    end

    def get_actions record
      edit = link_to(edit_admin_category_path(record)) do
        content_tag :i, "", class: "fa fa-pencil"
      end

      delete = link_to(admin_category_path(record), method: :delete,
        data: {confirm: "Are you sure?"}, class: "text-danger") do
        content_tag :i, "", class: "fa fa-times"
      end
      "#{edit} | #{delete}"
    end
  end
end
