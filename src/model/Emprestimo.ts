class Emprestimo {
    private idEmprestimo: number;
    private idAluno: number;
    private idLivro: number;
    private dataEmprestimo: Date;
    private dataDevolucao: Date;
    private statusEmprestimo: string;

    constructor(
        _idEmprestimo: number,
        _idAluno: number,
        _idLivro: number,
        _dataEmprestimo: Date,
        _dataDevolucao: Date,
        _statusEmprestimo: string
    ) {
        this.idEmprestimo = _idEmprestimo;
        this.idAluno = _idAluno;
        this.idLivro = _idLivro;
        this.dataEmprestimo = _dataEmprestimo;
        this.dataDevolucao = _dataDevolucao;
        this.statusEmprestimo = _statusEmprestimo;
    }

    public getIdEmprestimo(): number {
        return this.idEmprestimo;
    }

    public setIdEmprestimo(_id_emprestimo: number): void {
        this.idEmprestimo = _id_emprestimo;
    }

    public getIdAluno(): number {
        return this.idAluno;
    }

    public setIdAluno(_idAluno: number): void {
        this.idAluno = _idAluno;
    }

    public getIdLivro(): number {
        return this.idLivro;
    }

    public setIdLivro(_idLivro: number): void {
        this.idLivro = _idLivro;
    }

    public getDataEmprestimo(): Date {
        return this.dataEmprestimo;
    }

    public setDataEmprestimo(_dataEmprestimo: Date): void {
        this.dataEmprestimo = _dataEmprestimo;
    }

    public getDataDevolucao(): Date {
        return this.dataDevolucao;
    }

    public setDataDevolucao(_dataDevolucao: Date): void {
        this.dataDevolucao = _dataDevolucao;
    }

    public getStatusEmprestimo(): string {
        return this.statusEmprestimo;
    }

    public setStatusEmprestimo(_statusEmprestimo: string): void {
        this.statusEmprestimo = _statusEmprestimo;
    }
}