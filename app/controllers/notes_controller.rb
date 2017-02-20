class NotesController < ApplicationController
  load_and_authorize_resource only: [:show, :edit, :update]

  def index
    @notes = Note.none
    if current_user
        @notes = current_user.readable
    end
  end

  def new
    render partial: 'form', locals: { note: Note.new }
  end

  def create
    if current_user
      note = Note.new(note_params)
      note.user = current_user
      note.save!
    end
    redirect_to '/'
  end

  def show
  end

  def edit
  end

  def update
    if current_user
      @note.update(note_params)
    end
    redirect_to '/'
  end





  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end


end