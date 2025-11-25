export interface LivroDTO {
    idLivro?: number,
    titulo: string,
    autor: string,
    editora: string,
    anoPublicacao: Date,
    isbn: number,
    quantidadeTotal: number,
    quantidadeDisponivel: number,
    valorAquisicao: number,
    statusLivroEmprestado: string,
    situacao?: boolean
}