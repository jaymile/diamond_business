class PostsController < ApplicationController
before_action :find_post, only: [:show, :edit, :update, :destroy]

def index
    @posts = post.all
end

def show
    
end

def new
    @post = post.new
end

def create
    @post = post.new(post_params)

    if @post.save
        flash[:success] = "l'article a bien été créer"
        redirect_to @post
    else render 'new'
    end
end

def edit

end

def update
    if @post.update(post_params)
         redirect_to @post, notice: "la mis ajours a ete bien pris en compte"
    else
         render ‘edit’
    end
end

def destroy
    @post.destroy
    redirect_to root_path, notice: " votre article a été supprimer" 
end

private
    def post_params
        params.require(:post).permit(:title, :content, :category_id)
    end

    def find_post
        @post = post.find(params[:id])
    end
end
