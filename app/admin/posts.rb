ActiveAdmin.register Post do
  permit_params :genre, :content
  index do
    selectable_column
    id_column
    # enum-help を利用
    column :genre, :post, &:genre_i18n
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :id
      # enum-help を利用
      row :genre, :post, &:genre_i18n
      row :content
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      # enum-help を利用
      input :genre, as: :select, collection: Post.genres_i18n.invert
      input :content
    end
    f.actions
  end

  # enum-help を利用
  filter :genre, as: :select, collection: Post.genres_i18n.invert
  filter :content
  filter :created_at
  filter :updated_at
end


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :genre, :content
  #
  # or
  #
  # permit_params do
  #   permitted = [:genre, :content]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
