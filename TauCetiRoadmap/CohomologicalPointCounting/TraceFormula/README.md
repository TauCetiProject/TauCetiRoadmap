# Roadmap: Grothendieck--Lefschetz and cohomological \(L\)-functions

This roadmap builds the trace formalism for perfect complexes and proves the Grothendieck--Lefschetz trace formula for constructible coefficients on separated finite-type schemes over finite fields. It then packages local trace functions, zeta functions, and sheaf \(L\)-functions and proves their cohomological determinant formulas.

The mathematical progression is

\[
\text{traces on finite projectives}
\longrightarrow
\text{traces on perfect complexes}
\longrightarrow
\text{local Frobenius traces}
\longrightarrow
\text{finite étale and curve trace formulas}
\longrightarrow
\text{Grothendieck--Lefschetz}
\longrightarrow
\text{cohomological }L\text{-functions}.
\]

Suggested code homes:

```text
TauCeti/CategoryTheory/Trace/
TauCeti/Algebra/Homology/PerfectComplex/
TauCeti/AlgebraicGeometry/TraceFormula/
```

Suggested Lean namespaces for the Tau Ceti code — `TauCeti.CategoryTheory` for the generic trace and perfect-complex material of Layers 0--4, `TauCeti.AlgebraicGeometry.TraceFormula` for the rest (this roadmap's `Suggested.lean` uses `TauCetiRoadmap.CohomologicalPointCounting.TraceFormula`, per the family convention):

```text
TauCeti.CategoryTheory
TauCeti.AlgebraicGeometry.TraceFormula
```

Direct roadmap dependencies:

```text
CohomologicalPointCounting/FrobeniusGeometry
CohomologicalPointCounting/ConstructibleEtale
CohomologicalPointCounting/EtaleBaseChange
CohomologicalPointCounting/CompactSupport
CohomologicalPointCounting/ComplexComparison
CohomologicalPointCounting/EllAdicRealization
JacobianChallenge
```

The finite-coefficient trace theorem consumes the first four cohomological dependencies. `ComplexComparison` is used only for the independent cohomology calculations that test the constant-sheaf formula; it is not part of the proof of Grothendieck--Lefschetz. The smooth-projective-curve base case consumes the Jacobian variety and abelian-variety infrastructure specified by [`JacobianChallenge`](../../JacobianChallenge/). The \(\mathbf Q_\ell\)-corollaries and final sheaf \(L\)-function interface also consume `EllAdicRealization`.

The Markdown roadmap is the definitive specification. `Suggested.lean` is nonexhaustive.

## Primary references and source-to-layer map

* The Stacks Project, Chapter 64, [The Trace Formula](https://stacks.math.columbia.edu/tag/0F5P), especially §§64.2--64.20.
* The Stacks Project, Theorem 64.20.1, [finite-coefficient cohomological interpretation](https://stacks.math.columbia.edu/tag/03UZ).
* SGA 4½, *Sommes trigonométriques* and the trace formula.
* SGA 5, Exposés III and XV.
* The Tau Ceti [`JacobianChallenge`](../../JacobianChallenge/) roadmap, for Jacobian varieties, polarizations, and the theorem-of-the-cube infrastructure consumed by the curve base case.
* J. S. Milne, *Étale Cohomology*, Chapter VI.
* P. Deligne, *La conjecture de Weil II*, only as a boundary reference: weights and eigenvalue bounds are not targets here.

| Roadmap material | Main source |
|---|---|
| Frobenius conventions | Stacks, §64.3 |
| Traces and perfect complexes | Stacks, §§64.4--64.14 |
| Curve base case and group-ring reduction | Stacks, §§64.14--64.16; SGA 4½ |
| Reduction from general dimension to curves | SGA 4½; Noether normalization plus lower shriek/base change |
| Adic coefficients for \(L\)-functions (built in `EllAdicRealization`) | Stacks, §64.18 |
| \(L\)-functions | Stacks, §64.19 |
| Cohomological interpretation | Stacks, §64.20 |

## Standing conventions

### Finite field

Let \(k=\mathbf F_q\) be a finite field of characteristic \(p\). The scheme \(X\) is separated and finite type over \(k\). All statements are compatible with base extension to \(\mathbf F_{q^r}\) for every \(r\ge1\).

### Coefficients

The primary finite-level theorem uses a finite commutative ring \(\Lambda\) of order prime to \(p\) and

\[
K\in D^b_{\mathrm{ctf}}(X,\Lambda).
\]

Where the reference theorem first treats constructible flat sheaves, prove that form as an intermediate layer and then pass by devissage to the pinned ctf complex theorem.

The rational corollary uses constructible \(\mathbf Q_\ell\)-coefficients produced by `EllAdicRealization`, with \(\ell\ne p\).

### Frobenius convention

Use the arithmetic and geometric Frobenius declarations from `FrobeniusGeometry`. The roadmap's displayed cohomological formulas use **geometric Frobenius** unless a theorem explicitly says otherwise. The local action on a stalk and the global action on compactly supported cohomology must be constructed from one consistent descent convention.

### Trace of a complex

For a finite coefficient ring, the primary Lefschetz number is the trace of an endomorphism of a perfect complex, defined by choosing a bounded finite-projective representative and taking the alternating sum of termwise traces, with independence proved.

Do not define the trace as

\[
\sum_i(-1)^i\operatorname{Tr}(u\mid H^i)
\]

unless the cohomology modules satisfy hypotheses under which each trace is defined and the equality with the perfect-complex trace has been proved.

### Local terms

For a rational point \(x\in X(\mathbf F_{q^r})\), write \(\operatorname{Frob}_{q^r,x}\) for the endomorphism of the derived geometric stalk induced by geometric \(q^r\)-Frobenius and the descent structure of \(K\). The local term is the perfect-complex trace of this endomorphism. For a sheaf concentrated in degree zero and flat over \(\Lambda\), this is the ordinary stalk trace.

For a closed point \(x\in|X|\) of degree \(d\), write \(\operatorname{Frob}_x:=\operatorname{Frob}_{q^d,x}\). Do not use the same notation for a rational point over \(\mathbf F_{q^r}\) and then attach an additional exponent \(r\).

### Zeta and \(L\)-functions

Distinguish:

* the power-series definition from point counts or local Euler factors;
* the cohomological determinant expression;
* rationality as the theorem identifying the power series with a rational function.

Do not define the Hasse--Weil zeta function by the cohomological expression.

## What Mathlib and Tau Ceti already have: consume

Consume:

* traces and determinants of endomorphisms of finite free and finite-dimensional modules;
* finite projective modules, duality, tensor products, matrices, characteristic polynomials, and exterior powers;
* Mathlib homological complexes, cohomology, homotopy equivalences, quasi-isomorphisms, derived categories, distinguished triangles, compact objects, and dualizable-object infrastructure; extend this API by the equivalence theorems in Layer 1;
* formal power series, power-series logarithm/exponential at the needed formal level, rational functions, infinite products in formal power-series rings, and finite-field cardinality APIs;
* `FrobeniusGeometry` for rational points, all powers of Frobenius, and convention conversion;
* `ConstructibleEtale` for ctf coefficients and geometric stalks;
* `EtaleBaseChange` and `CompactSupport` for compactly supported cohomology, base change, constructibility, finiteness, perfectness, localization, and Künneth;
* `ComplexComparison` for the finite-level calculations of projective-space cohomology used as noncircular acceptance tests;
* `EllAdicRealization` for finite-dimensional \(\mathbf Q_\ell\)-cohomology, continuous Frobenius actions, and the normalized constructible adic coefficient category used by the sheaf \(L\)-function interface;
* the Tau Ceti `JacobianChallenge` roadmap for Jacobian varieties of smooth proper curves, the Abel--Jacobi map, polarizations, and the theorem-of-the-cube infrastructure. The boundary with Layer 8 is: `JacobianChallenge` ends at the abelian varieties themselves; the torsion subgroups, Tate modules, algebraic traces of endomorphisms, and intersection-theoretic inputs of Weil's curve fixed-point formula are built in Layer 8 of this roadmap.

No existing Mathlib theorem supplies traces of arbitrary perfect complexes with the additivity required here or the étale Grothendieck--Lefschetz trace formula.

## What is missing: build here

The missing reusable library consists of:

1. Hattori--Stallings trace for finite projective modules over possibly noncommutative rings, including the commutative specialization;
2. centralizer traces and conjugacy-class sums for group rings, together with the finite-group/monoid-extension identities used in the curve proof;
3. determinant and characteristic polynomial for finite projectives in the required commutative form;
4. trace/Lefschetz number of an endomorphism of a perfect complex;
5. a filtered-derived or equivalent enhanced additivity theorem for canonically induced endomorphisms;
6. compatibility with tensor products, base change, and cohomology;
7. local and global Frobenius endomorphisms of coefficient complexes;
8. local trace functions on rational and closed points;
9. the zero-dimensional and finite étale trace formulas;
10. Weil's fixed-point/trace theorem for endomorphisms of smooth projective curves, built through the Jacobian route;
11. the trace formula in dimension at most one for ctf coefficients, including the finite étale Galois-cover and group-ring argument;
12. the Noether-normalization reduction from arbitrary dimension to the dimension-at-most-one case;
13. Grothendieck--Lefschetz for separated finite-type schemes and ctf coefficients;
14. the constant-sheaf point-count formula for every \(q^r\);
15. Hasse--Weil zeta functions from point counts;
16. sheaf \(L\)-functions from closed-point Euler factors;
17. cohomological determinant formulas and rationality;
18. compatibility with finite group actions, products, localization, and coefficient change.

## The build, in layers

### Layer 0: projective, Hattori--Stallings, and group-ring traces

Let \(R\) be a ring and write \(R^{\natural}=R/[R,R]\) for the additive quotient by commutators. For a finite projective right \(R\)-module \(P\) and an endomorphism \(u:P\to P\), define the Hattori--Stallings trace

\[
\operatorname{Tr}^{\mathrm{HS}}_R(u)\in R^{\natural}.
\]

Prove independence of a finite-free complement and agreement with the usual trace when \(R\) is commutative.

Build:

* agreement with matrix trace for finite free modules;
* conjugation invariance;
* cyclicity \(\operatorname{Tr}(fg)=\operatorname{Tr}(gf)\);
* additivity in direct sums and short exact sequences of finite projectives;
* scalar extension/base change;
* tensor formula
  \[
  \operatorname{Tr}(u\otimes v)=\operatorname{Tr}(u)\operatorname{Tr}(v);
  \]
* the Hattori--Stallings trace of the identity equals the Hattori--Stallings rank class; over a commutative ring, a module of constant rank \(n\) has trace \(n\cdot1_R\);
* compatibility with duals.

For a finite group \(G\), specialize to \(R=\Lambda[G]\). Construct the coefficient-of-the-identity map

\[
\varepsilon:\Lambda[G]^{\natural}\to\Lambda^{\natural}
\]

and the centralizer traces \(\operatorname{Tr}^{Z_g}\) and primed conjugacy-class sums used in Stacks, §64.15. These constructions are not defined by dividing by \(|G|\) in \(\Lambda\). Prove the divisibility relation \(|Z_g|\operatorname{Tr}^{Z_g}=\operatorname{Tr}\), together with the induction, tensor-product, and monoid-extension identities required after trivializing a lisse sheaf on a finite étale Galois cover. Include the auxiliary \(A=\mathbf Z/\ell^n\mathbf Z\) construction and descent to the primary coefficient ring used in the curve proof. These are explicit algebraic targets, not consequences hidden inside the curve theorem.

Extend Mathlib's determinant and characteristic-polynomial infrastructure to endomorphisms of finite projective modules, using exterior powers and localization to finite free modules. Prove agreement with Mathlib's matrix and finite-free definitions; do not introduce a parallel determinant.

### Layer 1: perfect complexes

Define a perfect complex over \(R\) as a derived object represented by a bounded complex of finite projective modules. Relate this definition by equivalence theorems to Mathlib's existing compactness or perfectness predicates on the relevant derived categories; do not maintain two unrelated notions.

Build:

* bounded finite-projective representatives;
* transport of endomorphisms to representatives;
* stability under shifts, cones, direct sums, tensor products, duals, and scalar extension;
* for the derived category of modules over a commutative ring, equivalence of the bounded-finite-projective, compact, and dualizable characterizations of perfect objects.

This generic material lives in `TauCeti.CategoryTheory` (and Mathlib-adjacent module namespaces). Sibling roadmaps state their perfectness theorems against Mathlib's perfect-complex notion, not against this layer; this layer's equivalence theorems make those statements interchangeable with the representative-based trace theory here.

### Layer 2: Lefschetz number of a perfect complex

For an endomorphism \(u:K\to K\) of a perfect complex, define

\[
L(u,K)=\sum_i(-1)^i\operatorname{Tr}(u^{(i)}:P^i\to P^i)
\]

on a bounded finite-projective representative, where \(u^{(i)}\) is the degree-\(i\) component of a lifted chain map — written with parentheses because \(u^r\) elsewhere in this roadmap means the \(r\)-th iterate. Prove:

* independence of representative and lifted chain map;
* invariance under chain homotopy;
* invariance under equivalence in the derived category;
* shift sign rule;
* direct-sum additivity;
* base-change compatibility;
* tensor-product multiplicativity;
* duality compatibility;
* agreement with the alternating trace on cohomology when the cohomology modules are finite projective or over a field.

Export a categorical trace formulation and prove it agrees with the representative definition. Generic results belong outside the algebraic-geometry namespace.

### Layer 3: enhanced additivity and filtered devissage

Do not assert additivity for an arbitrary diagram of distinguished triangles in a bare triangulated category. Such a diagram does not by itself contain enough coherent chain-level data.

Construct one of the standard enhancements used in the trace-formula proof, pinned here to the filtered-derived route:

* filtered complexes and the filtered derived category in the bounded situations required below;
* endomorphisms carried by filtered objects before localization;
* the two-step filtration attached to a short exact sequence of coefficient complexes, especially
  \(j_!j^*K\to K\to i_*i^*K\);
* compatibility of derived functors, compact support, and Frobenius with these filtered objects.

Prove additivity of Lefschetz numbers for an endomorphism of a filtered perfect complex:

\[
L(u,K)=\sum_a L(\operatorname{gr}^a u,\operatorname{gr}^a K).
\]

Derive the triangle-additivity statements only for triangles supplied by this enhancement, actual short exact sequences, or an equivalent stable/categorical enhancement whose coherence has been proved. This is the load-bearing additivity used in open--closed devissage and finite filtrations.

### Layer 4: determinants of perfect-complex endomorphisms

For a perfect complex \(K\) and endomorphism \(u\), define the alternating determinant

\[
\det(1-tu\mid K)
=
\prod_i\det(1-tu^{(i)}\mid P^i)^{(-1)^i}
\]

as a unit of \(R[[t]]\): each termwise polynomial has constant coefficient \(1\), so negative exponents are taken after the canonical map to formal-power-series units. Also record the class in the group completion of the multiplicative monoid of polynomials with constant term \(1\), and over a field identify it with the corresponding rational function. Prove independence of the representative and:

* multiplicativity in distinguished triangles;
* base change;
* direct sums, and tensor products in the finite-projective/perfect regimes in which the determinant identity is stated;
* the formal identity
  \[
  -t\frac{d}{dt}\log\det(1-tu\mid K)
  =\sum_{r\ge1}L(u^r,K)t^r
  \]
  in the correct formal-power-series form;
* agreement with the alternating determinant on cohomology over a field.

This identity is the algebraic bridge from trace formulas for all powers to cohomological \(L\)-functions.

### Layer 5: Frobenius on geometric stalks and compact support

Let \(X/\mathbf F_q\) and let \(K\) carry the canonical descent structure from an object over \(\mathbf F_q\). Construct:

* geometric Frobenius on every rational-point stalk \(K_{\bar x}\);
* geometric Frobenius on \(R\Gamma_c(X_{\bar{\mathbf F}_q},K)\);
* powers corresponding to base extension to \(\mathbf F_{q^r}\);
* compatibility with pullback, proper pushforward, \(Rf_!\), tensor products, Tate twists, and group actions;
* conversion to arithmetic Frobenius using `FrobeniusGeometry`.

Perfectness of the geometric stalk complexes is proved here from the ctf hypotheses of `ConstructibleEtale`; perfectness of the global complexes \(R\Gamma_c\) is consumed from `CompactSupport`. Together these make the traces below defined.

### Layer 6: local trace functions

For \(r\ge1\), define the trace function

\[
t_{K,r}:X(\mathbf F_{q^r})\longrightarrow\Lambda,
\qquad
x\longmapsto L(\operatorname{Frob}_{q^r,x},K_{\bar x}).
\]

For a sheaf concentrated in degree zero and flat over \(\Lambda\), prove agreement with ordinary stalk trace. Build:

* additivity in distinguished triangles;
* multiplicativity under tensor product;
* pullback compatibility;
* induction/pushforward formulas for finite étale maps;
* finite-group equivariance;
* compatibility under restriction of scalars from \(\mathbf F_{q^r}\) to \(\mathbf F_q\);
* conversion between rational-point sums and closed-point data.

### Layer 7: zero-dimensional and finite étale trace formulas

Prove the trace formula for zero-dimensional finite-type schemes and for finite étale schemes directly from permutation representations of Frobenius. For finite étale \(X/\mathbf F_q\), prove

\[
\sum_{x\in X(\mathbf F_{q^r})}
L(\operatorname{Frob}_{q^r,x},K_{\bar x})
=
L(\operatorname{Frob}_q^r,R\Gamma_c(X_{\bar k},K)).
\]

Develop the orbit-counting and permutation-trace lemmas generically, including nonreduced zero-dimensional schemes through topological invariance. This is the base case for both the curve proof and dimensional induction.

### Layer 8: Weil's trace theorem for smooth projective curves

Consume the Jacobian variety of a smooth proper geometrically connected curve from `JacobianChallenge`. Extend that infrastructure by building the pieces required by the Jacobian proof of Weil's theorem:

* finite prime-to-characteristic torsion and Tate modules of an abelian variety;
* the comparison between \(H^1_{\acute et}(C,\mathbf Z/\ell^n)\) and the dual of \(J_C[\ell^n]\), compatibly in \(n\);
* the algebraic trace of an endomorphism of an abelian variety and its agreement with the trace on the Tate module;
* the intersection number of the diagonal and the graph of an endomorphism on the surface \(C\times C\), including the bilinearity and rational-equivalence invariance of the intersection pairing of divisors on \(C\times C\) at the strength this identity requires — these intersection-theoretic inputs are targets of this layer, not assumptions;
* the fixed-point multiplicity formula;
* Weil's identity
  \[
  \Delta_C\cdot\Gamma_\varphi
  =1-\operatorname{Tr}^{\mathrm{alg}}(\varphi_*\mid J_C)
   +\deg(\varphi),
  \]
  stated through the algebraic trace on the Jacobian built in this layer — equivalently, compatibly in \(n\), through the traces on the finite-level torsion \(J_C[\ell^n]\) and hence on \(H^1_{\acute et}(C,\mathbf Z/\ell^n)\). The finite-coefficient trace theorem uses only this finite-level form; the \(H^1(C,\mathbf Q_\ell)\) restatement is a corollary recorded after `EllAdicRealization` and is not on the proof path.

For the geometric Frobenius endomorphism, prove transversality of the graph and diagonal and identify their intersection number with the number of rational fixed points. Deduce the constant-coefficient trace formula for a smooth projective curve and, more generally, for the endomorphisms \(g^{-1}\operatorname{Frob}\) arising from deck transformations of finite étale covers.

This layer follows the Jacobian/Weil route used by Stacks, §64.14. It does not invoke a general Lefschetz--Verdier trace formula or assume Poincaré duality in arbitrary dimension.

### Layer 9: the trace formula in dimension at most one

Formalize the proof architecture of Stacks, §64.16, rather than treating the curve case as a black box.

First prove open--closed additivity using the filtered-derived enhancement of Layer 3. Reduce a one-dimensional finite-type scheme and a ctf coefficient complex to the case in which:

* the scheme is a smooth irreducible affine curve;
* it has no \(\mathbf F_q\)-rational point;
* the coefficient is a finite lisse sheaf with finite-projective stalks over a primary finite coefficient ring.

Choose a connected finite étale Galois cover that trivializes the sheaf, compactify the cover and the base curve, and express compactly supported cohomology through the associated group-ring module. Apply the centralizer/group-ring trace identities of Layer 0 and the endomorphism form of Weil's curve theorem from Layer 8. Prove the resulting trace vanishes when the affine curve has no rational point.

Deduce, for every separated finite-type scheme \(X/\mathbf F_q\) of dimension at most one and every \(K\in D^b_{\mathrm{ctf}}(X,\Lambda)\),

\[
\sum_{x\in X(\mathbf F_{q^r})}
L(\operatorname{Frob}_{q^r,x},K_{\bar x})
=
L(\operatorname{Frob}_q^r,R\Gamma_c(X_{\bar k},K))
\]

for all \(r\ge1\).

### Layer 10: reduction of arbitrary dimension to curves

Pin the dimensional induction to the following route.

1. Use open--closed additivity and Noetherian induction to reduce to an integral affine scheme \(U\) of dimension \(d\ge2\).
2. Apply Noether normalization to obtain a finite dominant map \(U\to\mathbf A^d\).
3. Compose with the projection \(\mathbf A^d\to\mathbf A^{d-1}\). Every geometric fibre has dimension at most one.
4. Apply the induction hypothesis to the base and Layer 9 to every fibre.
5. Use \(Rf_!K\), its perfectness, \(Rf_!\)-base change, and the fibre trace identity to identify the local trace function of \(Rf_!K\) with the sum of local terms on the fibres.
6. Use \(R\Gamma_c(\mathbf A^{d-1},Rf_!K)\simeq R\Gamma_c(U,K)\) to identify the global terms.

Build the finite-type dimension, Noether-normalization, fibre-dimension, and affine-cover lemmas required by these steps if they are absent. The proof must expose the Fubini identity for local terms as a reusable lower-shriek theorem; it must not contain an unexplained phrase such as “reduce to curves.”

### Layer 11: Grothendieck--Lefschetz

For separated finite-type \(X/\mathbf F_q\), finite commutative \(\Lambda\) of order prime to \(p\), and

\[
K\in D^b_{\mathrm{ctf}}(X,\Lambda),
\]

prove, for every \(r\ge1\),

\[
\sum_{x\in X(\mathbf F_{q^r})}
L(\operatorname{Frob}_{q^r,x},K_{\bar x})
=
L(\operatorname{Frob}_q^r,R\Gamma_c(X_{\bar k},K)).
\]

Build the theorem as a natural statement compatible with:

* enhanced open--closed additivity;
* proper pushforward and lower shriek;
* base extension \(\mathbf F_q\subset\mathbf F_{q^r}\);
* products/Künneth;
* tensor products and Tate twists;
* finite group actions;
* coefficient-ring maps.

The finite sum on the left is over the finite rational-point type supplied by `FrobeniusGeometry`.

### Layer 12: constant-sheaf point counting

For the constant \(\mathbf Q_\ell\)-sheaf, deduce

\[
\#X(\mathbf F_{q^r})
=
\sum_i(-1)^i
\operatorname{Tr}
\left(
\operatorname{Frob}_q^r
\mid H^i_c(X_{\bar k},\mathbf Q_\ell)
\right).
\]

Give the integral/finite-coefficient versions in the perfect-complex trace form where ordinary cohomology traces are not appropriate.

Build the required cohomology calculations independently of the trace formula, by the following bounded route.

1. Use finite-level Artin comparison, including cup-product compatibility, to identify the graded cohomology ring of \(\mathbf P^n_{\bar k}\) with one copy of \(\Lambda(-i)\) in each even degree \(2i\), after transporting from a characteristic-zero fibre by smooth proper base change.
2. Construct the hyperplane class from the Kummer sequence and \(\mathcal O(1)\). Prove that it is the degree-two generator, its powers give the higher generators, and geometric Frobenius acts according to the pinned Tate-twist convention because Frobenius pulls \(\mathcal O(1)\) back to \(\mathcal O(q)\).
3. Use proper agreement and the localization triangle for \(\mathbf A^1\subset\mathbf P^1\) to compute \(R\Gamma_c(\mathbf A^1,\Lambda)\), then compute \(\mathbf G_m\) from \(\{0\}\subset\mathbf A^1\).
4. Use compact-support Künneth to compute \(\mathbf A^n\), and use the affine-cell filtration or the hyperplane-class calculation to verify \(\mathbf P^n\).

Then prove that the constant-sheaf trace formula gives the standard point counts for finite étale schemes, affine space, the multiplicative group, and projective space. None of these cohomology calculations may use Grothendieck--Lefschetz or a point-count identity. This is a bounded projective-space calculation, not a purity or Poincaré-duality roadmap.

### Layer 13: Hasse--Weil zeta functions

Define

\[
Z(X,t)
=
\exp\left(
\sum_{r\ge1}
\#X(\mathbf F_{q^r})\frac{t^r}{r}
\right)
\]

as a formal power series over \(\mathbf Q\), and prove the equivalent Euler product

\[
Z(X,t)=\prod_{x\in|X|}(1-t^{\deg x})^{-1}.
\]

Build the combinatorics relating rational points over extensions to closed points and Frobenius orbits. Prove:

* multiplicativity under open--closed decompositions;
* products/coproducts in the standard forms;
* base extension formulas;
* explicit zeta functions of a point, affine space, \(\mathbf G_m\), and projective space.

Using Grothendieck--Lefschetz and the determinant identity, prove

\[
Z(X,t)
=
\prod_i
\det
\left(1-t\operatorname{Frob}_q
\mid H^i_c(X_{\bar k},\mathbf Q_\ell)
\right)^{(-1)^{i+1}}.
\]

Deduce rationality.

### Layer 14: sheaf \(L\)-functions

For a lisse \(\mathbf Q_\ell\)-sheaf, or more generally a coefficient complex \(K\) in the normalized bounded constructible adic category built by `EllAdicRealization`, define local Euler factors

\[
L_x(K,t)
=
\det
\left(
1-t^{\deg x}\operatorname{Frob}_x
\mid K_{\bar x}
\right)^{-1}
\]

and the Euler product

\[
L(X,K,t)=\prod_{x\in|X|}L_x(K,t).
\]

Also define the exponential trace-series form and prove the two definitions agree. Then prove the cohomological determinant formula

\[
L(X,K,t)
=
\prod_i
\det
\left(
1-t\operatorname{Frob}_q
\mid H^i_c(X_{\bar k},K)
\right)^{(-1)^{i+1}}.
\]

Build:

* rationality;
* compatibility with distinguished triangles/direct sums;
* tensor and dual operations at the local-factor level;
* induction under finite maps;
* Tate twists;
* change of coefficient field;
* finite group equivariance and isotypic factors when the coefficient field permits them.

The constant sheaf recovers \(Z(X,t)\).

### Layer 15: worked curve factorization

For a smooth projective geometrically connected curve \(C/\mathbf F_q\), prove

\[
Z(C,t)
=
\frac{
\det(1-t\operatorname{Frob}^{\mathrm{geom}}_q\mid H^1(C_{\bar k},\mathbf Q_\ell))
}{(1-t)(1-qt)}
\]

with the pinned geometric-Frobenius/Tate-twist convention. Prove the degree of the numerator from the finite-dimensional cohomology computation available in the library.

Do not prove a bound on the roots. The Riemann hypothesis/weights assertion belongs to the successor roadmap described in the family README.

**Summit:** the sheaf-theoretic trace formula and cohomological \(L\)-function identity hold for all Frobenius powers and the pinned ctf coefficient category.

## Worked examples and acceptance criteria

1. The trace of a perfect complex is independent of its finite-projective representative.
2. Additivity in a distinguished triangle recovers the open--closed additivity used by compact support.
3. For a finite Frobenius set, the number of fixed points equals the trace of the corresponding permutation representation.
4. For \(\operatorname{Spec}\mathbf F_{q^m}\), the trace formula reproduces the correct \(\mathbf F_{q^r}\)-point count.
5. For \(\mathbf A^n\), \(\mathbf G_m\), and \(\mathbf P^n\), the trace formula recovers the standard counts for every \(r\).
6. Tate twisting changes Frobenius eigenvalues and local Euler factors according to the pinned convention.
7. A nontrivial finite local system on a finite étale scheme has the expected trace function.
8. The zeta function of \(\mathbf G_m\) is obtained both from point counts and from compactly supported cohomology.
9. The curve factorization is proved without invoking weights.

A layer is not complete if it proves only the constant-sheaf cardinality formula. Local systems, derived additivity, all powers, compact support, and determinant identities are core requirements.

## Design notes for Lean

### Keep generic trace algebra generic

Finite-projective and perfect-complex traces belong in generic algebra/category-theory files. The algebraic-geometry files should only construct Frobenius endomorphisms and apply that API.

### Use perfect-complex trace at finite level

Do not add projectivity assumptions to cohomology groups merely to state an alternating trace. The ctf/perfect framework is designed to avoid that error.

### Prove all-power compatibility from iteration

The theorem for \(q^r\) should be obtained from a coherent iterated-Frobenius API, not by copying the \(r=1\) theorem with field names changed.

### Separate definitions from cohomological theorems

Point-count zeta functions and Euler-product \(L\)-functions are defined arithmetically. The cohomological expressions are theorems. This separation prevents circularity and makes the objects useful before cohomology is invoked.

### Preserve coefficient and group actions

Trace identities should be natural under coefficient extension and equivariant decompositions. This is essential for trace functions and representation-theoretic applications.

## Scope boundaries

The following are not targets of this roadmap:

* Deligne's weight formalism, purity, mixedness, or eigenvalue bounds;
* the Riemann hypothesis part of the Weil conjectures;
* the full Lefschetz--Verdier trace formula for arbitrary correspondences;
* stacky trace formulas;
* orbital integrals or automorphic trace formulas;
* perverse sheaves and the decomposition theorem;
* functional equations requiring Poincaré/Verdier duality beyond infrastructure already available.

## Completion criterion

This roadmap is complete when:

* finite-projective and perfect-complex traces and determinants have complete invariance and additivity APIs;
* local and global Frobenius endomorphisms are constructed with the pinned convention;
* local trace functions are defined for ctf coefficients;
* the zero-dimensional formula, Weil's smooth-projective-curve theorem, and the dimension-at-most-one trace formula are proved;
* the Noether-normalization curve-fibration reduction proves the general Grothendieck--Lefschetz formula for every \(r\ge1\);
* the constant \(\mathbf Q_\ell\)-sheaf point-count formula is available;
* Hasse--Weil zeta functions and sheaf \(L\)-functions are defined arithmetically and identified cohomologically;
* rationality and the worked curve factorization are proved;
* products, localization, coefficient change, Tate twists, and finite group actions are compatible with the theory;
* the worked examples pass;
* the Tau Ceti implementation contains no `sorry`.
