class PessoasController < ApplicationController
  before_action :set_pessoa, only: %i[ show edit update destroy ]

  # GET /pessoas ou /pessoas.json
  def index
    @pessoas = Pessoa.all
  end

  # GET /pessoas/1 ou /pessoas/1.json
  def show
  end

  # GET /pessoas/new
  def new
    @pessoa = Pessoa.new
  end

  # GET /pessoas/1/edit
  def edit
  end

  # POST /pessoas ou /pessoas.json
  def create
    @pessoa = Pessoa.new(pessoa_params)

    respond_to do |format|
      if @pessoa.save
        format.html { redirect_to pessoa_url(@pessoa), notice: I18n.t('pessoas.messages.success.create') }
        format.json { render :show, status: :created, location: @pessoa }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pessoa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pessoas/1 ou /pessoas/1.json
  def update
    respond_to do |format|
      if @pessoa.update(pessoa_params)
        format.html { redirect_to pessoa_url(@pessoa), notice: I18n.t('pessoas.messages.success.update') }
        format.json { render :show, status: :ok, location: @pessoa }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pessoa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pessoas/1 ou /pessoas/1.json
  def destroy
    @pessoa.destroy!

    respond_to do |format|
      format.html { redirect_to pessoas_url, notice: I18n.t('pessoas.messages.success.destroy') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks para compartilhar configurações ou restrições comuns entre ações.
  def set_pessoa
    verify_pessoa_id unless @pessoa = Pessoa.find_by(id: params[:id])
  end

  def verify_pessoa_id
    respond_to do |format|
      format.html { redirect_to pessoas_url, alert: t('pessoas.messages.error.not_found') }
      format.json { render json: { error: t('pessoas.messages.error.not_found') }, status: :not_found }
    end
  end

  # Só permitir uma lista de parâmetros confiáveis por meio de strong parameters.
  def pessoa_params
    params.require(:pessoa).permit(:nome, :rua, :numero, :bairro, :cidade, :estado)
  end

end
