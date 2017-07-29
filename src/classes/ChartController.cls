public class ChartController {
    public class Nv {
        public String n { get; private set; }        
        public Decimal v { get; private set; }
        Nv(String n, Decimal v) {
            this.n = n;
            this.v = v;       
        }
    }
    public Nv[] getNvs() {
        return new Nv[] {
            new Nv('Dominance', 19),
            new Nv('Influence', 11),
            new Nv('Steadiness', 21),
            new Nv('Compliance', 4)
        };
    }
}