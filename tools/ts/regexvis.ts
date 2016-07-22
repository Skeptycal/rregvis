interface RRegData {
    before: string[],
    matches: number[][],
    after: string[]
}

class RegexVis {

    constructor(el: HTMLElement, width: number, height: number) {
        this.host = el;
    }

    load(data: RRegData): void {
        this.host.innerText = data.before[0];
    }

    private host: HTMLElement;
}
