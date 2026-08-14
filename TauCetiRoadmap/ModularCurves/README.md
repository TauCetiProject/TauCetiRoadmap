# Roadmap: modular curves, following Katz–Mazur

This roadmap formalises the moduli of elliptic curves with level structure, following N. Katz and
B. Mazur, *Arithmetic Moduli of Elliptic Curves* (Annals of Mathematics Studies 108, 1985).
The book is abbreviated **KM**, and its result numbering is used throughout. D. Loeffler's
*Modular Curves* lecture notes are cited alongside KM for some of the classical constructions over
`ℤ[1/N]`.

The roadmap begins with elliptic curves as group schemes over an arbitrary base, finite subgroup
schemes, isogenies, duality, and the Weil pairing. It then develops Drinfeld structures and the
Katz–Mazur moduli formalism. The proof of the First Main Theorem follows the order of KM: Chapter 5
first treats `[Γ(N)]`, `[Γ₁(N)]`, and balanced `[Γ₁(N)]`; Chapter 6 then proves the
isomorphism and cyclicity theorems needed to construct `[Γ₀(N)]`. Quotient problems and coarse
moduli schemes come only after those integral problems have been constructed.

`Suggested.lean` accompanies this document. It contains representative target declarations,
including provisional carrier signatures for objects whose construction is itself a milestone.

## Scope

The roadmap includes:

- elliptic curves as smooth proper commutative group schemes of relative dimension one;
- the low-degree relative cohomology of `𝒪_E(n[0])` and the Picard-theoretic results needed for
  Weierstrass equations and dual isogenies;
- finite locally free subgroup schemes, multiplication maps, isogenies, quotients, dual isogenies,
  degree, and the Weil pairing;
- full sets of sections and Drinfeld level structures over arbitrary bases;
- the category `Ell/R`, relative representability, rigidity, and KM 4.7.0;
- `Y₁(N)` for `N≥4`, the full ordered-basis scheme `Y_full(N)` for `N≥3`, its fixed-pairing
  fibres, and the twisted curve `Y(ρ)` for `N≥3`;
- the coarse `j`-line and the coarse modular curve `Y₀(N)`;
- the deformation theory needed for KM 5.1.1.

The following topics are not included: compactified modular curves, generalized elliptic curves,
Igusa curves, a general theory of algebraic stacks or algebraic spaces, modular forms and Hecke
operators, Néron models, complex uniformisation, and geometric connectedness or irreducibility of
the fine curves. General coherent cohomology, the general Riemann–Roch theorem, and the general
Picard scheme are not reconstructed here. This roadmap consumes the line-bundle,
curve-cohomology, Riemann–Roch, Serre-duality, and cohomology-and-base-change foundations from the
[Jacobian Challenge roadmap](../JacobianChallenge/README.md). It then proves the relative
genus-one consequences needed here. In particular, because the present Jacobian Challenge
contract constructs the Picard scheme only for a curve over a field, Layer 2D owns the narrowly
scoped relative Picard functor and Poincaré bundle for an elliptic curve over an arbitrary base.

This roadmap owns the scheme-theoretic theory of elliptic curves needed for modular curves. The
separate elliptic-curves roadmap owns equation-level arithmetic. Its only direct use here is the
normalisation comparison between the scheme-theoretic and equation-level Weil pairings over a
field where `N` is invertible. The comparison between scheme isogenies and embeddings of function
fields belongs instead to the Algebraic Curves roadmap; it has no consumer here and is not a
dependency of this roadmap.

The exact contracts consumed from the Jacobian Challenge are:

- invertible sheaves, the divisor–line-bundle correspondence, and base change for `𝒪(D)`;
- Riemann–Roch and Serre duality for proper curves over a field;
- proper-flat coherent cohomology, Grauert's theorem, and arbitrary base change.

The fppf descent statements for line bundles and the additional scheme data used here are proved
in Layer 0E from the shared descent infrastructure; they are not attributed to the field-valued
Picard endpoint of the Jacobian Challenge.

This roadmap retains the relative-curve divisor lemmas special to KM, the explicit computation of
`π_*𝒪_E(n[0])`, the relative genus-one Picard and Poincaré construction, elliptic autoduality, the
comparison of the two constructions of the dual isogeny, Cartier–Nishi kernel duality, and the Weil
pairing.

The intended homes are

```text
TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/
TauCeti/AlgebraicGeometry/ModularCurve/
```

with reusable material on Cartier divisors, finite group schemes, finite quotients, and descent
placed in the corresponding general Mathlib-style directories.

## Conventions

1. **Elliptic curves.** An `EllipticCurveGeom S` consists of a morphism `π : E ⟶ S`, smooth and
   proper of relative dimension one, and a section `0 : S ⟶ E`. Zariski-locally on `S`, there
   must be a pointed isomorphism

   ```text
   (E_U, 0_U) ≅ (projModel W, [0 : 1 : 0])
   ```

   for an elliptic Weierstrass equation `W/U`. Thus the local isomorphism is required to carry
   the distinguished section to the point at infinity. This condition is part of the definition;
   without it the local addition formulae would not glue to a group law with identity `0`.
   The local equations are not stored as part of the object. An `EllipticCurve S` is an
   `EllipticCurveGeom S` with its canonical commutative group structure. A uniqueness theorem
   shows that two compatible group structures with the same zero section agree.

2. **Group schemes.** Group schemes over `S` are group objects in the cartesian category `Over S`.
   The constant group scheme associated to a finite group and the diagonalizable group scheme
   associated to a finite abelian group are different constructions. In particular,
   `D(ℤ/Nℤ) ≅ μ_N`, while `(ℤ/Nℤ)_S` is a disjoint union of copies of `S`.

3. **Degree.** The rank of a finite locally free morphism is locally constant. An isogeny over an
   arbitrary base therefore has a locally constant degree. `IsogenyOfDegree n` denotes the
   constant-rank case. Statements involving a single integer degree either use this predicate or
   assume a preconnected base. The trace of an endomorphism is treated in the same way: it is a
   locally constant integer-valued function in general, and a single integer only over a
   preconnected base. Assertions that `[N]` is finite require `[NeZero N]`; `[0]` is not a finite
   isogeny.

4. **Level structures.** The level `N` is always positive, and Lean declarations carry `[NeZero N]`
   when this is not already implied by a numerical bound. Drinfeld structures are the definitions
   used over arbitrary bases. Naive pointwise structures are separate definitions and are compared
   with Drinfeld structures only when `N` is invertible on the base (KM 1.4.4 and §3.7).

5. **Full level and actions.** Ordered bases are written as row vectors. For

   ```text
   g = [[a,b],[c,d]] ∈ GL₂(ℤ/Nℤ),
   ```

   the right action is

   ```text
   (P,Q)g = (aP + cQ, bP + dQ).
   ```

   The full ordered-basis scheme is denoted `Y_full(N)`. Its Weil-pairing determinant takes values
   in `μ_N^prim`. For a chosen primitive root `ζ`, the corresponding fibre is denoted
   `Y(N, ζ)`. Statements about connectedness or irreducibility would concern this fixed-pairing
   fibre, not `Y_full(N)`.

6. **Bases.** The integral level problems are defined over `ℤ`. The ring `ℤ[1/N]` is introduced
   only for naive level structures, étaleness, and the affine fine modular curves. A chosen
   primitive root belongs over `ℤ[1/N, ζ_N]`, or more generally over a base equipped with a
   section of `μ_N^prim`.

7. **References.** KM's numbering is the common coordinate system. Statements taken from
   Loeffler's notes rather than directly from KM are identified as such.

8. **Quotients of moduli problems.** The integral Katz–Mazur quotient `P/H`, the objectwise
   orbit presheaf, and a coarse scheme quotient are different objects. The notation `P/H` in
   this roadmap always means the quotient problem characterised by KM 7.1's conditions Q1 and Q2;
   it never means the generally non-sheaf-valued presheaf `T ↦ P(T)/H`.

## Existing Mathlib and work in progress

The roadmap uses the following existing material.

- `Scheme`, `Spec`, `Proj`, fibre products, `Over`, and the morphism-property library: finite,
  flat, étale, smooth with relative dimension, proper, separated, immersions, quasi-finite
  morphisms, and descent results.
- Ideal sheaves, closed subschemes, and kernels of scheme morphisms.
- Group objects in cartesian monoidal categories.
- `Mathlib/AlgebraicGeometry/Group/`. `Abelian.lean` proves commutativity of a proper
  geometrically integral group scheme **over a field**, so over a general base it applies
  fibrewise only and the passage to a global statement is an argument this roadmap owes (for
  Weierstrass models commutativity is anyway immediate from the symmetric addition formula).
  ⚠ `Affine.lean`, the correspondence between commutative Hopf algebras and affine group
  schemes, landed in mathlib4#40500 on 2026-07-21 and is **not present at this repository's
  Mathlib pin** `9caeba10` (2026-06-03), where the directory holds only `Abelian.lean` and
  `Smooth.lean`. Layer 0B therefore builds the missing correspondence in a Mathlib-compatible
  namespace at the present pin; a later pin may replace that local implementation without changing
  the public contract.
- `Mathlib/AlgebraicGeometry/Morphisms/FlatRank.lean`, which supplies `Scheme.Hom.finrank` and
  `Scheme.Hom.isLocallyConstant_finrank` — the locally constant rank that Convention 3 and
  Layer 2A are stated in terms of.
- Weierstrass curves, variable changes, division polynomials, and the pointwise group law.
- Finite, flat, and étale ring maps, finite locally free rank, invariant subrings, Hopf algebras,
  regular local rings, completions, and Krull dimension.
- The available flatness files include `Flat/Localization`, `Flat/EquationalCriterion`,
  `Flat/TorsionFree`, and `LocalFlatDescent`. The curve-specific fibrewise flatness and miracle
  flatness results required below are not assumed to exist; they are explicit targets in Layers
  2A, 4D, and 7B.
- Representable functors, `Over`-categories, and scheme gluing.
- The Jacobian Challenge roadmap's line-bundle, coherent-cohomology,
  and cohomology-and-base-change contracts. Its Picard-scheme endpoint is presently stated over a
  field; the relative elliptic Picard and Poincaré construction is therefore an explicit milestone
  in Layer 2D rather than an assumed supplier theorem. The descent package used here is Layer 0E.

Two open Mathlib pull requests overlap directly with Layer 1:

- mathlib4#25983, **“define the affine scheme associated to an elliptic curve”**;
- mathlib4#35151, **“WIP: group scheme structure on Weierstrass curve”**.

The first concerns the affine scheme associated to the equation, not the complete projective model.
The Tau Ceti development should be reconciled with both APIs rather than duplicate them. Existing
The current AINTLIB work and the source audit used to reconcile it with this roadmap are recorded
in the final section below. Volatile implementation counts are deliberately omitted.

## Layer 0: scheme-theoretic prerequisites

This layer contains the general algebraic geometry used by the later layers.

### 0A. Relative effective Cartier divisors

References: KM 1.1.1, 1.2.2, 1.2.3.

Use the general divisor and invertible-sheaf objects supplied by the Jacobian Challenge. For a
smooth relative curve `C ⟶ S`, prove the following KM-specific statements.

1. Define a relative effective Cartier divisor by an invertible ideal sheaf together with flatness
   over `S`. Prove the fibre criterion in its exact form: if `S` is locally noetherian, `C ⟶ S` is
   flat and locally of finite type, and the closed finitely presented subscheme `D⊆C` is flat over
   `S`, then `D` is a relative effective Cartier divisor if and only if every geometric fibre is an
   effective Cartier divisor. Prove the limit/descent version used after spreading out to an
   arbitrary base.
2. A section `P : S ⟶ C` defines the relative effective Cartier divisor `[P]`.
3. Sums, inverse images under flat morphisms, and arbitrary base change preserve relative effective
   Cartier divisors.
4. A relative effective Cartier divisor on `C/S` is finite over `S` exactly when it is proper over
   `S`; in that case it is finite locally free. Thus finiteness is a theorem under a properness
   hypothesis, not part of the definition.
5. Its degree is the locally constant rank of the resulting finite locally free morphism. For a
   finite flat morphism of curves, inverse images multiply degrees.
6. Construct the universal incidence locus `D' ≤ D` and universal equality locus `D'=D`, prove
   their scheme structures, universal properties, and arbitrary base-change compatibility.
7. For a finite locally free divisor on a commutative smooth relative curve, prove the subgroup
   criterion in terms of the identity, inversion, and addition maps.

**Dependencies.** Mathlib's ideal-sheaf and morphism-property libraries and the Jacobian Challenge
divisor–line-bundle interface.

**Consumers.** This block is used by the section-divisor and pole-sheaf constructions in Layer 1,
the Picard and Weil-pairing constructions in Layer 2, all Drinfeld structures in Layer 3, the first
three integral level problems in Layer 6, `[Γ₀(N)]` in Layer 8, and the regularity arguments. What
runs *without* it is the **naive** side: the naive level structures of Layer 3N, the moduli formalism
of Layer 4, and the direct Tate-normal-form construction of Layer 5A, which depend on 3N rather than
on 3A–3D and may therefore proceed in parallel with this strand. Full-level representability in
Layer 5B also uses the endomorphism rigidity of Layer 2F, hence the Picard duality of Layer 2D.
Layer 5C and the determinant refinements additionally consume the Weil pairing of Layer 2E.

### 0B. Finite locally free group schemes and Cartier duality

References: KM §1.12, especially 1.12.4 and 1.12.7, and §§2.5, 2.8;
SGA 3, Exposé VIIA, §3.3 for Cartier duality. KM 2.8.2 cites the Cartier–Nishi theorem to Oda;
the Picard and Poincaré construction used here is specified in Layer 2D rather than left as an
unnamed black box. KM §1.11 (extensions of an étale group) is not used.

Develop the affine-group-scheme/Hopf-algebra anti-equivalence and the category of finite locally
free commutative group schemes. Construct scheme-theoretic kernels of arbitrary homomorphisms and
prove their base-change property, but do not assert that such a kernel is always finite locally
free: its rank can jump. For a closed finite locally free subgroup `C ⊆ G`, construct the fppf
quotient under the representability hypotheses of Layer 0C and prove that the resulting sequence
is exact as a sequence of fppf sheaves. Construct separately the constant finite group scheme and
the diagonalizable group scheme:

```text
G_S = ⨆_{g∈G} S ≅ Spec_S(∏_{g∈G} 𝒪_S),
D_S(M) = Spec_S 𝒪_S[M],
μ_N = D_S(ℤ/Nℤ).
```

Over `S=Spec R`, the coordinate algebra of `G_S` is `Map(G,R)`.

Construct Cartier duality as a contravariant anti-equivalence on finite locally free commutative
group schemes. Prove evaluation, biduality, preservation of rank, and arbitrary base change. Prove
exactness for fppf-exact short sequences whose terms are finite locally free, and derive the
kernel–quotient comparison only under the hypotheses which keep both objects in this category. In
particular, prove

```text
((ℤ/Nℤ)_S)ᴰ ≅ μ_N,
(μ_N)ᴰ ≅ (ℤ/Nℤ)_S.
```

Finally prove that a finite locally free commutative group scheme of rank `N` is killed by `N`.
This is the input which turns a Drinfeld point of exact order `N` into an `N`-torsion section and
which makes the factorisation construction of the dual isogeny possible.

**Dependencies.** Mathlib's affine group-scheme and Hopf-algebra APIs, in particular
`AlgebraicGeometry/Group/Affine.lean`. At the current pin its declarations must be supplied in Tau
Ceti with the same public shape; the roadmap does not wait for a future Mathlib pin.

### 0C. Finite quotients and torsors

Prove three separate results.

1. **Affine quotients.** If a finite group acts on `Spec A`, construct `Spec A^G`, prove its
   categorical universal property, and prove that `A` is integral over `A^G`. If `A` is a
   finite-type algebra over an invariant base ring and the action is by base-algebra automorphisms,
   prove that `A` is module-finite over `A^G`, so the quotient map is finite. Every later moduli
   application must verify this finite-type hypothesis.
2. **Finite group-scheme torsors.** For a finite locally free group scheme acting on an affine
   scheme, develop the Hopf–Galois criterion, the invariant algebra, faithful flatness, and descent.
   Prove that a torsor action has the affine fppf quotient with the expected universal property.
3. **Free actions.** If a finite constant group acts freely on a scheme `X` and `X` has a
   group-invariant affine open cover, glue the affine invariant quotients and prove that the result
   represents the fppf quotient. Prove that the affine simultaneous moduli schemes used in Layers 4,
   5, and 9 satisfy this hypothesis. Without such a cover the fppf quotient is generally only an
   algebraic space, and no unrestricted scheme-quotient theorem is asserted.

Develop the finite-flat torsor statements needed for rigidifiers and descent.

**Dependencies.** Layer 0B for the group-scheme statements; Mathlib's affine invariant theory and
scheme gluing. The special quotient of an elliptic curve by a finite subgroup is constructed only
after elliptic curves exist, in Layer 2B.

### 0D. Finite étale schemes and Galois actions

Develop the finite étale results used by the level structures: sections, fibre cardinalities, local
constancy, cancellation, and descent.

Over a field `K`, construct the equivalence between finite étale `K`-schemes and finite continuous
`Gal(Kˢ/K)`-sets. Prove that it preserves products and transports group objects, commutative group
objects, homomorphisms, and alternating pairings. This is the input for `V_ρ` in Layer 5C.

**Dependencies.** Mathlib's finite étale and Galois theory.

### 0E. Effective descent and spreading out

Prove effective faithfully flat descent, with cocycle and uniqueness statements, in the exact
forms used below:

- affine schemes;
- finite locally free schemes and closed subschemes;
- sections and morphisms;
- projective relative curves equipped with a compatibly descended relatively ample line bundle;
- an elliptic curve together with its zero section and the polarisation `𝒪_E(3[0])` used to make
  the preceding descent effective;
- group objects and homomorphisms on an underlying scheme already descended by one of these
  effective cases;
- the group law and all group axioms;
- finite locally free subgroup schemes and equalities of Cartier divisors;
- level structures;
- finite group actions and torsors.

Do not assert effectivity for an arbitrary projective scheme without descended polarisation data.
The theorem must descend the universal elliptic curve itself, using `𝒪_E(3[0])`, not merely maps
between schemes which have already descended. For spreading out, prove finite-presentation models
for the curve, section, group law, subgroup, and level data; prove that morphisms and equalities
descend to a common model; and prove that the agreement locus for two finitely presented morphisms
is representable and contains the original base after enlargement. Equality on geometric fibres is
not used as a substitute for equality over a nonreduced base.

**Dependencies.** Mathlib's descent and finite-presentation machinery.

### 0F. Hom-schemes and closed loci

Construct the representable Hom functors used in Layer 3. The required general result is the
finite-locally-free Weil-restriction case: if `Z ⟶ S` is finite locally free and `X ⟶ Z` is affine
of finite presentation, the functor of `Z`-morphisms is represented by an affine `S`-scheme.
Deduce the special cases representing:

- tuples of sections of a finite locally free `S`-scheme;
- homomorphisms between finite locally free group schemes;
- the ambient schemes in which the full-set, exact-order, and full-level loci are cut out.

Prove compatibility with arbitrary base change.

**Dependencies.** Layer 0B and Mathlib's representable-functor and affine-scheme APIs.

### 0G. Parameter spaces for subgroup schemes

Weil restriction represents maps from a fixed finite locally free source; it does not parameterise
all subgroup schemes. Given a finite locally free commutative group scheme `G/S`, construct the
relative Grassmannian of locally free rank-`N` quotients of its Hopf algebra. Cut out the unit,
multiplication, counit, comultiplication, antipode, and Hopf-ideal equations as closed loci. Prove
that the relative spectrum of the universal quotient is a finite locally free subgroup scheme of
`G`, has rank `N`, and commutes with arbitrary base change.

At the current pin, Mathlib supplies the module-valued Grassmannian functor but not the relative
Grassmannian scheme or its representability. This block constructs its affine charts, transition
maps, gluing, and universal property. The elliptic specialization `G=E[N]` and the name
`[N-Isog]` occur only in Layer 6, after `E[N]` exists.

**Dependencies.** Layers 0B and 0F and Mathlib's algebraic Grassmannian functor.

## Layer 1: elliptic curves over a base scheme

References: KM 2.1 and Deligne–Rapoport II.1.

### 1A. Projective Weierstrass models

For `W : WeierstrassCurve R`, construct the projective cubic

```text
Y²Z + a₁XYZ + a₃YZ² = X³ + a₂X²Z + a₄XZ² + a₆Z³
```

as a closed subscheme of `ℙ²_R`, with its structure morphism and zero section `[0:1:0]`.
Prove properness, smoothness of relative dimension one when `W.IsElliptic`, compatibility with base
change, and compatibility with `VariableChange`.

Define `EllipticCurveGeom S` using the pointed local-Weierstrass condition from the conventions.
Define base change and prove its functoriality.

**Dependencies.** Mathlib's projective spectrum, Weierstrass, and morphism-property APIs.

### 1B. The points dictionary

The comparison with equation-level points is stated in stages.

1. Over a field, sections of `projModel W ⟶ Spec K` are naturally equivalent to
   `W.toAffine.Point`, and the point at infinity corresponds to the zero section.
2. Over a local ring, use a globally trivial line bundle and unimodular homogeneous coordinates.
3. Over a ring with trivial Picard group, use the same description after proving triviality of the
   relevant line bundle.
4. For an arbitrary base `T`, describe a `T`-point by a line bundle with three generating sections,
   satisfying the cubic equation, modulo the usual isomorphism, and prove the dictionary by Zariski
   descent.

No theorem identifies an arbitrary `T`-point with one global unimodular triple.

**Dependencies.** Layer 1A and Mathlib's projective-space functor of points.

### 1C. The group structure and rigidity

Construct the group law on the projective Weierstrass model by the following chart calculation.

1. Give a finite open cover of `E ×_S E` on which the addition formulae are regular.
2. Define the formula on each chart and prove that every pair lies in at least one chart.
3. Prove equality of the formulae as scheme morphisms on every overlap, including over nonreduced
   bases; equality on field-valued points is not sufficient.
4. Glue the chart morphisms and prove compatibility with Weierstrass variable changes and arbitrary
   base change.
5. Construct the identity and inverse and prove associativity, commutativity, and the inverse laws.
6. Prove agreement with Mathlib's pointwise group law on every field-valued fibre.

Define `EllipticCurve S` by equipping `EllipticCurveGeom S` with this canonical commutative group
structure. Prove that a compatible group structure with the given zero section is unique.

Use Mathlib's general result from `AlgebraicGeometry/Group/Abelian.lean` when it applies, rather than
reproving commutativity from scratch.

**Dependencies.** Layers 0E, 1A, and 1B.

### 1D. The zero divisor and pole sheaves

Construct the relative effective Cartier divisor `[0]`, its multiples, and the line bundles

```text
ℒ_n = 𝒪_E(n[0]).
```

Use fibrewise Riemann–Roch and Serre duality, followed by Grauert's theorem and cohomology and base
change, to prove for `n>0`

```text
R¹π_*ℒ_n = 0,
π_*ℒ_n is locally free of rank n,
π_*ℒ_n commutes with arbitrary base change.
```

After a pointed Weierstrass trivialisation, construct the bases

```text
n=1:  1
n=2:  1, x
n=3:  1, x, y
n=4:  1, x, y, x²
n=5:  1, x, y, x², xy
n=6:  1, x, y, x², xy, x³
```

and the multiplication maps between the pole sheaves. Prove that the unique relation in pole order
six is the Weierstrass equation, and prove its transformation law under a variable change. These
are local bases: the Hodge line need not be globally trivial on an arbitrary base. Prove that the
construction is independent of the chosen pointed equation and compatible with arbitrary base
change.

**Dependencies.** Layers 0A and 1A, and the Jacobian Challenge contracts for curve
Riemann–Roch, Serre duality, Grauert's theorem, and cohomology and base change.

## Layer 2: isogenies, duality, and the Weil pairing

References: KM 2.3.1, 2.5.1, 2.6.1–2.6.3, 2.7.1–2.7.4, and §2.8.

### 2A. Multiplication maps, homomorphisms, and degree

Prove that a pointed morphism of elliptic curves is a group homomorphism (KM 2.5.1), first over a
locally noetherian base and then over an arbitrary base by the spreading-out results of Layer 0E.
Construct `Hom_S(E,E')`, `End_S(E)`, and multiplication by an integer.

For `[NeZero N]`, prove KM 2.3.1 in the following steps.

1. Construct `[N] : E ⟶ E` and prove compatibility with arbitrary base change.
2. Prove quasi-finiteness from the geometric fibres.
3. Deduce finiteness from properness and quasi-finiteness.
4. Prove surjectivity.
5. Prove the curve-flatness lemma used here: a finite morphism between `S`-smooth relative curves
   whose geometric fibres all have the same length is finite locally free. Derive it from the local
   criterion for flatness after noetherian approximation, then apply it to `[N]`.
6. Compute the scheme-theoretic fibre length as `N²`, including in residue characteristic dividing
   `N`.
7. Identify the locally constant finite-flat rank with `N²`.
8. Define `E[N]` as the scheme-theoretic kernel and prove that it is finite locally free of rank
   `N²`, with arbitrary base change.
9. Compute the differential of `[N]` at the identity and prove that `[N]`, hence `E[N]`, is étale
   where `N` is invertible.

The geometric-point statement is separate: over an algebraically closed field in which `N` is
invertible, `E[N](k) ≅ (ℤ/Nℤ)²`. It is never used in residue characteristic dividing `N`.
Define the locally constant degree of an isogeny and `IsogenyOfDegree n`.

**Dependencies.** Layers 0E and 1A–1C and Mathlib's finite, flat, proper, local-flatness, and
fibre-length APIs. The proof does not use the Cartier divisor or pole-sheaf theory of Layers 0A and
1D.

### 2B. Isogenies and quotients

Define an isogeny to be a finite locally free surjective homomorphism of elliptic curves. For a
finite locally free subgroup scheme `C ⊆ E`, construct the fppf quotient sheaf and prove that it is
represented by a scheme `E/C`. Prove that `E ⟶ E/C` is an fpqc `C`-torsor. Descend the zero section
and group law; prove properness, smoothness of relative dimension one, the pointed local
Weierstrass condition, and arbitrary base-change compatibility. This gives the quotient isogeny

```text
q_C : E ⟶ E/C
```

with scheme-theoretic kernel `C`. Prove its categorical universal property and compatibility with
successive quotients. Prove that every isogeny factors through the quotient by its kernel and that
`E/ker φ ⟶ E'` is an isomorphism.

**Dependencies.** Layers 0B, 0C, 0E, and 2A.

### 2C. The factorisation dual

Let the isogeny `φ : E ⟶ E'` have constant degree `n`. By Layer 0B, `ker φ`, which has rank `n`, is
killed by `n`. Factor `[n]_E` through `E/ker φ`, identify the quotient with `E'`, and define

```text
φ̂_fac : E' ⟶ E.
```

Prove `φ̂_fac ∘ φ = [n]_E`. Use fpqc cancellation along the surjective map `φ` to prove
`φ ∘ φ̂_fac = [n]_{E'}`. Prove its degree, arbitrary base change, involutivity, compatibility
with multiplication maps, and reversal of composition. The Lean statements must display the source
and target of both composition identities.

**Dependencies.** Layers 0B and 2B and the constant-degree convention.

### 2D. Picard duality and comparison of the duals

Construct the relative genus-one Picard package needed here rather than assuming the field-valued
Jacobian endpoint in arbitrary families. For an elliptic curve `E/S`:

1. define the fppf Picard functor as the sheafification of
   `T ↦ Pic(E_T)/Pic(T)`, and its zero-rigidified version;
2. define the degree-zero open-and-closed subfunctor using fibrewise degree;
3. for a degree-zero line bundle `L`, apply the calculation of Layer 1D to `L([0])`: prove fppf
   locally that it has a unique effective divisor of degree one, descend the resulting section, and
   deduce that `P↦𝒪_E([P]-[0])` represents the degree-zero subfunctor by `E` itself;
4. on `E×_S E`, construct the normalized Poincaré bundle from
   `𝒪(Δ-E×[0]-[0]×E)`, prove its universal property, and establish the seesaw, biextension,
   descent, and arbitrary-base-change identities.

The construction consumes the general line-bundle and descent infrastructure of the Jacobian
Challenge, but the relative representability and Poincaré theorem in this genus-one setting belong
to this layer. Construct the canonical principal polarisation

```text
λ_E : E ≅ Pic⁰_{E/S},
P ↦ 𝒪_E([P]-[0]).
```

With the translation convention `t_P(Q)=Q+P`, fix the sign by writing this line bundle as
`t_{-P}^*𝒪_E([0]) ⊗ 𝒪_E([0])⁻¹`. Prove that `λ_E` is an isomorphism of group schemes,
compatible with arbitrary base change. Construct its inverse from degree-one rigidified line
bundles using the cohomology of Layer 1D.

For every homomorphism `φ : E ⟶ E'`, not only for an isogeny, define the Picard dual

```text
φᵗ = λ_E⁻¹ ∘ Pic⁰(φ) ∘ λ_{E'} : E' ⟶ E.
```

Prove that this construction is additive, sends zero to zero and identities to identities, reverses
composition, is involutive, and commutes with arbitrary base change. These statements provide the
general dual-homomorphism operation used in the endomorphism ring of Layer 2F.

For an isogeny `φ` of constant degree `n`, prove `φᵗ ∘ φ = [n]` using the canonical isomorphism
`φ^*𝒪_{E'}([0]) ≅ 𝒪_E(ker φ)` and its polarisation. Compare this identity with the universal
factorisation of Layer 2C and prove

```text
φᵗ = φ̂_fac.
```

Only after this comparison introduce the single public notation `φ̂` for the Picard dual of any
homomorphism. Prove that the dual of an isogeny is again an isogeny. For a general isogeny, compare
with the factorisation construction on each open-and-closed degree stratum; this avoids treating a
locally constant degree as one integer. Transport the composition and degree theorems for isogenies
to the restricted operation, while the endomorphism identity in Layer 2F uses the general operation.

**Dependencies.** Layers 0A, 0E, 1D, and 2C, and the Jacobian Challenge contracts for invertible
sheaves, coherent cohomology, and cohomology and base change.

### 2E. Cartier–Nishi duality and the Weil pairing

For an isogeny `φ : E ⟶ E'`, restrict the Poincaré biextension to construct the Cartier–Nishi pairing

```text
ker φ × ker φ̂ ⟶ 𝔾_m
```

and prove that it induces an isomorphism of finite locally free group schemes

```text
ker φ̂ ≅ (ker φ)ᴰ.
```

This is a scheme-theoretic perfection theorem and must not be replaced by nondegeneracy on
geometric points, which is false as a test in residue characteristic dividing the rank. Apply it to
`[N]`, prove `[N]̂=[N]`, and obtain

```text
E[N] ≅ E[N]ᴰ,
e_N : E[N] ×_S E[N] ⟶ μ_N.
```

Prove, in order:

1. bilinearity and arbitrary base-change compatibility;
2. compatibility with isogenies and dual isogenies;
3. change of level, `e_{NM}(x,y)=e_N(x,y)^M` for `N`-torsion sections viewed as
   `NM`-torsion;
4. skew-symmetry;
5. alternation `e_N(P,P)=1`, using the diagonal argument in KM's Notes Added in Proof rather than
   deducing it from skew-symmetry;
6. scheme-theoretic perfection;
7. `e_N(aP+bQ,cP+dQ)=e_N(P,Q)^(ad-bc)`;
8. comparison with the equation-level Weil pairing over fields where `N` is invertible.

Items 5 and 6 are separate principal milestones. The last item fixes the normalisation and is not
used to construct the pairing.

**Dependencies.** Layers 0A, 0B, and 2D. Item 8 also uses the elliptic-curves roadmap.

### 2F. Endomorphism degree, trace, and rigidity

Define degree as a locally constant natural-number-valued function and trace as a locally constant
integer-valued function on the base. Over a preconnected base, identify them with integers, cast
the degree to `ℤ` in the endomorphism ring, and prove

```text
α̂ = [tr α] - α,
α² - [tr α]α + [deg α] = 0,
(tr α)² ≤ 4 deg α
```

in the precise forms of KM 2.6.2–2.7. Over a base on which `N` is invertible, prove the
naive-level rigidity results of KM 2.7.1–2.7.4: an automorphism acting trivially on an actual
group-scheme basis of `E[N]` is the identity, including full-level rigidity for `N≥3`, the
semi-Borel case for `N≥4`, and the corresponding statements used for `Y(ρ)` and the naive
`[Γ_H]` problems. Extend from noetherian to arbitrary bases by Layer 0E, not by fibrewise equality.

Do not extend this assertion to integral Drinfeld structures. If `E` is supersingular over
`F̄_p`, the pair `(0,0)` is a Drinfeld `[Γ(p)]`-structure, and `[-1]` fixes it; thus integral
full-level rigidity is false even when `p≥3`.

**Dependencies.** Layers 0E, 2A–2D. The characteristic-polynomial identity uses the general
Picard dual of Layer 2D; the Weil pairing of Layer 2E is not needed.

## Layer 3: Drinfeld level structures

References: KM 1.3.5–1.3.7, 1.4, 1.6.2, 1.8.2, 1.9.1,
1.10.1, 1.10.5, 1.10.13, and §§3.1–3.7.

### 3N. Naive level structures

Deliberately the first block of this layer and independent of 3A–3D: over a base on which `N` is
invertible, `E[N]` is finite étale (KM 2.3.1), so the naive structures need no Cartier-divisor
theory and no Drinfeld theory. Layers 4 and 5A–5B consume this block, which is what lets them run
in parallel with the Drinfeld strand.

Over `ℤ[1/N]`, define:

- a **naive `[Γ(N)]`-structure**: an isomorphism of group schemes `(ℤ/N)²_S ≅ E[N]`, equivalently an
  ordered pair of sections that is a basis in every geometric fibre;
- a **naive `[Γ₁(N)]`-structure**: a section `P` of `E[N]` of exact order `N` in every geometric
  fibre;
- a **naive `[Γ₀(N)]`-structure**: a finite locally free subgroup scheme `C ⊆ E[N]`, of order `N`,
  étale-locally generated by a single section.

Prove that each is relatively representable and **étale** over `Ell/ℤ[1/N]` (Loeffler
Proposition 3.8.2, which gives both, for the general `P_H` of Loeffler Definition 3.8.1). Construct
the naive `[Γ₀(N)]` carrier as the finite étale quotient of the full-basis carrier by the Borel,
using the quotient theorem of Layer 0C. Identify it with the cyclic open-and-closed locus in the
subgroup parameter space of Layer 0G. These are the structures in which the rigidifiers of Layer 4C
and the fine curves of Layers 5A–5B are stated; the
comparison with the Drinfeld structures of 3A–3C is Layer 3D, and is needed only where the two
sides must be identified.

**Dependencies.** Layers 0C–0D, 0G, 1A–1C, and 2A. Not 0A, 1D, or 3A–3D.

### 3A. Full sets, `A`-structures, and generators

Let `Z ⟶ S` be finite locally free of rank `r`, and let `s₁,…,s_r` be sections. Define them to be a
**full set of sections** when the following holds **after every base change** `T ⟶ S`: for every
function `f` on `Z_T`,

```text
Norm_{Z_T/T}(f) = ∏ᵢ s_{i,T}^*(f).
```

The universal quantification over base changes is part of the definition. Reduce it to the single
universal polynomial case by the argument in the proof of KM Proposition 1.9.1, not KM 1.8.4,
which is the disjoint-union lemma (a full set for `Z₁` and one for `Z₂` give one for
`Z₁ ⊔ Z₂`). Prove the equivalent characteristic-polynomial formulation of KM 1.8.2, fppf locality,
and arbitrary base-change compatibility.

Using Layer 0F, construct the ambient Hom-scheme, the universal family of sections, and the closed
subscheme cut out by the norm or characteristic-polynomial identities. Prove independence of an
affine presentation, gluing, and the universal property (KM 1.9.1 and 1.10.13(1); KM 1.6.2 cuts
out the *`A`-structure* locus by the subgroup condition 1.3.7, and is the right citation for the
exact-order locus of 3B rather than for this one).

For a finite abelian group `A`, define an `A`-structure on a finite locally free commutative group
scheme `G` and an `A`-generator in the sense of KM Chapter 1. Construct their representing loci and
prove:

- arbitrary base change and fppf descent;
- the subgroup-divisor criterion;
- compatibility with short exact sequences of finite abelian groups;
- product decompositions for factors of coprime order;
- factorisation into the prime-primary parts of `A`;
- the corresponding decomposition of full sets of sections and generator schemes.

This general finite-abelian-group package is the prime-power reduction used in Layer 7; the roadmap
does not replace it by four unrelated factorisation arguments.

**Dependencies.** Layers 0A, 0F, and the norm theory for finite locally free algebras.

### 3B. Exact order and cyclic subgroups

A section `P` of an elliptic curve has exact order `N` when

```text
Σ_{a∈ℤ/Nℤ} [aP]
```

is a subgroup scheme of rank `N` (KM §1.4). Construct the exact-order locus as a closed subscheme of
`E`. Prove that the subgroup divisor is killed by `N`, and hence

```text
P has exact order N ⟶ [N]P=0.
```

Thus the exact-order locus factors through `E[N]`; an implementation may cache this killing
property, but must prove its equivalence with the Katz–Mazur definition. Include the characteristic
`p` regression that the zero section of a one-dimensional smooth group can have exact order `pⁿ`
in Drinfeld's sense. In particular, exact order is not a statement about the abstract order of a
geometric point.

Define a cyclic subgroup of order `N` to be a finite locally free subgroup of rank `N` which is
fppf-locally generated by a section of exact order `N`. Prove KM 1.10.1, 1.10.5, and 1.10.13 in the
forms used by quotient isogenies and `[Γ₀(N)]`.

**Dependencies.** Layers 0A, 0B, 2A, and 3A.

### 3C. The four level structures

Define:

- a `[Γ(N)]`-structure as a homomorphism `(ℤ/Nℤ)^2_S ⟶ E[N]` whose `N²` images form a full set of
  sections (KM §3.1);
- a `[Γ₁(N)]`-structure as a section of exact order `N` (KM §3.2);
- a balanced `[Γ₁(N)]`-structure as a cyclic subgroup `C ⊆ E[N]`, a Drinfeld generator `P` of
  `C`, and a Drinfeld generator `Q` of `Cᴰ` (KM §3.3). Equivalently, using Layer 2,
  `Q` generates the kernel of the dual quotient isogeny. Evaluation gives

  ```text
  det(P,Q) = Q(P) ∈ μ_N;
  ```

- a `[Γ₀(N)]`-structure as a cyclic subgroup of rank `N` (KM §3.4).

For the balanced structure, prove the equivalence with the quotient-isogeny formulation, including

```text
Cᴰ ≅ ker(q_Ĉ),
```

the orientation of `Q(P)`, compatibility with arbitrary base change, and compatibility with the
Weil pairing. Prove base-change functoriality for all four problems. The first three relative
representability theorems are Layer 6. The cyclicity theorem needed to represent `[Γ₀(N)]` is
deliberately postponed to Layer 8.

**Dependencies.** Layers 0A, 0B, 2A, 2B, and 3A–3B.

### 3D. Comparison with naive level structures

Over a base on which `N` is invertible, prove the naive–Drinfeld comparison of KM 1.4.4 and §3.7.
For the balanced comparison, the base must also carry a chosen primitive root

```text
ζ : S ⟶ μ_N^prim,
```

for example `S/Spec ℤ[1/N,ζ_N]`. On the determinant-`ζ` locus, forgetting `(C,Q)` identifies a
balanced structure with a naive `[Γ₁(N)]`-structure: `C` is generated by `P`, and there is a unique
Drinfeld generator `Q` of `Cᴰ` satisfying `Q(P)=ζ`.

**Dependencies.** Layer 3C and the perfect Weil pairing of Layer 2E.

## Layer 4: the Katz–Mazur moduli formalism

References: KM Chapter 4, especially 4.7.0 and Corollary 4.7.2; Loeffler 3.7.4.

### 4A. Moduli problems over `Ell/R`

Define the category fibred in groupoids `Ell/R`: over an `R`-scheme `T`, its objects are elliptic
curves over `T` and its arrows are cartesian isomorphisms. An elliptic curve with additional
structure is first a groupoid-valued pseudofunctor. Construct its presheaf of isomorphism classes
and, where necessary, its fppf sheafification.

Define representability, relative representability, affine, finite, flat, and étale properties over
`Ell/R`. Define rigidity as triviality of automorphisms of an object with structure. Only after
rigidity is proved pass to the corresponding set-valued moduli problem. This is not a general
theory of algebraic stacks; it is the bookkeeping needed for descent and quotient problems.

**Dependencies.** Layer 1.

### 4B. The Weierstrass presentation

Let

```text
W_R = Spec R[a₁,a₂,a₃,a₄,a₆,Δ⁻¹].
```

Define the variable-change group scheme by

```text
x = u²x' + r,
y = u³y' + su²x' + t,
```

including its multiplication law, inverse, and action on `(a₁,a₂,a₃,a₄,a₆)`. Prove:

- every elliptic curve is Zariski-locally obtained from the universal Weierstrass equation;
- every pointed isomorphism of equations is induced by a unique variable change;
- the resulting changes obey the cocycle law;
- the curve, zero section, invariant differential, and additional structure descend;
- the presentation is compatible with arbitrary base change.

These statements are the precise substitute, in this roadmap, for saying that the Weierstrass
scheme presents the moduli stack.

**Dependencies.** Layers 0E and 1A–1C.

### 4C. Rigidifiers and KM 4.7.0

Carry out Katz–Mazur's rigidifier construction in the following definite form.

1. Over `ℤ[1/2]`, construct the full-level-two locus and the finite étale `±ω` scale torsor
   which completes a level-two basis to a Legendre datum. Construct the action of the constant
   group `GL₂(ℤ/2ℤ) × {±1}`; its two factors act in a coupled way, permuting the level-two basis
   and rescaling `ω` (KM 2.2.8–2.2.9). This is the actual Legendre action, not the false action on
   the unaugmented level-two datum.
2. Over `ℤ[1/3]`, construct naive full level three, the `GL₂(𝔽₃)`-action, and its affine
   universal family (KM 2.2.10–2.2.11).
3. For a relatively representable affine rigid problem `P`, represent its simultaneous problem
   with each rigidifier.
4. Use Layer 2F to prove that the finite group and finite group-scheme actions are free.
5. Form the affine invariant quotients, descend the universal elliptic curve and the additional
   structure, and prove their universal properties.
6. Compare the constructions over `ℤ[1/6]` and glue over `Spec ℤ`.

There is no action on the unaugmented Legendre datum that can replace the `±ω` construction, and
there is no level-four rigidifier in KM Chapter 4.

Prove the implication used throughout the roadmap (KM 4.7.0):

> A relatively representable, affine, rigid moduli problem is representable.

The six steps above give this implication. Only this direction is used here. The converse is cheap
and KM records it: its Appendix A.4 opens with the
tautology (A.4.1.2) that `𝒫` is representable exactly when `𝒫̃` is representable and `𝒫` is rigid,
and Proposition A.4.2 gives the three-way equivalence under the étale-sheaf hypothesis that relative
representability supplies. The passage from
representability to a **smooth affine curve over `ℤ`**, which Layers 5B and 5C invoke, is KM
Corollary 4.7.1.

**Dependencies.** Layers 0C, 0E, 2F, 3N, and 4A–4B. The rigidifiers are naive structures, so this
block does not use the integral Drinfeld loci; its rigidity proof nevertheless reaches Layer 0A
through the Picard duality used in Layer 2F.

### 4D. Regularity of a moduli problem

Define regularity in Katz–Mazur's sense (KM 4.12). If `𝒫` is relatively representable and `δ` is a
representable étale rigidifying problem, then `𝒫` is regular of dimension `d` when the scheme
representing `(𝒫,δ)` is regular of dimension `d`. KM quantifies over *all* modular families, so
independence of the rigidifier is built into the definition rather than a theorem of KM's; proving
it for the formulation adopted here is this roadmap's own obligation. ⚠ KM's Notes Added in Proof
(p. 505) correct 4.12: "being of given dimension" is not étale-local, and the intended reading is
that the representing scheme is non-empty and every non-empty Zariski open is `d`-dimensional.
Layer 7 asserts regularity *of dimension two*, so it depends on the corrected reading.

This layer owns the required general scheme-level API:

- strict henselisation and completion of strict henselisations;
- comparison of a finite moduli scheme after strict henselisation and completion;
- regular schemes in terms of regular local rings and Krull dimension at a point;
- preservation and reflection of regularity and dimension under completion;
- locality and invariance under isomorphism and étale morphisms;
- openness of the regular and flat loci;
- the coherent kernel/cokernel support argument used in the homogeneity theorem;
- miracle flatness for finite morphisms between regular local schemes of equal dimension;
- constancy of the rank of a finite flat morphism.

**Dependencies.** Layers 4A and 4C, and Mathlib's regular-local-ring theory.

## Layer 5: affine fine modular curves after inverting `N`

References: KM 2.7.2, 3.7.1, 4.7.0, Corollary 4.7.2; Loeffler 3.3.4, 3.3.6,
3.4.4, and §3.8.

### 5A. Tate normal form and `Y₁(N)` for `N≥4`

Use the direct Tate-atlas construction.

1. For a section `P` such that `P`, `2P`, and `3P` are nowhere the zero section, prove the unique
   Tate normal form

   ```text
   Y² + aXY + bY = X³ + bX²
   ```

   and construct its universal family over `Spec ℤ[a,b,Δ⁻¹]`, including the unique pointed
   isomorphism and arbitrary base change.
2. Compute the discriminant.
3. For `N≥4`, cut out the closed locus `[N]P=0`.
4. Remove the killed-by-`d` loci for all proper divisors `d ∣ N`; after inverting `N`, prove that
   these loci are also open.
5. Identify the result with the naive `[Γ₁(N)]`-problem and prove affineness as an open-and-closed
   subscheme of an affine scheme.
6. Prove smoothness by lifting the Weierstrass coefficients and then the torsion point through the
   étale group scheme `E[N]`.

For `N≥4`, this construction directly represents `Y₁(N)`; it is not routed through KM 4.7.0.
Prove separately that the relative representing map is finite étale over `Ell/ℤ[1/N]` (Loeffler
Proposition 3.8.2). No fine representability assertion is made here for `N≤3`, where the indicated
point structure does not rigidify every elliptic curve.

**Dependencies.** Layers 1A–1C, 2A, and 3N. Because it uses only the naive structures of 3N and the
explicit Weierstrass group law, it does not reach the Cartier-divisor strand of Layer 0A.

### 5B. Full ordered bases and fixed pairing

For `N ≥ 3`, prove rigidity of the naive full-level problem (KM 2.7.2), relative representability by
the full-level locus in `E[N]×_S E[N]` (KM 3.7.1), and representability by a smooth affine scheme
`Y_full(N)` over `ℤ[1/N]` (KM 4.7.0 and Corollary 4.7.2).

Define `μ_N^prim` by the cyclotomic polynomial `Φ_N`, and prove that over `ℤ[1/N]` it is the
open-and-closed exact-order-`N` locus in `μ_N`, finite étale of rank `φ(N)`. Construct:

- the right `GL₂(ℤ/Nℤ)`-action using the row-vector convention;
- the determinant map

  ```text
  det_N : Y_full(N) ⟶ μ_N^prim,
  det_N(E,P,Q) = e_N(P,Q);
  ```

- the formula

  ```text
  det_N((P,Q)g) = det_N(P,Q)^det(g);
  ```

- for a chosen primitive root `ζ`, the fibre `Y(N,ζ)` over `ℤ[1/N,ζ_N]`;
- the induced `SL₂(ℤ/Nℤ)`-action on this fibre.

Prove that the determinant map is surjective. Check this after a faithfully flat finite étale cover
by constructing symplectic bases, then descend surjectivity. Its fibres are open-and-closed
summands, permuted by `GL₂` through the determinant. Call them determinant fibres or fixed-pairing
loci, not connected components. No connectedness or irreducibility theorem is asserted.

**Dependencies.** The representability of `Y_full(N)` uses Layers 2F, 3N, and 4C; through Layer 2F
it consumes the Picard-duality construction of Layer 2D. The determinant map and fixed-pairing
decomposition additionally use the Weil pairing of Layer 2E; they require no further
Cartier-divisor theorem beyond it.

### 5C. The twisted curve `Y(ρ)`

Assume `N ≥ 3`. Let `V` be a free `(ℤ/Nℤ)`-module of rank two with a continuous Galois action and a
perfect alternating Galois-equivariant pairing to `μ_N`. Use Layer 0D to construct the corresponding
finite étale group scheme `V_ρ/ℚ` with pairing.

Construct the moduli scheme explicitly:

1. construct the finite étale frame torsor
   `W = Isom((ℤ/N)²,V_ρ)`;
2. form `Y_full(N)×W`;
3. for a frame `f:(ℤ/N)²≅V_ρ`, cut out the open-and-closed locus on which
   `e_N(P,Q)=⟨f(e₁),f(e₂)⟩`, and prove invariance under the diagonal `GL₂`-action from the
   determinant transformation laws on both sides;
4. let `GL₂(ℤ/Nℤ)` act diagonally and form the finite free quotient;
5. prove that its `T`-points are exactly pairing-preserving isomorphisms
   `E[N]≅V_{ρ,T}`;
6. use Layer 2F to prove that the diagonal action is free, use finite étale descent to prove that
   the quotient is a smooth affine curve `Y(ρ)/ℚ`, and establish its field-points description.

This is a framed symplectic quotient of a fixed-pairing problem, not an unspecified twist of the
union of determinant fibres. It is the interface used by the FLT `3`–`5` switch.

The hypothesis `N ≥ 3` is essential: for `N≤2`, `-1` acts trivially on `E[N]`, so the problem is not
rigid.

**Dependencies.** Layers 0C–0E, 2E–2F, and 5B. The construction uses no new Cartier-divisor result
beyond the Weil pairing already supplied by Layer 2E. The pairing normalisation in Layer 2E uses
the elliptic-curves roadmap.

## Layer 6: the three elementary integral level problems

KM 3.6.0 proves the elementary representability theorem. KM Remark 3.6.1 expressly excludes
`[Γ₀(N)]`, whose construction is postponed to Chapter 6 and Layer 8 below.

Prove relative representability of the following Drinfeld problems:

- `[Γ₁(N)]` by the exact-order locus;
- `[Γ(N)]` by the full-set locus;
- balanced `[Γ₁(N)]` by the cyclic-subgroup and Cartier-dual generator loci.

Prove that the relative representing morphisms are finite, commute with arbitrary base change, and
restrict to the naive problems over `ℤ[1/N]`. Flatness and regularity are proved in Layer 7.

Apply Layer 0G to `E[N]` and define `[N-Isog]`, the parameter scheme and moduli problem of all
rank-`N` subgroup schemes of `E[N]`, equivalently all degree-`N` quotient isogenies. Do not cut out
a cyclic locus and do not claim relative representability of `[Γ₀(N)]` at this stage.

**Dependencies.** Layers 0A–0B, 0F–0G, 2A–2E, 3A–3C, and 4A.

## Layer 7: KM Chapter 5 for the elementary problems

References: KM 5.1.1 and Chapter 5.

This layer proves the First Main Theorem for `[Γ(N)]`, `[Γ₁(N)]`, and balanced
`[Γ₁(N)]`. The `[Γ₀(N)]` clause is Layer 8.

### 7A. The regularity axioms

For a fixed prime `p`, define the four axioms as statements about a moduli problem `𝒫` over
`Ell`:

1. **Reg. 1:** `𝒫` is relatively representable and finite over `Ell`.
2. **Reg. 2:** `𝒫⊗ℤ[1/p]` is finite étale over `Ell⊗ℤ[1/p]`.
3. **Reg. 3:** if `E` and `E'` are elliptic curves over the same scheme `S` and
   `E[p^∞]≅E'[p^∞]`, there exists an isomorphism between the finite `S`-schemes representing
   `𝒫_E` and `𝒫_{E'}`. This is an existence axiom, as in KM; it does not assert a canonical choice.
   In each application construct the comparison from the given isomorphism of `p`-divisible groups
   and prove the base-change property needed later.
4. **Reg. 4:** for every supersingular elliptic curve `E₀/k`, with `k` algebraically closed of
   characteristic `p`, and its universal formal deformation `𝔈/W(k)[[T]]`:
   - **Reg. 4A:** the set `𝒫(E₀/k)` has one element; no reducedness assertion about its
     representing scheme is included;
   - **Reg. 4B:** the consequently local finite `W(k)[[T]]`-scheme representing `𝒫_𝔈` is the spectrum of a
     two-dimensional regular local ring.

The definitions must include the displayed comparison isomorphisms and representing schemes; a
field saying only that the problem “depends on the `p`-divisible group” is not a formal contract.

State the Axiomatic Regularity Theorem: a moduli problem satisfying these axioms is finite flat of
constant rank at least one and regular of dimension two. Its proof is completed in 7H after the local
and deformation-theoretic ingredients have been constructed.

### 7B. Local algebra and local schemes

Apply the strict-henselisation, completion, regularity, openness, support, miracle-flatness, and rank
theorems owned by Layer 4D. For a geometric point of a rigidified finite moduli scheme, identify its
completed strict-henselian local ring with the ring prorepresenting the corresponding marked
deformation groupoid. Prove that this identification transports the universal family and the level
structure and is functorial under a change of rigidifier. This is the local-moduli comparison used
in the homogeneity and regularity arguments; it does not reconstruct the general local-scheme API.

### 7C. Formal completion at the zero section

For an elliptic curve over a complete local ring `A`, construct the formal completion at the zero
section intrinsically as a one-dimensional smooth commutative formal group. Prove its compatibility
with the scheme group law and with complete local base change. After choosing a parameter—that is,
a trivialisation of the conormal line—construct an isomorphism of the completed local ring with
`A[[X]]`; prove that another parameter acts by a power series `X↦uX+⋯` with `u∈Aˣ`, and state all
coordinate formulae equivariantly under this change. In the chosen coordinate identify the
completed divisor `n[0]` with `(Xⁿ=0)`. Relate the formal `p`-series to Frobenius and Verschiebung.

### 7D. Universal deformations of elliptic curves

For an elliptic curve `E₀` over an algebraically closed field `k` of characteristic `p`, define the
category of complete local noetherian `W(k)`-algebras equipped with an identification of their
residue field with `k`. Define a deformation to be an elliptic curve over such an algebra together
with an identification of its special fibre with `E₀`, and retain isomorphisms as a groupoid.
Construct the universal marked deformation over `W(k)[[T]]`. Prove its universal property,
compatibility with rigidification, and comparison with the completed local ring of a representing
moduli scheme.

### 7E. `p`-divisible groups

Develop Barsotti–Tate groups, connected–étale sequences, `E[p^∞]`, Frobenius and Verschiebung,
and the ordinary and supersingular classifications. Construct the Oort–Tate group schemes of order
`p` and prove precisely the classification and deformation statements used in Chapter 5.

### 7F. Serre–Tate theory with level structure

Prove the equivalence between deformations of an elliptic curve and deformations of its
`p`-divisible group. Extend it, as separate theorems, to `[Γ(pⁿ)]`, `[Γ₁(pⁿ)]`, and balanced
`[Γ₁(pⁿ)]` structures. Record compatibility with connected–étale sequences and the
ordinary/supersingular split.

### 7G. The three characteristic-`p` calculations

Formalise separately the arguments Rigid I, Rigid II, and Rigid III for the three elementary
problems. In the `[Γ₁(pⁿ)]` case, prove through the formal group that if the divisor `pⁿ[0]` is a
subgroup in the universal deformation, then `p=0` in its base ring. Isolate the required
binomial-coefficient calculation in `A[[X,Y]]` and the passage from that calculation to the
deformation ring.

### 7H. Axiomatic regularity and assembly

Prove the Axiomatic Regularity Theorem of 7A from 7B–7G. Verify Reg. 1–Reg. 4 for each elementary
prime-power problem. Use the `A`-structure product theorems of Layer 3A to assemble coprime levels.
Conclude that `[Γ(N)]`, `[Γ₁(N)]`, and balanced `[Γ₁(N)]` are finite flat of constant positive
rank over `Ell/ℤ`, regular of dimension two, and finite étale after inverting `N`.

**Dependencies.** Layers 0A–0F, 1–4, and 6; there is no dependency on the affine fine-curve
examples of Layer 5. Within this layer, 7A is the statement and 7B–7G supply the proof of 7H.

## Layer 8: KM Chapter 6, cyclicity, and `[Γ₀(N)]`

References: KM 6.1.1, 6.2.1, §6.3, §6.4, and §6.6.

### 8A. Generator schemes

For a finite locally free commutative group scheme `G` of rank `N`, specialise the `A`-generator
locus constructed in Layer 3A to `A=ℤ/Nℤ` and denote it by `Gˣ`. Prove its description by the
divisor of primitive multiples and its arbitrary-base-change property. State the cyclicity criterion

```text
G is cyclic ⇔ Gˣ is finite locally free of rank φ(N).
```

Construct the universal rank condition inside `[N-Isog]`, but defer the difficult implication in
the displayed equivalence to 8C. Construct the standard cyclic groups and their quotient isogenies.

### 8B. The Axiomatic Isomorphism Theorem

Let `p` be prime and let `Φ : 𝒫₁ ⟶ 𝒫₂` be a morphism of moduli problems over `Ell`. Prove KM
6.2.1 in the following exact form:

1. both `𝒫₁` and `𝒫₂` satisfy Reg. 1, Reg. 3, and Reg. 4A;
2. after inverting `p`, the morphism `Φ` is an isomorphism;
3. for every algebraically closed field `k` of characteristic `p`, every supersingular
   `E₀/k`, and the universal formal deformation `𝔈/W(k)[[T]]`, the induced morphism of finite
   `W(k)[[T]]`-schemes

   ```text
   (𝒫₁)_𝔈 ⟶ (𝒫₂)_𝔈
   ```

   is an isomorphism.

Then `Φ` is an isomorphism. Prove this by adjoining a common representable étale rigidifier,
regarding the two finite schemes as coherent algebras on the rigidifier scheme, and showing that
the kernel and cokernel of the induced algebra map vanish. The generic isomorphism and the
supersingular completed-local isomorphisms put every point in the open vanishing locus; the
homogeneity argument of Layer 7 supplies the passage between local points. This use of the
Chapter-5 machinery is what forbids placing cyclicity before Layer 7.

### 8C. The explicit rings of KM §6.3

Construct the rings `A`, `A₁`, and `A₂` attached to the universal supersingular deformation.
Prove Weierstrass preparation in the required form, injectivity of multiplication by the element
`Q`, equality of the relevant quotient rings, the formal-group unit/maximal-ideal calculation, and
the Nakayama and snake-lemma assembly. Use these results and 8B to prove the cyclicity criterion of
8A, including the hard direction of KM 6.1.1.

### 8D. The cyclicity locus and `[Γ₀(N)]`

Cut out the closed cyclicity locus in `[N-Isog]` and prove its universal property and arbitrary
base change. Identify it with the `[Γ₀(N)]`-problem. Prove relative representability and finiteness,
and use the Chapter 5–6 results to prove finite flatness of constant positive rank, regularity of
dimension two, and finite étaleness after inverting `N`. This completes the fourth clause of the
First Main Theorem.

**Dependencies.** Layers 0G, 3A–3C, 6, and 7.

## Layer 9: `[Γ_H]` quotient problems and coarse moduli

References: KM 7.1.3, 7.4.2, 8.1.1, 8.1.3.1, 8.1.5, 8.1.6, and 8.1.7;
Loeffler §§3.6 and 3.8.

### 9A. Katz–Mazur quotients

For `H≤GL₂(ℤ/Nℤ)`, define the integral Drinfeld quotient problem `[Γ(N)]_Dr/H` by the
conditions of KM §7.1:

1. `H` acts trivially on the quotient problem and the projection is invariant and universal;
2. after adjoining any representable étale rigidifier `δ`, the scheme representing the simultaneous
   quotient problem is the scheme quotient of the simultaneous full-level scheme by `H`.

Prove fppf descent, independence of the rigidifier, and relative representability (KM 7.1.3). The
objectwise orbit presheaf `T ↦ [Γ(N)](T)/H` is not the definition and need not be a sheaf.

After inverting `N`, define the fppf sheaf quotient of the naive ordered-basis problem. Prove that it
is the fppf sheafification of the objectwise orbit presheaf and that it agrees with the base change
of the integral Drinfeld quotient. Keep both descriptions distinct from the coarse scheme quotient
of 9C.

**Dependencies.** Layers 0C, 0E, 4A–4C, and 6.

### 9B. Standard subgroups and actions

Under the row-vector convention:

- `H₁={[[1,b],[0,d]]}` fixes the first basis vector and gives `[Γ₁(N)]`;
- the upper triangular Borel preserves the cyclic subgroup generated by the first basis vector and,
  using Layer 8, gives `[Γ₀(N)]`;
- the diamond action on `[Γ₁(N)]` is `P↦aP`; inside `SL₂`, this is `P↦d⁻¹P`, not
  `P↦dP`.

Prove the identifications of KM 7.4.2 and their compatibility with the integral quotient problems.
After inverting `N`, prove the action of `det H` on determinant fibres, the naive quotient-rigidity
criterion, and the semi-Borel rigid case for `N≥4` using KM 2.7.4. None of these rigidity statements
is promoted to an integral Drinfeld-rigidity theorem.

**Dependencies.** Layers 2E–2F, 3D, 8, and 9A.

### 9C. Coarse moduli schemes

Use an auxiliary representable **finite étale Galois** rigidifier `δ` with Galois group `G` and
construct `M(P)=𝕄(P,δ)/G` as in KM 8.1.1. Prove the classifying map and functoriality, the
algebraically closed field-points property, and compatibility with finite quotients. For a ring map
`R⟶R'`, construct the canonical comparison

```text
M(P⊗_R R') ⟶ M(P)⊗_R R'.
```

Prove KM 8.1.6: this map is an isomorphism if any one of the following holds:

1. `P` is representable;
2. `R⟶R'` is flat;
3. `6` is invertible in `R`;
4. `P=P'/G` for a representable problem `P'` and a finite group `G` whose order is invertible in
   `R'`.

For (2) and (4), identify the theorem with the corresponding base-change result for invariant
rings. For (3), use the simultaneous full-level-three problem and the group
`GL₂(𝔽₃)`, of order `48`. Also formalise KM 8.1.7's counterexample: for the moduli problem `[ω]`
of nowhere-vanishing invariant differentials, the maps from integral modular forms after reduction
to the rings of modular forms over `𝔽₂` and `𝔽₃` are not isomorphisms. Thus no unrestricted
base-change theorem is stated.

Construct the coarse `j`-line by descending the `j`-map through the Weierstrass groupoid, computing
invariant functions on the standard charts, gluing the result, and proving the coarse universal
property of `Spec ℤ[j]`. Prove the classification on algebraically closed field-valued points. First
prove the automorphism classification: away from characteristics `2` and `3`, the pointed
automorphism group has order `2` off the exceptional values, order `4` at `j=1728`, and order `6`
at `j=0`. In characteristic `3` the exceptional values coincide at `j=0` and the automorphism group
there has order `12`; in characteristic `2` they likewise coincide and its order is `24`. Cite and
formalise Silverman, *The Arithmetic of Elliptic Curves*, III.10.1 and Appendix A for these
small-characteristic calculations. Scheme-theoretically, record that the two integral closed loci
meet in

```text
V(j, j-1728) ≅ Spec (ℤ/1728ℤ),
```

rather than treating them as two disjoint loci in every characteristic.

For `N≥3`, over `ℤ[1/N]`, construct

```text
Y₀(N)=Y_full(N)/B
```

and prove its coarse universal property and comparison with the base change of the integral
`[Γ₀(N)]` problem. Do not use this formula for `N=1,2`, and do not assert an integral Borel
quotient of the fine scheme: the integral coarse space comes from the Galois-rigidifier
construction.

**Dependencies.** Layers 0C, 4C, 5B, 8, and 9A–9B.

## Dependency order and parallel work

The main dependency chain is

```text
Layers 1A–1C + 0B–0E ─► Layers 2A–2C ─► Layer 3N ─┬─► Layers 4A–4B
                                                   └─► Layer 5A
Jacob. Challenge A–C + 0A + 1A ─► Layer 1D
Layers 0A + 0E + 1D + 2C ──────► Layer 2D ─┬─► Layer 2F ─► Layer 4C ─► Layer 5B
                                           └─► Layer 2E ─────────────► Layer 5C

Layers 0F–0G + 2A–2E + 3A–3C + 4A ─► Layer 6 ─► Layer 7 ─► Layer 8 ─► Layer 9
```

The diagram records the two principal build lanes. The dependency paragraph of each layer is
definitive about direct mathematical dependencies; the bullets below record the cross-links between
the lanes.

- Layer 0A and the Jacobian Challenge cohomology package meet in Layer 1D. Layer 2D then constructs
  the relative genus-one Picard and Poincaré objects which the present supplier does not yet provide
  over an arbitrary base; it also consumes the basic isogeny theory of 2C.
- The naive structures of 3N, the general moduli formalism, and the direct Tate construction may
  proceed in parallel with the integral Drinfeld loci. Layer 3N branches directly from 2A and the
  finite étale and quotient infrastructure, not from Layers 3A–3D.
- Full-level representability in 5B uses the rigidity of Layer 2F. Its determinant refinement and
  the twisted curve of 5C additionally require the Weil pairing of Layer 2E.
- Layer 6 also consumes the general moduli carrier of 4A, and the coarse constructions in 9C
  consume the fine full-level scheme of 5B. These cross-links are stated in the layer dependencies
  rather than drawn through the two main chains.
- Layer 6 contains only the three elementary integral problems. Layer 7 proves their Chapter 5
  finite-flatness and regularity theorem.
- Layer 8 consumes Layer 7 to prove the Chapter 6 cyclicity theorem and only then constructs
  `[Γ₀(N)]`.
- Layer 9 consumes the completed integral theory and distinguishes Katz–Mazur quotient problems,
  fppf sheaf quotients of naive problems, objectwise orbit presheaves, and coarse scheme quotients.
- The elliptic-curves roadmap is used only for the final normalisation comparison of the Weil
  pairing in Layer 2E. The curve/function-field isogeny comparison is owned by Algebraic Curves and
  is not in this graph.

## Worked examples

The following examples accompany the general theory.

- The projective model of an elliptic Weierstrass equation is proper and smooth of relative
  dimension one, and its field-valued sections agree with the equation-level point group.
- For `[NeZero N]`, `E[N]` has finite-flat rank `N²`; if `N` is invertible over an algebraically
  closed field, its geometric points form `(ℤ/Nℤ)²`.
- On a supersingular elliptic curve in characteristic `p`, `E[p]` has rank `p²` but no nonzero
  geometric points. The zero section is nevertheless a Drinfeld point of exact order `p`, since
  `p[0]=ker(F_{E/S})` as degree-`p` divisors.
- Tate normal form gives `Y₁(5)` over `ℤ[1/5]`.
- The full ordered-basis scheme has determinant map to `μ_N^prim`, and fixing a primitive root
  gives `Y(N,ζ)`.
- `Spec ℤ[j]` is coarse but not fine; the exceptional automorphism loci occur at `j=0` and
  `j=1728` away from characteristics `2` and `3`, with the stated corrections in those
  characteristics.
- For `N≥3`, over `ℤ[1/N]`, `Y₀(N)` is the Borel quotient of `Y_full(N)` and is not a fine
  moduli scheme. Its integral construction uses the Chapter 6 cyclicity locus.
- The points of `Y(ρ)` over a characteristic-zero field have the expected
  Galois-representation-with-pairing description.
- The Picard dual and the quotient-factorisation dual of an isogeny agree, and their kernel pairing
  gives the scheme-theoretically perfect Weil pairing.

## References

- N. M. Katz and B. Mazur, *Arithmetic Moduli of Elliptic Curves*, Annals of Mathematics Studies
  108, Princeton University Press, 1985.
- D. Loeffler, *Modular Curves*, graduate lecture notes. Relevant references include 3.3.4,
  3.3.6, 3.4.4, 3.7.4, and §3.8.
- P. Deligne and M. Rapoport, *Les schémas de modules de courbes elliptiques*, LNM 349, 1973.
- M. Demazure and A. Grothendieck, *Schémas en groupes (SGA 3)*, Exposé VIIA, §3.3, for
  Cartier duality of finite locally free commutative group schemes.
- V. G. Drinfeld, *Elliptic modules*, Mat. Sbornik 94, 1974.
- B. Conrad, *Arithmetic moduli of generalized elliptic curves*, J. Inst. Math. Jussieu 6,
  2007, for the compactified theory which is outside this roadmap.
- K. Buzzard, *Formalizing Fermat*, Lecture 8, for `Y(ρ)`.
- Mathlib work in progress: mathlib4#25983 and mathlib4#35151.

## Existing Lean work and source audit

The current AINTLIB modular-curves development contains substantial implementation and proof
decomposition for the group law, pole sheaves, Picard constructions, the Weil pairing, fine curves,
quotient problems, and the beginning of KM Chapters 5–6. It is migration and proof-architecture
material, not a dependency and not evidence that a theorem is complete.

This source audit was carried out on 2026-08-14. The complete Katz–Mazur scan used for the audit has
526 PDF pages and includes Chapters 6–14 and the appendices. The dependency-sensitive statements
were checked directly at the following printed pages:

- the First Main Theorem and Reg. 1–Reg. 4, pp. 129–130;
- the Axiomatic Isomorphism Theorem and the explicit Chapter-6 rings, pp. 155–162;
- the quotient definition Q1/Q2 and Theorem 7.1.3, pp. 186–188;
- coarse-moduli base change and the `j`-line, pp. 224–231.

The AINTLIB source audited here is

```text
repository:       https://github.com/CBirkbeck/AINTLIB
branch:           dev/modular-curves
revision:         ce76186b5f61c846d770d2f87eb76ba5b9c9117a (2026-08-11)
Lean toolchain:   v4.33.0-rc1
Mathlib revision: 3edb3c0658f69f197b1e501b1f7623f3f7b3898c
```

That Mathlib revision is newer than this repository's pin, so the code is not a Lake dependency
and its declarations require API reconciliation before migration. Files under
`projects/ModularCurves` carry Apache-2.0 headers; the repository's default branch at
`1c1c74664e40071c2c2165bc55ca2616a67ccd6b` contains the Apache-2.0 root licence. Any adaptation
must retain the file-level notices and be coordinated with the AINTLIB authors. No AINTLIB code is
transferred by this roadmap change.

The durable parts of that development relevant to the proof decomposition are:

- `.mathlib-quality/plan.md` and the `decomposition-*.md` files for the dependency and source
  audits;
- `EllipticCurve/AdditionChart*.lean` and `EllipticCurve/PoleSheaf*.lean` for the chartwise group
  law and the pole-sheaf calculation;
- `ForMathlib/*Cech*`, the scheme-module files, and the pushforward files for coherent cohomology
  and base change;
- `Picard/` and `WeilPairing/` for the Picard-dual route, Poincaré biextension, and pairing laws;
- `GroupScheme/NIsogeny.lean`, `GroupScheme/NIsogSpace.lean`, and the Grassmannian and quotient
  files for rank-`N` subgroup schemes;
- `Moduli/Groupoid.lean`, `Moduli/QuotientProblem.lean`,
  `Moduli/GammaHRepresentability.lean`, and `Moduli/DrinfeldRegularity.lean` for groupoids,
  Katz–Mazur quotients, and the beginning of Chapter 5;
- `ModularCurve/YOne*.lean`, `YFullRoute.lean`, and `YRho.lean` for the three distinct fine-curve
  constructions.

The audit confirms the chart-by-chart group-law decomposition and the need for genuine coherent
cohomology in the pole-sheaf route. It also confirms that alternation and scheme-theoretic
Cartier–Nishi perfection remain separate open leaves in the pairing construction; that quotient
problems must use Q1/Q2 rather than objectwise orbits; and that universal elliptic deformations,
`p`-divisible groups, Serre–Tate theory, and the complete axiomatic regularity engine remain major
Chapter-5 tasks. Volatile file counts, direct `sorry` counts, and branch-status tables are omitted:
they do not establish whether a theorem is axiom-free and become stale too quickly to guide the
roadmap.
