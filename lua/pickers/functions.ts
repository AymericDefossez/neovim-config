const PI: number = 3.14;
const E = 2.71;
let x: number = 10;

type Operation = (a: number, b: number) => number;

export type OperationType = 'add' | 'substract' | 'multiply' | 'divide';

interface Calculator {
  add: Operation;
  substract: Operation;
  multiply: Operation;
  divide: Operation;
}

export function add(a: number, b: number): number {
  return a + b;
}

export class Functions {
  public title: string = 'Calculator';

  private readonly _version: string = '1.0.0';

  public constructor(
    private readonly _name: string
  ) {}

  public multiply(a: number, b: number): number {
    const result: number = a * b;
    return result;
  }

  substract(a: number, b: number): number {
    return a - b;
  }

  divide(a: number, b: number) {
    return a / b;
  }

  public static square(a: number) {
    return a * a;
  }

  static cube(a: number): number {
    return this.square(a) * a;
  }
}
