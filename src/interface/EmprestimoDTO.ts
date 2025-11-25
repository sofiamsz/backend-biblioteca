export interface EmprestimoDTO {
    idEmprestimo?: number,
    idAluno: number,
    idLivro: number,
    dataEmprestimo: Date,
    dataDevolucao: Date,
    statusEmprestimo: string,
    endereco: string,
    celular: number,
    situacao?: boolean
}