# Roadmap: modular curves, following Katz–Mazur

This roadmap formalises the moduli of elliptic curves with level structure, following N. Katz and
B. Mazur, *Arithmetic Moduli of Elliptic Curves* (Annals of Mathematics Studies 108, 1985).
The book is abbreviated **KM**, and its result numbering is used throughout. D. Loeffler's
*Modular Curves* lecture notes are cited alongside KM for some of the classical constructions over
`ℤ[1/N]`.

The roadmap begins with elliptic curves as group schemes over an arbitrary base, finite subgroup
schemes, isogenies, quotients, dual isogenies, and the Weil pairing. It then defines Drinfeld
`[Γ(N)]`-, `[Γ₁(N)]`-, balanced `[Γ₁(N)]`-, and `[Γ₀(N)]`-structures, proves their relative
representability, constructs the affine fine modular curves obtained after inverting the level, and
treats coarse moduli schemes when rigidity fails. The final theorem is KM's First Main Theorem
5.1.1: the four basic level problems are finite flat over the moduli problem of elliptic curves and
regular of dimension two.

`Suggested.lean` accompanies this document. It contains the target declarations which can already
be stated against Mathlib and records the further interfaces which should receive Lean signatures
as soon as their ambient types exist.

## Scope

The roadmap includes:

- elliptic curves as smooth proper commutative group schemes of relative dimension one;
- finite locally free subgroup schemes, multiplication maps, isogenies, quotients, dual isogenies,
  degree, and the Weil pairing;
- full sets of sections and Drinfeld level structures over arbitrary bases;
- the category `Ell/R`, relative representability, rigidity, and KM 4.7.0;
- `Y₁(N)`, the full ordered-basis scheme `Y_full(N)`, its fixed-pairing components, and the
  twisted curve `Y(ρ)`;
- the coarse `j`-line and the coarse modular curve `Y₀(N)`;
- the deformation theory needed for KM 5.1.1.

The following topics are not included: compactified modular curves, generalized elliptic curves,
Igusa curves, a general theory of algebraic stacks or algebraic spaces, modular forms and Hecke
operators, Néron models, complex uniformisation, geometric connectedness or irreducibility of the
fine curves, and Riemann–Roch or coherent cohomology of curves.

This roadmap owns the scheme-theoretic theory of elliptic curves. The separate
[elliptic-curves roadmap](../EllipticCurves/README.md) works with Weierstrass equations and
function fields. That roadmap is still under review as PR 68, so the relative link resolves only
once it merges; both interfaces below are therefore also stated self-containedly where they are
used. There are exactly two direct dependencies on it:

1. the final comparison identifying the scheme-theoretic Weil pairing with the equation-level
   pairing over fields where `N` is invertible (Layer 2D);
2. the equivalence between scheme isogenies and the sibling roadmap's `CoordinatePullback` with
   `MapsInfinity` (Layer 2E).

No later construction uses the function-field comparison of Layer 2E. Later layers do use the
normalised Weil pairing constructed in Layer 2D.

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
   assume a connected or preconnected base. Assertions that `[N]` is finite require `[NeZero N]`;
   `[0]` is not a finite isogeny.

4. **Level structures.** Drinfeld structures are the definitions used over arbitrary bases. Naive
   pointwise structures are separate definitions and are compared with Drinfeld structures only
   when `N` is invertible on the base (KM 1.4.4 and §3.7).

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
   component, not `Y_full(N)`.

6. **Bases.** The integral level problems are defined over `ℤ`. The ring `ℤ[1/N]` is introduced
   only for naive level structures, étaleness, and the affine fine modular curves. A chosen
   primitive root belongs over `ℤ[1/N, ζ_N]`, or more generally over a base equipped with a
   section of `μ_N^prim`.

7. **References.** KM's numbering is the common coordinate system. Statements taken from
   Loeffler's notes rather than directly from KM are identified as such.

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
  `Smooth.lean`. Layer 0B depends on it, so either the pin moves or 0B builds the
  correspondence.
- `Mathlib/AlgebraicGeometry/Morphisms/FlatRank.lean`, which supplies `Scheme.Hom.finrank` and
  `Scheme.Hom.isLocallyConstant_finrank` — the locally constant rank that Convention 3 and
  Layer 0G's degree bullets are stated in terms of.
- Weierstrass curves, variable changes, division polynomials, and the pointwise group law.
- Finite, flat, and étale ring maps, finite locally free rank, invariant subrings, Hopf algebras,
  regular local rings, completions, and Krull dimension.
- The available flatness files include `Flat/Localization`, `Flat/EquationalCriterion`,
  `Flat/TorsionFree`, and `LocalFlatDescent`. The curve-specific fibrewise flatness and miracle
  flatness results required below are not assumed to exist; they are explicit targets in Layer 0G.
- Representable functors, `Over`-categories, and scheme gluing.

Two open Mathlib pull requests overlap directly with Layer 1:

- mathlib4#25983, **“define the affine scheme associated to an elliptic curve”**;
- mathlib4#35151, **“WIP: group scheme structure on Weierstrass curve”**.

The first concerns the affine scheme associated to the equation, not the complete projective model.
The Tau Ceti development should be reconciled with both APIs rather than duplicate them.

## Layer 0: scheme-theoretic prerequisites

This layer contains the general algebraic geometry used by the later layers.

### 0A. Relative effective Cartier divisors

References: KM 1.1.1, 1.2.2, 1.2.3.

Define an effective Cartier divisor on `X` as a closed subscheme whose ideal is locally generated by
a nonzerodivisor. A relative effective Cartier divisor on `C/S` is such a divisor which is flat over
`S`.

For a smooth proper relative curve, prove:

- the divisor `[P]` of a section `P : S ⟶ C`;
- finite sums `Σ_i [P_i]` and multiplication by a natural number;
- pullback and arbitrary base change;
- fibrewise degree;
- the comparison with the finite-locally-free working form used in the existing development;
- the hypotheses under which a relative effective Cartier divisor is finite locally free over
  `S`.

Only the relative-curve theory is included. General Cartier-divisor theory on arbitrary ambient
schemes and general `A`-structures for finite abelian groups are outside the roadmap. From KM §1.10,
only 1.10.1, 1.10.5, and 1.10.13 are required later (1.10.1 is the characterisation of a full set
of sections by `Z = Σ[Pᵢ]` as Cartier divisors; 1.10.2 is an algebra lemma about `R[X]/(F(X))`).

**Dependencies.** Mathlib's ideal-sheaf and morphism-property libraries.

**Consumers.** This block is used by the section-divisor and pole-sheaf constructions in Layer 1,
the degree and Weil-pairing constructions in Layer 2, all Drinfeld structures in Layer 3, all four
integral level problems in Layer 6, and the regularity argument in Layer 7. What runs *without* it
is the **naive** side: the naive level structures of Layer 3N, the moduli formalism of Layer 4, and
the naive fine-curve constructions of Layer 5A–5B, which depend on 3N rather than on 3A–3D and may
therefore proceed in parallel with this strand. Layer 5C and the determinant refinements are the
exception on that side: they consume the Weil pairing of Layer 2D, which does use this block.

### 0B. Finite locally free group schemes and Cartier duality

References: KM §1.12 (roots of unity: `μ_N = 𝔾_m[N]`, (1.12.4) and Theorem 1.12.7 for the
primitive locus) and §§2.5, 2.8. ⚠ KM does not construct Cartier duality, `D(M)`, or the constant
group scheme as `Map(G, R)`: 2.8.2 cites Cartier–Nishi duality to Oda. This block therefore needs an
external source for the duality itself. KM §1.11 (extensions of an étale group) is *not* used.

Develop finite locally free commutative group schemes over a base, including kernels, closed subgroup
schemes, rank, exact sequences, and arbitrary base change.

Construct separately:

- the constant group scheme attached to a finite group, with coordinate algebra `Map(G,R)`;
- the diagonalizable group scheme `D(M) = Spec R[M]` attached to a finite abelian group;
- `μ_N = D(ℤ/Nℤ)`.

Construct Cartier duality and prove

```text
((ℤ/Nℤ)_S)ᴰ ≅ μ_N,
(μ_N)ᴰ ≅ (ℤ/Nℤ)_S.
```

Prove compatibility with kernels, quotients, exact sequences, and base change in the precise forms
used by Layers 2 and 3.

**Dependencies.** Mathlib's affine group-scheme and Hopf-algebra APIs, in particular
`AlgebraicGeometry/Group/Affine.lean` — which postdates the current pin (see the prerequisites
above), so this block is gated on bumping the pin or on building the correspondence here.

### 0C. Finite quotients and torsors

Prove three separate results.

1. **Affine quotients.** If a finite group acts on `Spec A`, construct `Spec A^G`, prove its
   categorical universal property, and prove that the quotient map is finite and integral.
2. **Free actions.** Prove that a free finite-group action has a quotient scheme under a stated
   representability hypothesis, such as an invariant affine cover or quasi-projectivity. Without
   such a hypothesis the fppf quotient is generally only an algebraic space.
3. **Elliptic-curve quotients.** For a finite locally free subgroup scheme `C ⊆ E`, construct the
   quotient `E/C`, its group structure, the quotient isogeny, base-change compatibility, and its
   categorical universal property. This is a special theorem for proper curves and is not deduced
   from an unrestricted quotient theorem.

Develop the finite-flat torsor statements needed for rigidifiers and descent.

**Dependencies.** Layer 0B for the group-scheme statements; Mathlib's affine invariant theory and
scheme gluing.

### 0D. Finite étale schemes and Galois actions

Develop the finite étale results used by the level structures: sections, fibre cardinalities, local
constancy, cancellation, and descent.

Over a field `K`, construct the equivalence between finite étale `K`-schemes and finite continuous
`Gal(Kˢ/K)`-sets. Prove that it preserves products and transports group objects, commutative group
objects, homomorphisms, and alternating pairings. This is the input for `V_ρ` in Layer 5C.

**Dependencies.** Mathlib's finite étale and Galois theory.

### 0E. Effective descent and spreading out

Prove effective faithfully flat descent for:

- affine and projective schemes;
- finite locally free schemes and closed subschemes;
- sections and morphisms;
- group objects and homomorphisms;
- elliptic curves together with their zero sections;
- level structures;
- finite group actions and torsors.

The descent theorem must descend the universal elliptic curve itself, not merely maps between schemes
which have already descended. Also prove the spreading-out statements over noetherian bases used to
remove temporary noetherian hypotheses from rigidity theorems.

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

**Dependencies.** Mathlib's representable-functor and affine-scheme APIs.

### 0G. Finiteness and flatness for curves

Prove the curve-specific algebra and geometry which Mathlib does not currently provide as a single
API:

- finiteness of the integral closure of a one-dimensional noetherian normal domain in a finite
  extension of its fraction field, including inseparable extensions — stated for an **excellent**
  (or Nagata, or finitely generated over a field) domain, which is the generality the curve
  application needs and the generality in which it is true: Krull–Akizuki alone gives
  noetherianness and dimension `≤ 1`, not module-finiteness, and module-finiteness genuinely fails
  for general one-dimensional noetherian normal domains in the inseparable case;
- extension of a function-field embedding to a morphism of proper normal curves by the valuative
  criterion;
- finite surjective morphisms between smooth curves over a field are flat, hence finite locally
  free;
- the fibrewise criterion which identifies the rank of a finite locally free morphism with the
  scheme-theoretic length of each geometric fibre;
- the relative version needed to prove that `[N]` is finite locally free of rank `N²`.

These are the exact inputs used in Layers 2A and 2E; they are not hidden under a claim that Mathlib
already has a classical local criterion for flatness.

**Dependencies.** Mathlib's commutative algebra, properness, and local-ring APIs.

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

Construct the addition, inverse, and identity maps on the projective Weierstrass model and prove the
group axioms. Glue the local constructions using the pointed variable-change compatibility and the
descent results of Layer 0E. Prove agreement with the existing pointwise group law on every
field-valued fibre.

Define `EllipticCurve S` by equipping `EllipticCurveGeom S` with this canonical commutative group
structure. Prove that a compatible group structure with the given zero section is unique.

Use Mathlib's general result from `AlgebraicGeometry/Group/Abelian.lean` when it applies, rather than
reproving commutativity from scratch.

**Dependencies.** Layers 0E, 1A, and 1B.

### 1D. The zero divisor and pole sheaves

Construct the relative effective Cartier divisor `[0]` of the zero section and its multiples.
Develop the explicit pole-sheaf or pole-module presentation used in the existing projective-model
and degree arguments: the local sections `1`, `x`, and `y`, their pole bounds at `[0]`, the
Weierstrass relation, chart independence, and base-change compatibility. This is an explicit
Weierstrass calculation; no Riemann–Roch theorem is assumed.

**Dependencies.** Layers 0A and 1A.

## Layer 2: isogenies, torsion, quotients, and the Weil pairing

References: KM 2.3.1, 2.5.1, 2.6.1–2.6.3, 2.7.2, and §2.8.

### 2A. Multiplication maps, homomorphisms, and degree

Prove that a pointed morphism of elliptic curves is a group homomorphism (KM 2.5.1): first over a
locally noetherian base and then in general by spreading out.

Construct `Hom_S(E,E')`, `End_S(E)`, and multiplication by an integer. For `[NeZero N]`, prove

```text
[N] : E ⟶ E
```

is finite locally free of rank `N²` (KM 2.3.1). Define `E[N]` as its kernel and prove that it is
finite locally free of rank `N²`, compatible with arbitrary base change, and étale where `N` is
invertible.

The rank proof uses scheme-theoretic fibre length and division-polynomial multiplicities. The
geometric-point theorem is separate: over an algebraically closed field in which `N` is invertible,
`E[N](k) ≅ (ℤ/Nℤ)²`. It is not used in residue characteristic dividing `N`.

Define the locally constant degree of an isogeny and the predicate `IsogenyOfDegree n`.

**Dependencies.** Layers 0A, 0G, 1C, and 1D.

### 2B. Isogenies and quotients

Define an isogeny to be a finite locally free surjective homomorphism of elliptic curves. For a
finite locally free subgroup scheme `C ⊆ E`, use Layer 0C to construct an elliptic curve `E/C` and a
quotient isogeny

```text
q_C : E ⟶ E/C
```

with kernel `C`. Prove its universal property and arbitrary base-change compatibility. Prove the
factorisation theorem: every isogeny factors through the quotient by its kernel, and the induced map
from `E/ker φ` to the target is an isomorphism.

**Dependencies.** Layers 0B, 0C, and 2A.

### 2C. The general dual isogeny

Let `φ : E ⟶ E'` be an isogeny of constant degree `n`. Prove that `ker φ` is killed by `n`. Factor
`[n]_E` through `E/ker φ`, use the isomorphism `E/ker φ ≅ E'`, and define

```text
φ̂ : E' ⟶ E.
```

Prove

```text
φ̂ ∘ φ = [n]_E,
φ ∘ φ̂ = [n]_{E'},
deg φ̂ = deg φ,
dual(ψ ∘ φ) = φ̂ ∘ ψ̂.
```

State the Lean versions with the repository's composition convention and check both domains.
Prove involutivity and the formulas for multiplication maps (KM 2.6.1 and 2.6.1.1).

Only after the general dual exists, define the trace of an endomorphism and prove

```text
α̂ = [tr α] - α
```

(KM 2.6.2.2), together with the characteristic-polynomial identity of KM 2.6.3. The
trace-reflection formula is not the definition of the dual of a general isogeny.

**Dependencies.** Layer 2B and the constant-degree discipline of the conventions.

### 2D. Cartier duality of kernels and the Weil pairing

For an isogeny `φ`, construct the canonical perfect pairing

```text
ker φ × ker φ̂ ⟶ 𝔾_m
```

and the induced isomorphism

```text
ker φ̂ ≅ (ker φ)ᴰ.
```

Apply this to `[N]`. Prove `[N]^ = [N]`, and derive the canonical self-duality

```text
E[N] ≅ E[N]ᴰ.
```

This is the construction of the self-duality: the point of the route is that it derives
`E[N] ≅ E[N]ᴰ` from the kernel duality rather than from a polarisation. ⚠ It does not remove
`Pic⁰` from the layer, because the input pairing `ker φ × ker φ̂ ⟶ 𝔾_m` is Cartier–Nishi duality,
which KM 2.8.2 cites to Oda rather than proving, and whose standard construction is through line
bundles — KM's own `φᵗ` is `Pic(φ)` on `Pic⁰` (§2.5). Either that pairing is imported as a black
box with a named source, or a `Pic⁰`-free construction of it becomes a milestone of this block; what
is *not* available is to leave it unnamed and still claim the layer avoids `Pic⁰`. Evaluation
then gives

```text
e_N : E[N] ×_S E[N] ⟶ μ_N.
```

Prove, in this order:

1. bilinearity and arbitrary base-change compatibility (KM 2.8.1; 2.8.2 is the Cartier–Nishi
   isomorphism `ker πᵗ ≅ Hom(ker π, 𝔾_m)` used above, and skew-symmetry is 2.8.3 — genuine
   alternation `e_N(P,P)=1` appears only in KM's Notes Added in Proof, p. 505);
2. compatibility with isogenies and dual isogenies;
3. change of level: if `x` and `y` are killed by `N`, then, after viewing them as `NM`-torsion,

   ```text
   e_{NM}(x,y) = e_N(x,y)^M;
   ```

4. skew-symmetry and alternation by an argument which does not assume the desired self-duality
   circularly;
5. perfection;
6. the symplectic formula

   ```text
   e_N(aP+bQ,cP+dQ) = e_N(P,Q)^(ad-bc);
   ```

7. comparison with the equation-level Weil pairing from the elliptic-curves roadmap over fields
   where `N` is invertible.

The last theorem fixes the normalisation; it is not used to construct the pairing.

**Dependencies.** Layers 0A, 0B, 2A, and 2C. Item 7 also uses the elliptic-curves roadmap.

### 2E. Comparison with function-field isogenies

The elliptic-curves roadmap uses the following interface:

```lean
abbrev CoordinatePullback (W₁ W₂ : Affine F) :=
  W₂.CoordinateRing →ₐ[F] W₁.FunctionField

structure Isogeny (W₁ W₂ : Affine F) where
  pullback : CoordinatePullback W₁ W₂
  mapsInfinity : pullback.MapsInfinity
```

Over a field, construct an equivalence between these data and scheme isogenies of the corresponding
projective elliptic curves. Prove compatibility with degree, separability, multiplication maps,
Frobenius, dual isogenies, and the induced maps on points.

The proof uses precisely the following results.

1. Pullback of rational functions gives the function-field embedding. The inverse image of the
   target origin is the whole kernel, so the standard affine charts do not map directly to one
   another.
2. The integral closure of the target affine coordinate ring describes functions regular away from
   the full fibre over the target origin; this identifies `MapsInfinity`.
3. A function-field embedding extends to a morphism of proper normal curves by the valuative
   criterion.
4. Krull–Akizuki-grade finiteness, including the inseparable case, makes the morphism finite.
5. Miracle flatness makes a finite surjective morphism between smooth curves finite locally free.

No Riemann–Roch theorem and no general-base comparison are used.

**Dependencies.** Layers 0G, 1A–1C and 2A–2C, and the elliptic-curves roadmap.

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
Proposition 3.8.2, which gives both, for the general `P_H` of Loeffler Definition 3.8.1). These are
the structures the rigidifiers of Layer 4C and the fine curves of Layers 5A–5B are stated in; the
comparison with the Drinfeld structures of 3A–3C is Layer 3D, and is needed only where the two
sides must be identified.

**Dependencies.** Layers 0D, 1, and 2A. Not 0A, and not 3A–3D.

### 3A. Full sets of sections

Let `Z ⟶ S` be finite locally free of rank `r`, and let `s₁,…,s_r` be sections. Define them to be a
**full set of sections** when the following holds **after every base change** `T ⟶ S`: for every
function `f` on `Z_T`,

```text
Norm_{Z_T/T}(f) = ∏ᵢ s_{i,T}^*(f).
```

The universal quantification over base changes is part of the definition. Prove the reduction to
the single universal polynomial case — the argument in the proof of KM Proposition 1.9.1, not
KM 1.8.4, which is the disjoint-union lemma (a full set for `Z₁` and one for `Z₂` give one for
`Z₁ ⊔ Z₂`) — which
reduces this definition to the single universal polynomial case, and prove the equivalent
characteristic-polynomial formulation of KM 1.8.2. Prove fppf locality and arbitrary base-change
compatibility.

Using Layer 0F, construct the ambient Hom-scheme, the universal family of sections, and the closed
subscheme cut out by the norm or characteristic-polynomial identities. Prove independence of an
affine presentation, gluing, and the universal property (KM 1.9.1 and 1.10.13(1); KM 1.6.2 cuts
out the *`A`-structure* locus by the subgroup condition 1.3.7, and is the right citation for the
exact-order locus of 3B rather than for this one).

**Dependencies.** Layers 0A, 0F, and the norm theory for finite locally free algebras.

### 3B. Exact order and cyclic subgroups

A section `P` of an elliptic curve has exact order `N` when

```text
Σ_{a∈ℤ/Nℤ} [aP]
```

is a subgroup scheme of rank `N` (KM §1.4). Construct the exact-order locus as a closed subscheme of
`E[N]`.

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

Prove base-change functoriality and relative representability of the corresponding loci where this
is already available from the constructions above.

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

**Dependencies.** Layer 3C and the perfect Weil pairing of Layer 2D.

## Layer 4: the Katz–Mazur moduli formalism

References: KM Chapter 4, especially 4.7.0 and Corollary 4.7.2; Loeffler 3.7.4.

### 4A. Moduli problems over `Ell/R`

Define `Ell/R`: its objects are elliptic curves over variable `R`-schemes and its morphisms are
cartesian squares. Define moduli problems as contravariant functors, together with representability,
relative representability, affine, finite, flat, and étale properties over `Ell/R`, and rigidity.

**Dependencies.** Layer 1.

### 4B. The Weierstrass presentation

Let

```text
W_R = Spec R[a₁,a₂,a₃,a₄,a₆,Δ⁻¹].
```

Define the variable-change group scheme and its action. Prove:

- every elliptic curve is Zariski-locally obtained from the universal Weierstrass equation;
- two equations define isomorphic pointed elliptic curves exactly through the variable-change
  groupoid;
- these local descriptions satisfy effective descent.

These statements are the precise substitute, in this roadmap, for saying that the Weierstrass
scheme presents the moduli stack.

**Dependencies.** Layers 0E and 1A–1C.

### 4C. Rigidifiers and KM 4.7.0

Construct the Legendre rigidifier (KM 2.2.8–2.2.9, needing `2` invertible) and the naive level-three
rigidifier (KM 2.2.10–2.2.11, needing `3` invertible); KM's proof of 4.7.0 glues the two over
`ℤ[1/6]`, as does Loeffler 3.7.4. There is no level-four rigidifier in KM Chapter 4. Construct their universal elliptic
curves, and their finite étale torsor properties over the appropriate bases.

Prove the implication used throughout the roadmap (KM 4.7.0):

> A relatively representable, affine, rigid moduli problem is representable.

The proof represents the simultaneous problem with a rigidifier, proves that the finite group action
has the invariant-affine-cover or quasi-projectivity hypothesis required by Layer 0C, forms the
quotient, and descends both the universal elliptic curve and the additional structure. Only this
direction is used here. The converse is cheap and KM records it: its Appendix A.4 opens with the
tautology (A.4.1.2) that `𝒫` is representable exactly when `𝒫̃` is representable and `𝒫` is rigid,
and Proposition A.4.2 gives the three-way equivalence under the étale-sheaf hypothesis that relative
representability supplies. The passage from
representability to a **smooth affine curve over `ℤ`**, which Layers 5B and 5C invoke, is KM
Corollary 4.7.1.

The existing development contains a global Legendre-action lemma which is false as stated. Its
replacement is a separate design decision in the migration of this block; later representability
claims remain dependent on that repair.

**Dependencies.** Layers 0C, 0E, 3N, and 4A–4B. The rigidifiers are naive structures, so this
block does not reach the Drinfeld strand or Layer 0A.

### 4D. Regularity of a moduli problem

Define regularity in Katz–Mazur's sense (KM 4.12). If `𝒫` is relatively representable and `δ` is a
representable étale rigidifying problem, then `𝒫` is regular of dimension `d` when the scheme
representing `(𝒫,δ)` is regular of dimension `d`. KM quantifies over *all* modular families, so
independence of the rigidifier is built into the definition rather than a theorem of KM's; proving
it for the formulation adopted here is this roadmap's own obligation. ⚠ KM's Notes Added in Proof
(p. 505) correct 4.12: "being of given dimension" is not étale-local, and the intended reading is
that the representing scheme is non-empty and every non-empty Zariski open is `d`-dimensional.
Layer 7 asserts regularity *of dimension two*, so it depends on the corrected reading.

Develop the required scheme-level API:

- regular schemes in terms of regular local rings;
- Krull dimension at a point;
- locality and invariance under isomorphism;
- preservation and reflection along étale morphisms;
- the criterion using completed local rings.

**Dependencies.** Layers 4A and 4C, and Mathlib's regular-local-ring theory.

## Layer 5: affine fine modular curves after inverting `N`

References: KM 2.7.2, 3.7.1, 4.7.0, Corollary 4.7.2; Loeffler 3.3.4, 3.3.6,
3.4.4, and §3.8.

### 5A. Tate normal form and `Y₁(N)`

Prove the Tate normal form theorem with equation

```text
Y² + aXY + bY = X³ + bX²
```

and its discriminant (Loeffler 3.3.4). Construct the universal family over
`Spec ℤ[a,b,Δ⁻¹]` for elliptic curves with a section which is nowhere of order at most three.

For `N ≥ 4`, impose `[N]P=0` and remove the loci where the order is a proper divisor of `N`.
Prove that the resulting scheme represents the naive `[Γ₁(N)]`-problem over `ℤ[1/N]`, is smooth
and affine, and is finite étale over `Ell/ℤ[1/N]` in the stated relative sense (the general-`N`
construction is the *unnumbered* "Definition (continued)" following Loeffler Definition 3.3.6, which
itself gives only `Y₁(5)_{ℤ[1/5]}`; Loeffler Theorem 3.4.4 gives smoothness only, and relative
representability with étaleness is Loeffler Proposition 3.8.2, and
3.4.4).

**Dependencies.** Layers 3N and 4C. Because it uses only the naive structures of 3N, it does not
reach the Cartier-divisor strand of Layer 0A.

### 5B. Full ordered bases and fixed pairing

For `N ≥ 3`, prove rigidity of the naive full-level problem (KM 2.7.2), relative representability by
the full-level locus in `E[N]×_S E[N]` (KM 3.7.1), and representability by a smooth affine scheme
`Y_full(N)` over `ℤ[1/N]` (KM 4.7.0 and Corollary 4.7.2).

Define `μ_N^prim` over `ℤ[1/N]` as the open-and-closed exact-order-`N` locus in `μ_N`. Construct:

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

No connectedness or irreducibility theorem is asserted. What is worth recording, and is cheap, is
why one would be stated on the fixed-pairing component rather than on `Y_full(N)`: after adjoining
`ζ_N`, `Y_full(N)` splits into components indexed by the primitive values of the pairing and
permuted by `GL₂` through the determinant, so it is *not* geometrically irreducible (Loeffler §3.8,
final Remark (2)). A proof would need a complex-connectedness input or KM Chapter 10, both out of
scope here.

**Dependencies.** The representability of `Y_full(N)` uses Layers 3N and 4C, and on that path is
independent of Layer 0A. The determinant map and fixed-pairing decomposition additionally use the
Weil pairing of Layer 2D, which *does* rest on Layer 0A; they require no further Cartier-divisor
theorem beyond it.

### 5C. The twisted curve `Y(ρ)`

Assume `N ≥ 3`. Let `V` be a free `(ℤ/Nℤ)`-module of rank two with a continuous Galois action and a
perfect alternating Galois-equivariant pairing to `μ_N`. Use Layer 0D to construct the corresponding
finite étale group scheme `V_ρ/ℚ` with pairing.

Define the moduli problem of pairs `(E,α)` with

```text
α : E[N] ≅ V_ρ
```

preserving the pairings. This is a twist of the fixed-pairing full-level problem, not of the union
of all determinant components. Prove rigidity and relative representability, apply KM 4.7.0, and
obtain a smooth affine curve `Y(ρ)/ℚ`. Prove its natural field-points description for every
characteristic-zero field. This is the interface used by the FLT `3`–`5` switch.

The hypothesis `N ≥ 3` is essential: for `N≤2`, `-1` acts trivially on `E[N]`, so the problem is not
rigid and KM 4.7.0 does not apply.

**Dependencies.** Layers 0D, 2D, 3N, and 4C. The construction uses no new Cartier-divisor
result beyond the Weil pairing already supplied by Layer 2D. The pairing normalisation in Layer 2D
uses the elliptic-curves roadmap.

## Layer 6: integral level problems, `Γ_H`, and coarse moduli

References: KM 3.6.0 (relative representability over `ℤ` of `[Γ(N)]`, `[Γ₁(N)]` and balanced
`[Γ₁(N)]` — *not* `[Γ₀(N)]`, which KM Remark 3.6.1 calls "much deeper" and defers to Chapter 6,
§§6.4 and 6.6), 7.1.3 (for `𝒫` affine over `Ell/R`), 7.4.2, 8.1.1, 8.1.3.1, 8.1.5, 8.1.6, 8.1.7;
Loeffler §§3.6 and 3.8.

### 6A. Relative representability over `ℤ`

Prove relative representability of the four Drinfeld problems:

- `[Γ₁(N)]` by the exact-order locus;
- `[Γ(N)]` by the full-set locus;
- `[Γ₀(N)]` by the scheme of cyclic subgroup schemes, equivalently the relevant space of
  degree-`N` isogenies;
- balanced `[Γ₁(N)]` by the cyclic-subgroup and Cartier-dual generator loci.

Prove that the relative representing morphisms are finite. Flatness and regularity over `Ell/ℤ` are
proved in Layer 7.

**Dependencies.** Layers 0A, 0B, 0F, 2A–2D, 3A–3C, and 4A. The integral Drinfeld definitions
use the Cartier-divisor and finite-flat group-scheme strands. This does not prevent the naive
`ℤ[1/N]` fine-curve constructions of Layer 5 from proceeding independently.

### 6B. `[Γ_H]`-problems

For `H≤GL₂(ℤ/Nℤ)`, define the quotient problem under the fixed right action and prove relative
representability (KM 7.1.3). State explicitly how `det H` acts on the determinant components.

Under the row-vector convention:

- `H₁ = {[[1,b],[0,d]]}` fixes the first basis vector and gives `[Γ₁(N)]`;
- the upper triangular Borel preserves the cyclic subgroup generated by the first basis vector and
  gives `[Γ₀(N)]` (KM 7.4.2(4));
- the diamond action on `[Γ₁(N)]` is `P↦aP`, read off the row-vector convention of Convention 5:
  `(P,Q)·[[a,b],[0,d]] = (aP, bP+dQ)`. Inside `SL₂` this is `P↦d⁻¹P`, since `ad=1` there; it is not
  `P↦dP`. With that reading it agrees with the corresponding quotient of the full-level action.

Prove the rigidity criterion for quotient problems and recover the semi-Borel rigid case for
`N≥4` (rigidity for `N ≥ 4` is KM 2.7.4, which is what KM itself cites at printed p. 120; the rigidity criterion for
`Γ_H` is Loeffler Proposition 3.8.3, over `ℤ[1/6]`. KM 7.4.2(3) is only the quotient identification
`[Γ₁(N)] = [Γ(N)]/(1 *; 0 *)` and states no rigidity).

**Dependencies.** Layers 4C, 5B, and 6A.

### 6C. Coarse moduli schemes

Develop KM's coarse-moduli construction using an auxiliary representable **finite étale Galois**
rigidifier `δ` with Galois group `G`, so that `M(𝒫) = 𝕄(𝒫,δ)/G` (KM 8.1.1 — without the Galois
hypothesis there is no group to quotient by). Prove the classifying map and functoriality (KM 8.1.3–8.1.4; KM has no single numbered universal
property in §8.1), the algebraically closed field-points property (KM Lemma 8.1.3.1), and the
comparison with finite quotients in KM 8.1.5. Record both sides of base change: the four sufficient
conditions of KM 8.1.6 and the failure in general of KM 8.1.7.

Construct the `j`-line:

- define the `j`-map on the Weierstrass parameter scheme;
- prove invariance under variable changes;
- identify the invariant coordinate ring with `ℤ[j]`;
- prove the coarse universal property of `Spec ℤ[j]`;
- prove the classification on algebraically closed field-valued points;
- record the automorphism loci `j=0` and `j=1728`.

For `N ≥ 3`, and **over `ℤ[1/N]`**, where `Y_full(N)` is constructed (Layer 5B), define

```text
Y₀(N) = Y_full(N)/B
```

for the upper triangular Borel `B`, and prove the coarse universal property. The base restriction is
not an `N`-dependent nicety: the Borel-quotient description is available only after inverting `N`
for every `N`, and the integral coarse space comes from the 8.1.1 construction above. The quotient exists as
an affine finite-group quotient, and `-1∈B` explains why the problem is not rigid (Loeffler 3.8.3).
For `N=1` or `2`, do not use this formula: `Y_full(N)` is not a fine representing scheme. Construct
the coarse space instead by the auxiliary-rigidifier construction of KM 8.1.1.

**Dependencies.** Layers 0C, 4C, 5B, and 6B.

## Layer 7: Katz–Mazur's First Main Theorem

References: KM 5.1.1 and Chapters 5–6.

For every positive `N`, prove:

> The `[Γ(N)]`-, `[Γ₁(N)]`-, balanced `[Γ₁(N)]`-, and `[Γ₀(N)]`-problems are relatively
> representable and finite flat of constant positive rank over `Ell/ℤ`; they are regular of
> dimension two in the sense of Layer 4D; after inverting `N` they are finite étale.

The proof is divided into the following parts.

### 7A. Deformation categories

Define Artinian and complete local bases with fixed residue field, deformations of elliptic curves,
isomorphisms of deformations, deformation functors, pro-representability, and universal deformation
rings. Compare a deformation functor with the formal completion of a rigidified representing scheme.

### 7B. Formal groups, finite flat groups, and `p`-divisible groups

Develop one-dimensional commutative formal groups, the `p`-series and height, Frobenius and
Verschiebung, Barsotti–Tate groups, connected–étale sequences, and `E[p^∞]`. Treat ordinary and
supersingular elliptic curves separately. Include the Oort–Tate classification statements actually
used for group schemes of order `p`.

### 7C. Serre–Tate theory

Prove that deforming an elliptic curve is equivalent to deforming its `p`-divisible group, with
compatibility for all four level structures.

### 7D. Local deformation rings for level structures

At every geometric point of residue characteristic `p`, define the deformation functor of the
elliptic curve with its prime-power level structure. Compute its universal ring in the ordinary and
supersingular cases. Prove flatness, regularity, and Krull dimension two. For a height-two
one-dimensional formal group over a perfect field, the universal deformation ring is
`W(k)⟦u⟧`: one deformation parameter and Krull dimension two.

### 7E. Globalisation

Identify the rings of 7D with completed local rings of the rigidified representing schemes. Apply
the completed-local-ring criterion of Layer 4D, reduce general level to prime-power level, and treat
`[Γ₀(N)]` separately using KM Chapter 6. Deduce the finite-flat, regularity, and étaleness clauses of
KM 5.1.1.

**Dependencies.** Layers 0–6, followed by 7A, 7B, 7C, 7D, and 7E in that order.

## Dependency order and parallel work

The core order is

```text
Layer 0 ──► Layer 1 ──► Layer 2 ──► Layer 3 (3A–3D) ──► Layer 6 ──► Layer 7
                    │           │
                    │           └──► Layer 3N ──► Layer 4 ──► Layer 5.
                    └──────────────────────────────────────────► Layer 5C (via 2D).
```

The strands inside Layer 0 can proceed independently, and the split between the Drinfeld blocks
3A–3D and the naive block 3N is what makes the two upper paths independent.

- The Cartier-divisor strand 0A feeds Layer 1D, the degree and Weil-pairing parts of Layer 2, the
  Drinfeld blocks 3A–3D, all four integral level problems in Layer 6, and Layer 7.
- Layer 3N, the general moduli formalism in Layer 4, the Tate-normal-form construction in Layer 5A,
  and the representability of the full ordered-basis problem in Layer 5B use no Cartier-divisor
  theorem and can proceed in parallel with 0A — they run through 3N rather than 3A–3D, which is
  why the parallelism is real rather than nominal. The determinant decomposition of Layer 5B and
  `Y(ρ)` in Layer 5C are added after the Weil pairing of Layer 2D, which *does* use 0A; they
  require no further Cartier theory beyond it.
- The elliptic-curves roadmap is used only by Layer 2D's final normalisation comparison and Layer
  2E's scheme/function-field comparison.
- Layer 2E has no downstream consumers inside this roadmap.

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
  `j=1728`.
- For `N≥3`, `Y₀(N)` is the Borel quotient of `Y_full(N)` and is not a fine moduli scheme.
- The points of `Y(ρ)` over a characteristic-zero field have the expected
  Galois-representation-with-pairing description.
- Scheme isogenies over a field agree with the sibling roadmap's `CoordinatePullback` isogenies,
  matching degree and multiplication maps.

## References

- N. M. Katz and B. Mazur, *Arithmetic Moduli of Elliptic Curves*, Annals of Mathematics Studies
  108, Princeton University Press, 1985.
- D. Loeffler, *Modular Curves*, graduate lecture notes. Relevant references include 3.3.4,
  3.3.6, 3.4.4, 3.7.4, and §3.8.
- P. Deligne and M. Rapoport, *Les schémas de modules de courbes elliptiques*, LNM 349, 1973.
- V. G. Drinfeld, *Elliptic modules*, Mat. Sbornik 94, 1974.
- B. Conrad, *Arithmetic moduli of generalized elliptic curves*, J. Inst. Math. Jussieu 6,
  2007, for the compactified theory which is outside this roadmap.
- K. Buzzard, *Formalizing Fermat*, Lecture 8, for `Y(ρ)`.
- Mathlib work in progress: mathlib4#25983 and mathlib4#35151.

## Existing Lean work

The principal source is AINTLIB (`github.com/CBirkbeck/AINTLIB`, public, Apache-2.0). The status
below is pinned to the same revisions as the current PR branch:

```text
main                       1c1c746        (2026-07-31)
dev/modular-curves         5c25ad561      (2026-08-01)   the active KM program
dev/modular-curves-y1      d9f2fbbb7b3e   full-level route
dev/modular-curves-b5da    0bb37c442f89   `[N]` formally unramified
dev/modular-curves-irr     320d99ea6182   irreducibility scoping, deferred with its milestone
```

At the `dev/modular-curves` pin the program is 824 files with ≈231 file-level `sorry` occurrences by
grep, per directory: `EllipticCurve` 189/26, `ForMathlib` 442/40, `GroupScheme` 33/36,
`LevelStructure` 10/19, `Moduli` 62/70, `ModularCurve` 12/17, `Picard` 57/7, `WeilPairing` 19/16.
The development branch moves and must be repinned before migration. Direct `sorry` counts are grep
counts at those pins — they over-count, because comments match, and they see no cross-file
dependence, so "in-tree with no direct `sorry`" never means "proved". The repository carries its own
capstone audit (`.mathlib-quality/scripts/capstone-census.lean` and the handover receipts). Every exported theorem must be rechecked with `#print axioms` after
migration. At the 2026-07-20 capstone audit, only the étaleness receipt
`levelSpaceΓπ_etale` among the seven fine-curve representability receipts was axiom-clean. The
remaining capstones run through a shared KM 4.7.0 implementation with two known obstacles: the
false-as-stated Legendre-action lemma and missing Oort–Tate finite-flat theory.

| Milestone | Source | Direct `sorry` | Transitive audit | Status |
|---|---|---:|---|---|
| Projective model and points dictionary | mathlib4#25983 / AINTLIB `EllipticCurve/` | 0 at pin | pending | in progress upstream |
| Group law over a base | mathlib4#35151 / AINTLIB chart chain | 2 | pending | in progress |
| Layer-0 general algebraic geometry | AINTLIB `ForMathlib/` | 41 | pending | migrate item by item |
| `[N]` finite flat of rank `N²` | AINTLIB `MulByHom*` | n/a | pending | incomplete |
| General dual isogeny | absent; `endDual` is endomorphism-only | n/a | n/a | new |
| Weil pairing construction | AINTLIB `WeilPairing/` | 11 | pending | incomplete; proof order must be repaired |
| Quotient by a finite subgroup | AINTLIB Hopf–Galois route | 0 at core | pending | migrate |
| `[Γ₀]` substrate (`NIsogeny`) | AINTLIB | 25 | pending | open |
| Level structures and exact order | AINTLIB `LevelStructure/` | 20 | pending | partial |
| Closed-locus full sets | AINTLIB affine form | n/a | n/a | globalisation open |
| Balanced `[Γ₁(N)]` | absent | n/a | n/a | new |
| `Ell/R`, atlas, rigidifiers, KM 4.7.0 | AINTLIB `Moduli/` | 2 | open | migrate after repairing the Legendre action |
| KM regularity definition | absent | n/a | n/a | new |
| Tate normal form and `Y₁(N)` | AINTLIB `main` chain | 16 carriers | main theorem axiom-clean 2026-07-12 | migration requires decomposition |
| `Y_full(N)`, `N≥3` | dev `Moduli/GammaHClosure.lean`, `Representability.lean` | 0 in capstone files | open: KM 4.7.0 engine | in tree; cone open |
| Drinfeld `[Γ(N)]`, `[Γ₁(N)]` over `ℤ` | dev `Moduli/GammaHClosure.lean` | 0 in file | open: engine and Oort–Tate | in tree; cone open |
| Étale receipt `levelSpaceΓπ_etale` | dev `Moduli/GammaHRepresentability.lean` | 2 in file | axiom-clean at 2026-07-20 audit | recheck after migration |
| Fixed-pairing `Y(N,ζ_N)` | absent | n/a | n/a | new correction |
| `Y(ρ)`, `N≥3` | dev `ModularCurve/RhoPoints.lean` | 0 in capstone file | open: engine | in tree; cone open |
| `Γ_H`, coarse spaces, and `j`-line | dev `GammaHMaster.lean`, `CoarseSpace.lean` | 0–1 | open: engine | partial |
| First Main Theorem | skeleton only | n/a | n/a | major new development |

Existing code is migration material, not the specification. When a source theorem has the wrong
hypotheses or a circular proof plan, the statement and proof order in this roadmap take precedence.
