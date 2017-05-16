require "google/cloud/vision"
require 'googleauth'



class PostsController < ApplicationController
  before_action :authenticate_user!
  #before_action :set_post, only: [:recognize, :show, :edit, :update, :destroy]


def recognize
end

  # GET /posts
  # GET /posts.json
  def index
    @posts = current_user.posts

  end


  # GET /posts/1
  # GET /posts/1.json
  def show
    @photos = Photo.all
    @post = Post.find(params[:id])
    x = @post.image.url

  #private_key =  Google::Auth::ServiceAccountCredentials.make_creds(
      #scope: 'https://www.googleapis.com/auth/cloud-platform',
      #json_key_io: StringIO.new(ENV['VISION_KEYFILE_JSON'])
    #)


    vision = Google::Cloud::Vision.new(
            project: "redoproject-163021",
            keyfile: "config/redoproject-e87605fb29d9.json",
            )
             @image = vision.image(x)
             @labels = @image.labels
             #logs
             @logs = @image.logos
             #web
            p @web = @image.web.entities

end





  # GET /posts/new
  def new
  @post = current_user.posts.build
  end



  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])

  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(post_params)


    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params

      params.fetch(:post, {}).permit(:image, :caption)
    end
end











#p caption = @posts.last.caption
#caption = caption+".jpg"

  #Dir.foreach('public/system/images') do |item|
    #if item == caption
      #p true


#vision = Google::Cloud::Vision.new(
        #project: "my-project-1474585137440",
        #keyfile: "config/My Project-33e39bf19ec6.json"
        #)
        #p 'jjklmjsklxmxsklmwkmxkwxklm'
        #p @image = vision.image('public/images/images/'+ item)
        #p @labels = @image.labels
      #end
#end
