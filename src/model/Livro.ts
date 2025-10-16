class Livro {
    private idLivro: number;
    private titulo: string;
    private autor: string;
    private editora: string;
    private anoPublicacao: Date;
    private isbn: number;
    private quantidadeTotal: number;
    private quantidadeDisponivel: number;
    private valorAquisicao: number;
    private status: string;

    constructor(
        _idLivro: number,
        _titulo: string,
        _autor: string,
        _editora: string,
        _anoPublicacao: Date,
        _isbn: number,
        _quantidadeTotal: number,
        _quantidadeDisponivel: number,
        _valorAquisicao: number,
        _status: string,
    ) {
        this.idLivro = _idLivro;
        this.titulo = _titulo;
        this.autor = _autor;
        this.editora = _editora;
        this.anoPublicacao = _anoPublicacao;
        this.isbn = _isbn;
        this.quantidadeTotal = _quantidadeTotal;
        this.quantidadeDisponivel = _quantidadeDisponivel;
         this.valorAquisicao = _valorAquisicao;
        this.status = _status;
    }

    public getId(): number {
    return this.idLivro;
  }

   public setId(_idLivro: number): void{
    this.idLivro = _idLivro;
   }

  public getTitulo(): string{
    return this.titulo;
  }

  public setTitulo(_titulo: string): void{
    this.titulo = _titulo;
  }

  public getAutor(): string{
    return this.autor;
  }

  public setAutor(_autor: string): void{
    this.autor = _autor;
  }

    public getEditora(): string{
    return this.editora;
  }

  public setEditora(_editora: string): void{
    this.editora = _editora;
  }

    public getAnoPublicacao(): Date{
    return this.anoPublicacao;
  }

  public setAnoPublicacao(_anoPublicacao: Date): void{
    this.anoPublicacao = _anoPublicacao;
  }

    public getIsbn(): number{
    return this.isbn;
  }

  public setIsbn(_isbn: number): void{
    this.isbn = _isbn;
  }

    public getQuantidadeTotal(): number{
    return this.quantidadeTotal;
  }

  public setQuantidadeTotal(_quantidadeTotal: number): void{
    this.quantidadeTotal = _quantidadeTotal;
  }

    public getQuantidadeDisponivel(): number{
    return this.quantidadeTotal
  }

  public setQuantidadeDisponivel(_quantidadeDisponivel: number): void{
    this.quantidadeDisponivel = _quantidadeDisponivel;
  }

   public getValorAquisicao(): number{
    return this.valorAquisicao;
  }

  public setValorAquisicao(_valorAquisicao: number): void{
    this.valorAquisicao = _valorAquisicao;
  }

    public getStatus(): string{
    return this.status
  }

  public setStatus(_status: string): void{
    this.status = _status;
  }
}

export default Livro;