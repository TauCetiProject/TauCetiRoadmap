# Roadmap: algebraic Gromov–Witten theory and quantum cohomology

**Summary.** This roadmap constructs of algebraic Gromov–Witten theory for a smooth projective variety
`X` over an algebraically closed field of characteristic zero. Starting from the moduli stack of
stable maps and its Behrend–Fantechi virtual fundamental class, this roadmap defines primary and
descendant Gromov–Witten invariants, proves their structural equations, and uses their genus-zero
part to construct the small and big quantum cohomology rings. The WDVV equation proves
associativity. The same potential defines the big Dubrovin connection and quantum `D`-module;
the divisor equation identifies their small restrictions, and the curvature is proved to vanish.

The algebraic state space is the rational numerical Chow ring

```text
H_X = N^*(X)_ℚ = CH^*(X)_ℚ / numerical equivalence.
```

MotivesAndAlgebraicCycles supplies finite-dimensionality via a Weil cohomology bound.
Numerical equivalence then makes the intersection pairing perfect. The quantum operations
use algebraic moduli, rational Chow classes and the resulting numerical state space.
The symplectic Gromov–Witten roadmap owns the analytic stable-map theory.

Suggested homes:

- `TauCeti/AlgebraicGeometry/Moduli/Curves/` for the prestable-curve stack and its comparison with stable curves;
- `TauCeti/AlgebraicGeometry/Moduli/StableMaps/` for the stable-map stack, universal curve,
  evaluation and clutching morphisms, and its obstruction theory;
- `TauCeti/AlgebraicGeometry/GromovWitten/` for tautological classes, Gromov–Witten classes and
  invariants, their equations, and WDVV;
- `TauCeti/AlgebraicGeometry/QuantumCohomology/` for Novikov rings, small and big products,
  Dubrovin connections, and quantum `D`-modules.

General moduli-stack, intersection-theoretic, formal-power-series, connection, and differential-
operator constructions belong in shared directories rather than under their first example.

## The end goals

Fix an algebraically closed field `k` of characteristic zero and a smooth projective
`k`-variety `X` of pure dimension `d`.

1. **Stable-map moduli and its virtual class.** For every genus `g`, number of ordered markings
   `n`, and effective numerical curve class `β`, construct the proper separated Deligne–Mumford
   stack `MbarMap g n X β`, its universal curve and map, and the evaluation, forgetting,
   stabilization, and gluing morphisms. Construct the standard perfect obstruction theory
   relative to the smooth stack of prestable curves and the class
   `[MbarMap g n X β]vir` of dimension
   `(1-g)(d-3) + n + c₁(T_X)·β`.
2. **Gromov–Witten classes and descendants.** Define cotangent-line classes `ψᵢ`, primary and
   descendant invariants, and, in the stable range for pointed curves, the Chow-valued
   Gromov–Witten class obtained by stabilization. Prove symmetry, the dimension axiom, the
   degree-zero formula, the fundamental-class, string, divisor, and dilaton equations, the
   splitting axiom, and genus-zero topological recursion.
3. **WDVV.** Compare the three boundary points of `Mbar_{0,4}` through the virtual splitting
   formula. Prove the coefficientwise WDVV equations for the genus-zero potential over the
   completed Novikov ring.
4. **Small quantum cohomology.** Define the small product on
   `H_X ⊗_ℚ Λ_X` from three-point genus-zero invariants. Prove that it is a graded commutative,
   associative, unital Frobenius algebra, specializes to the numerical Chow ring at positive
   Novikov order zero, and is independent of coordinates and of the ample class used to present
   the Novikov completion.
5. **Big quantum cohomology.** Over the formal parameter ring
   `R_X = Λ_X⟦t⁰, …, tᴺ⟧`, define the product from third derivatives of the genus-zero potential.
   Prove associativity from WDVV, the flat identity from the string equation, Frobenius
   invariance, and recovery of the small product at `t = 0`.
6. **Quantum connections and quantum `D`-modules.** Construct the big Dubrovin connection
   `∇_a = ∂_a + z⁻¹(T_a ⋆_t -)` on the trivial `H_X`-bundle over `Spf R_X`. Prove that it is
   flat and compatible with the Poincaré pairing under `z ↦ -z`. Package the operators
   `z∂_a + T_a ⋆_t` as the big quantum `D`-module. Use the divisor equation to construct the
   coordinate-free small connection and small quantum `D`-module over `Λ_X`, and prove that they
   are the divisor-slice restrictions of the big objects.

## Scope and ownership

This roadmap constructs ordinary algebraic Gromov–Witten theory for smooth projective varieties
over an algebraically closed characteristic-zero field, with rational numerical Chow state space.
It does not construct Gromov–Witten theory for singular targets, Deligne–Mumford target stacks,
relative pairs, logarithmic maps, quasimaps, stable quotients, or nonprojective targets. It also
does not construct equivariant, reduced, cosection-localized, real, open, K-theoretic, or derived
Gromov–Witten theories.

The quantum structures here are formal over the Novikov completion. Analytic convergence,
semisimplicity, canonical coordinates, Stokes data, integral structures, Givental's symplectic
formalism, reconstruction theorems beyond the stated divisor slice, mirror symmetry, and mirror
theorems are outside this roadmap. The quantum `D`-module is the completed module with Dubrovin
connection defined above; a general theory of algebraic `D`-modules on formal schemes is required
only to the extent explicitly built in Layer 10.

## Conventions

- **Curve classes.** `N₁(X)_ℤ` is the image of integral one-cycles in the dual of numerical
  divisor classes, and `NE(X)` is the submonoid of classes represented by effective integral
  one-cycles. The symbol `β` always lies in `NE(X)`. A stable-map family has class `β` when every
  geometric fibre pushes its fundamental one-cycle to `β`.
- **State-space grading.** `H_X^p = N^p(X)_ℚ` has Chow codimension `p` and cohomological degree
  `2p`. Every state-space class is even, so the symmetric-group, WDVV, and commutativity formulas
  have no Koszul signs. Set `deg Q^β = 2 c₁(T_X)·β` when discussing the cohomological grading.
- **Pairing.** The Frobenius pairing is `(a,b) = deg_X(a·b)`, extended `Λ_X`- and
  `R_X`-bilinearly. For a homogeneous basis `(T_a)`, write `g_ab = (T_a,T_b)` and `g^ab` for the
  inverse matrix. Basis formulas must be proved independent of the chosen homogeneous basis.
  Do not infer that the diagonal of `X×X` is `Σ g^ab T_a×T_b`: numerical Chow does not satisfy
  such a Künneth statement for an arbitrary `X`. Virtual gluing is first stated using refined
  pullback along the actual diagonal.
- **Chow before numerical Chow.** Evaluation pullbacks and virtual intersections are formed in
  rational Chow theory. Factoring each insertion through numerical equivalence is a theorem,
  not a definition of pullback on numerical equivalence classes.
- **Stable types.** A constant genus-zero map requires at least three markings, and a constant
  genus-one map requires at least one. All definitions and equations either assume that their
  source and target stable-map types exist or state the standard unstable convention explicitly.
  Negative descendant exponents denote zero. No formula silently treats a nonexistent moduli
  stack as a point.
- **Descendants.** For the universal curve `π : C → MbarMap g n X β` and section `s_i`, set
  `L_i = s_i^* ω_π` and `ψ_i = c₁(L_i)`. These are the cotangent lines on the stable-map stack,
  not pullbacks of cotangent lines from `Mbar_{g,n}` before the comparison theorem is proved.
- **Formal completions.** All infinite sums are interpreted in the Novikov and parameter-adic
  topology specified in Layer 1. Statements about potentials, products, connections, and
  differential operators are statements about continuous maps of complete modules.
- **Connection sign.** This roadmap fixes `∇_a = ∂_a + z⁻¹(T_a ⋆_t -)`. Horizontal sections
  therefore satisfy `(z∂_a + T_a ⋆_t)s = 0`. A development choosing the simultaneous opposite
  sign must provide the evident comparison and must not mix the two conventions.
- **Stacks and Chow coefficients.** Moduli objects are groupoid-valued fppf stacks, fibre
  products are 2-fibre products, and Chow groups of Deligne–Mumford stacks have rational
  coefficients. Stabilizer orders are never suppressed from degree computations.

## Exact supplier contracts

### From Mathlib

Use `MvPowerSeries` for the formal parameters and `Derivation` for the algebraic derivations.
Use Mathlib's commutative algebra, finite-rank lattices and topological-ring APIs.

### From Tau Ceti

Use `PrestableMap`, its evaluation and degree maps, scheme-level `Chow.ChowGroup` and
`LineBundleClass.IsAmple`. Specialize `TauCeti.NovikovSeries`, its commutative ring structure,
`single_mul_single`, `periodFiltration`, topological ring and completeness instances, and
`degreeDerivation` with `continuous_degreeDerivation`.

### From other Tau Ceti roadmaps

- [SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md) Layer 1 supplies the
  stack carriers and descent. Sections 4.14–4.15 supply Hilbert, Quot, Hom and Isom schemes,
  the stable pointed-curve stack `StableCurves.Mbar`, its universal curve, forgetting morphism,
  and smooth proper Deligne–Mumford geometry. Layer 5 supplies scheme intersection theory.
- [StableReduction](../StableReduction/README.md) Layer 9 supplies stable reduction for pointed
  curves and Layers 10–11 supply families of maps, the polarizations and stabilization of
  pointed maps. The valuative theorem for stable maps is a target in Layer 3 below.
- [StableReductionPartII](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1841) §§3.1–3.3
  and 3.11 supply stable-curve clutching, cotangent lines and their forgetting formula.
- [MotivesAndAlgebraicCycles](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1313) §§0.5
  and 3.1 supply the rational numerical Chow ring, operations and finite dimensionality.
- [AlgebraicModuliForArithmeticGeometryPartII](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1754) §§1.1–1.2, 1.4 and 1.7(iii) supply the numerical
  divisor lattice, numerical curve space, closed effective cone and Kleiman's criterion.
- [VirtualFundamentalClass](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1996) Layers 2, 3 and 6–9 supply
  rational stack Chow and refined Gysin operations, the relative cotangent complex, obstruction
  theories and the absolute and relative virtual classes and functoriality.
- [AlgebraicVectorBundles](../AlgebraicVectorBundles/README.md) L1A–L2B supply vector bundles
  and their geometric and sheaf comparisons. [DerivedModuleAlgebra](../DerivedModuleAlgebra/README.md)
  §§0.4 and 0.25 supply the ring cotangent complex and the square-zero obstruction theory.
  [EnhancedDerivedSheaves](../EnhancedDerivedSheaves/README.md) §0.3 and E1.8 supply derived
  tensor and Hom and perfect complexes.

## How to read the build

The dependency spine is:

```text
stable-map families ──→ curve and stable-map stacks ──→ universal geometry
                                                        │
numerical cycles ──→ Novikov completion                 ├─→ obstruction theory ─→ VFC
       │                                                │                         │
       └─→ numerical Chow state space                   └─→ forgetting/gluing ────┤
                                                                                  v
           descendants and virtual identities ─→ splitting/TRR ─→ WDVV
                                                                  │
                     small quantum product ←──────────────────────┤
                                                                  v
                       big potential/product ─→ flat connection ─→ quantum D-module
```

---

## Layer 0: numerical cycles and the algebraic state space

### 0.1 The numerical state space

Set `H_X = CH_num^*(X)_ℚ` using MotivesAndAlgebraicCycles §§0.5 and 3.1. Use its
finite-dimensional graded ring structure and prove perfectness of the complementary degree
pairing from the numerical quotient. Compare the numerical first Chern class with the degree
of its restriction to a curve.

*Needs:* MotivesAndAlgebraicCycles and SchemeAndStackFoundations Layer 5.

**Checks.**

- For a point, the pairing sends the pair of units to one.
- On the projective line the degree-zero and degree-one classes are dual.
- A degree-zero divisor on an elliptic curve maps to zero in numerical codimension one.

### 0.2 Numerical descent of insertions

For a rational Chow insertion `γ` which is numerically trivial, prove the projection-formula
criterion: pairing `ev^*γ` with any proper pushforward of a complementary Chow class has degree
zero. Package the multilinear descent lemma that will make every Gromov–Witten invariant factor
through `H_X` one insertion at a time.

*Needs:* MotivesAndAlgebraicCycles and SchemeAndStackFoundations Layer 5.

### Examples

**Checks.**

For the projective line, the point and unit pair to one. On an elliptic curve, the degree-zero part of the divisor group maps to zero in numerical codimension one.

### Dependencies

MotivesAndAlgebraicCycles and SchemeAndStackFoundations Layer 5.

## Layer 1: effective classes and the Novikov ring

### 1.1 Integral curve classes and ample degree

Take the integral image of integral one-cycles in the supplier's numerical curve space
`N₁(X/k)`, paired integrally with the finite-rank numerical divisor lattice. Define
`NE(X)` as the image of effective integral one-cycles inside this lattice. Use
AlgebraicModuliForArithmeticGeometryPartII §§1.1–1.4 and §1.7(iii) to prove that
`ω_A(β) = A·β` is strictly positive away from zero on the closed effective cone for ample
`A`. The bounded-height slice of the closed cone is compact and hence meets the lattice
in finitely many points. This proves finiteness of the classes with `ω_A(β) ≤ B`.

*Needs:* Layer 0, AlgebraicModuliForArithmeticGeometryPartII and Tau Ceti Novikov series.

### 1.2 Novikov series

Set `Λ_X = TauCeti.NovikovSeries ℚ NE(X) ω_A` and take the monomials, convolution,
period filtration, topology and completeness from the pinned API. Identify the geometric
divisor action with `NovikovSeries.degreeDerivation (D·−)`.

*Needs:* Layer 0, AlgebraicModuliForArithmeticGeometryPartII and Tau Ceti Novikov series.

**Checks.**

- The zero class gives the monomial `Q⁰ = 1`.
- For the projective line and its degree-one ample class, the ring is `ℚ⟦Q⟧`.
- Replacing the ample degree by a positive multiple gives the same convergent series.

### 1.3 Independence of ample class

For two ample classes, prove their degree functions are comparable on the effective cone and
induce cofinal filtrations. Export `Λ_X` independently of the chosen `A`, with canonical
continuous equivalences satisfying cocycle coherence.

*Needs:* Layer 0, AlgebraicModuliForArithmeticGeometryPartII and Tau Ceti Novikov series.

### 1.4 The mixed completion

Develop completed tensor products with finite-dimensional graded vector spaces, the induced action of the continuous divisor
derivations on the mixed completion
`R_X = Λ_X⟦t⁰,…,tᴺ⟧`. Prove continuity of substitution, differentiation, exponential
translation in divisor variables, coefficient extraction, and inversion of a matrix whose
constant term is invertible.

*Needs:* Layer 0, AlgebraicModuliForArithmeticGeometryPartII and Tau Ceti Novikov series.

**Checks.**

- Setting all parameters to zero gives back `Λ_X`.
- The coefficient of `t^m` in the inverse of `1 − Q^β t` is `Q^(mβ)`.
- The divisor derivation of a parameter is zero, and it acts on its Novikov coefficients.

### Examples

**Checks.**

On the projective line the effective lattice is the nonnegative integers. For the cone generated by (1,m) for m ≥ 0 in the plane, the functional (x,y) ↦ x is positive on generators and vanishes on a nonzero direction of the closed cone. Its bounded slice contains infinitely many lattice points.

### Dependencies

Layer 0, AlgebraicModuliForArithmeticGeometryPartII and Tau Ceti Novikov series.

## Layer 2: moduli stacks of pointed curves

### 2.1 The prestable-curve stack

Using the pointed prestable families from `StableReduction`, define the fppf stack
`Mpre g n` of connected genus-`g`, `n`-pointed prestable curves. Prove effective descent for
objects and arrows, construct the diagonal, and prove that it is an algebraic Artin stack,
smooth and pure of dimension `3g-3+n` over `k`, locally of finite type.

*Needs:* SchemeAndStackFoundations §4.15, StableReduction Layer 9 and StableReductionPartII §§3.1–3.3, 3.11.

### 2.2 The stable open locus

In the stable range `2g-2+n > 0`, identify the stable open locus with the supplied
`StableCurves.Mbar g n`. Use its universal curve and forgetting morphism, and
StableReductionPartII's clutching, cotangent lines and boundary comparison.

*Needs:* SchemeAndStackFoundations §4.15, StableReduction Layer 9 and StableReductionPartII §§3.1–3.3, 3.11.

### 2.3 Stabilization

Construct stabilization `Mpre g n → Mbar g n` in the stable range, with its cartesian
comparisons on families and flatness (Behrend 1997, Prop. 3). For smoothness and dimension
of the prestable stack use Prop. 2 of the same source.

*Needs:* SchemeAndStackFoundations §4.15, StableReduction Layer 9 and StableReductionPartII §§3.1–3.3, 3.11.

### Examples

**Checks.**

On the stable locus, stabilization is the identity. The universal three-pointed genus-zero stable curve lies over a point.

### Dependencies

SchemeAndStackFoundations §4.15, StableReduction Layer 9 and StableReductionPartII §§3.1–3.3, 3.11.

## Layer 3: the moduli stack of stable maps

### 3.1 The stable-map stack

Define `MbarMap g n X β` as the full substack of the stack of families of maps whose geometric
fibres are stable and have numerical class `β`. Prove effective fppf descent and invariance of
the class condition in connected families (Behrend–Manin §3).

*Needs:* Layers 0–2 and StableReduction Layers 9–11.

**Checks.**

- Constant maps in the stable range give `Mbar g n × X`.
- A constant genus-zero map with fewer than three markings has an empty stable-map stack.
- The unmarked genus-zero degree-one stable-map stack of the projective line is a point.

### 3.2 Boundedness and quotient presentation

Choose a projective embedding of `X` and use the polarization from `StableReduction` to prove
boundedness. Construct a Hilbert-scheme parameter space of embedded source curves with maps to
`X`, cut out nodality, marking, class, and stability loci, and identify the quotient by the
change-of-basis linear algebraic group with `MbarMap g n X β`. Prove independence of embedding
and exponent by equivalences satisfying cocycle coherence.

*Needs:* Layers 0–2 and StableReduction Layers 9–11.

### 3.3 Separatedness and properness

Prove that `MbarMap g n X β` is a separated Deligne–Mumford stack of finite type. Prove
the valuative theorem for stable maps: extend a generic stable map after finite DVR
extension and prove uniqueness up to unique isomorphism after common base change.
Use StableReduction Layer 9 and map stabilization in Layer 11, together with the stable-map
extension argument in Behrend–Manin Thm. 3.14 and Cor. 4.8. Apply the valuative criterion
for stacks to deduce properness.

*Needs:* Layers 0–2 and StableReduction Layers 9–11.

### 3.4 Universal geometry

Construct the universal curve `π`, universal map `f`, ordered sections, evaluation morphisms
`ev_i : MbarMap g n X β → X`, and the morphism to `Mpre g n`. In the pointed-curve stable
range construct `st : MbarMap g n X β → Mbar g n`. Compare all of these with the family-level
constructions in `StableReduction`.

*Needs:* Layers 0–2 and StableReduction Layers 9–11.

### 3.5 Forgetting and gluing

Construct permutation, forgetting-and-stabilizing, external gluing, and self-gluing morphisms.
External gluing has source
`MbarMap g₁ (I∪{a}) X β₁ ×_X MbarMap g₂ (J∪{b}) X β₂`, using `ev_a` and `ev_b`, and target
class `β₁+β₂`; state self-gluing separately. Prove their graph-stratum descriptions, degree,
properness, base change, and coherence for repeated gluing and forgetting.

*Needs:* Layers 0–2 and StableReduction Layers 9–11.

### Examples

**Checks.**

A stable degree-one map to the projective line is an isomorphism on its degree-one component. A constant map is stable exactly when its pointed source is stable.

### Dependencies

Layers 0–2 and StableReduction Layers 9–11.

## Layer 4: the stable-map obstruction theory and virtual class

### 4.1 The relative obstruction complex

On the universal curve prove that `Rπ_* f^*T_X` is perfect of amplitude `[0,1]`, commutes with
base change, and has rank `d(1-g)+c₁(T_X)·β` (Behrend 1997, §3). Dualize the differential of the universal map to
construct

```text
E = (Rπ_* f^*T_X)∨  ──→  L_(MbarMap/Mpre).
```

Prove the `H⁰` isomorphism and `H⁻¹` epimorphism through the deformation and obstruction theory
of a map with its source curve fixed.

*Needs:* Layers 2–3 and VirtualFundamentalClass Layers 2, 3 and 6–9.

### 4.2 Global resolution

Use the quotient presentation from Layer 3 to construct an equivariant global two-term
vector-bundle resolution of `E` and descend it to the stable-map stack (Behrend 1997,
Prop. 5). Construct the presentation as a quotient of a quasi-projective parameter scheme
with an ample linearized line bundle, and deduce the resolution property used for independence
in VirtualFundamentalClass §7.3.

*Needs:* Layers 2–3 and VirtualFundamentalClass Layers 2, 3 and 6–9.

### 4.3 Construction and virtual dimension

Combine the relative obstruction theory with smoothness and pure dimension
`3g-3+n` of `Mpre g n`. Construct
`[MbarMap g n X β]vir` and prove that its dimension is

```text
vdim = (1-g)(d-3) + n + c₁(T_X)·β.
```

Prove independence from the projective embedding, quotient presentation, resolution, and
strict model of every 2-pullback.

*Needs:* Layers 2–3 and VirtualFundamentalClass Layers 2, 3 and 6–9.

### 4.4 Point target and class zero

Identify the virtual class for `X = Spec k` with the ordinary fundamental class of
`Mbar g n` in the stable range. For `β = 0`, identify the stable-map stack with
`Mbar g n × X` and compute its obstruction theory and virtual class, including the genus-zero
specialization used by the classical product.

*Needs:* Layers 2–3 and VirtualFundamentalClass Layers 2, 3 and 6–9.

### 4.5 Virtual compatibility

Prove compatibility of obstruction theories under products of targets, permutation and
forgetting of markings, and external and self-gluing. Apply the compatible-pullback and product
theorems from `VirtualFundamentalClass` to obtain virtual pullback, virtual pushforward, and
diagonal Gysin formulas for the corresponding virtual classes.

*Needs:* Layers 2–3 and VirtualFundamentalClass Layers 2, 3 and 6–9.

### Examples

**Checks.**

For the point target the relative obstruction complex is zero. The constant genus-zero three-point virtual class is the ordinary fundamental class of the target.

### Dependencies

Layers 2–3 and VirtualFundamentalClass Layers 2, 3 and 6–9.

## Layer 5: tautological classes, Gromov–Witten classes, and invariants

### 5.1 Cotangent lines

Construct `L_i = s_i^*ω_π` and `ψ_i = c₁(L_i)` on the stable-map stack. Prove base change,
permutation, gluing, and forgetting formulas, including the boundary correction to `ψ_i` after
forgetting a mark.

*Needs:* Layers 0 and 2–4.

**Checks.**

- For a constant map in the stable range, the cotangent lines pull back from the stable curve.
- On the constant genus-zero three-point stack all cotangent classes vanish.
- The degree of each cotangent class on `Mbar 0 4` is one.

### 5.2 Descendant invariants

For `γ_i ∈ CH^*(X)_ℚ` and `a_i ∈ ℕ`, define

```text
⟨τ_{a₁}(γ₁)…τ_{aₙ}(γₙ)⟩_{g,β}
  = deg ( [MbarMap g n X β]vir · ∏ᵢ ψ_i^{a_i} ev_i^*γ_i ).
```

Define the value to be zero unless the integrand has total codimension `vdim`. Prove
multilinearity, permutation invariance, and compatibility with rational equivalence.

*Needs:* Layers 0 and 2–4.

**Checks.**

- On the projective line, the degree-one genus-zero two-point invariant of two point classes is one.
- On the point target, the genus-one one-point descendant with exponent one is `1/24`.
- For the genus-zero three-point invariant in class zero, a total codimension different from `dim X` gives zero.

### 5.3 Numerical descent

Apply Layer 0's projection-formula criterion to prove that each insertion factors through
numerical equivalence. Export the invariant as a multilinear map on `H_X`, while retaining the
rational-Chow definition used in geometric proofs.

*Needs:* Layers 0 and 2–4.

### 5.4 Ancestors and stabilized classes

When `2g-2+n > 0`, define the Gromov–Witten class
`st_*(∏ ev_i^*γ_i ∩ [MbarMap]vir)` in `CH^*(Mbar g n)_ℚ`, with the dimension shift stated
explicitly: insertions of total codimension `c` give codimension
`c+d(g-1)-c₁(T_X)·β` on `Mbar g n`. Prove that taking its degree after multiplying by
monomials in the stable-curve cotangent classes recovers the ancestor invariant, with
insertions `st^*ψ_i^curve`. Construct descendant classes by including the stable-map powers
`ψ_i^(a_i)` inside the pushforward. Their codimension increases by `Σ_i a_i` and their degree
is the descendant invariant. Identify the class `ψ_i - st^*ψ_i^curve` as the sum of
boundary divisors where the marked rational tail is contracted by stabilization, with
multiplicities from the cotangent comparison. Use the comparison in genus-zero descendant
recursion (Kontsevich–Manin 1998, §1.1, Thm. 1.2 and Cor. 1.3).

*Needs:* Layers 0 and 2–4.

### 5.5 Basic formulas

Prove vanishing by virtual dimension, the degree-zero formula, the point-target formula,
symmetry, and the product formula for targets. Include the stack multiplicities in every
pushforward and degree calculation.

*Needs:* Layers 0 and 2–4.

### Examples

**Checks.**

For degree one maps to the projective line, the descendant with insertions τ₁(H), H, 1 has value one by the string equation, while its corresponding ancestor vanishes on the three-pointed curve stack.

### Dependencies

Layers 0 and 2–4.

## Layer 6: equations and virtual splitting

### 6.1 String equation

Prove the fundamental-class and **string equations** from the forgetting morphism and the
cotangent-line pullback formula. With `τ_{-1}=0`, the stable formula is

```text
⟨τ₀(1) ∏ᵢ τ_{aᵢ}(γᵢ)⟩_{g,β}
  = Σⱼ ⟨τ_{aⱼ-1}(γⱼ) ∏_{i≠j} τ_{aᵢ}(γᵢ)⟩_{g,β}.
```

State and prove the exceptional constant-map conventions separately (Kontsevich–Manin 1994, §2.2).

*Needs:* Layers 2–5.

### 6.2 Dilaton equation

Prove the **dilaton equation**
`⟨τ₁(1)∏ᵢτ_{aᵢ}(γᵢ)⟩ = (2g-2+n)⟨∏ᵢτ_{aᵢ}(γᵢ)⟩` with the exact stable-type hypotheses.

*Needs:* Layers 2–5.

### 6.3 Divisor equation

For a divisor `D ∈ N¹(X)_ℚ`, prove the **divisor equation**

```text
⟨τ₀(D) ∏ᵢτ_{aᵢ}(γᵢ)⟩_{g,β}
  = (D·β)⟨∏ᵢτ_{aᵢ}(γᵢ)⟩_{g,β}
    + Σⱼ⟨τ_{aⱼ-1}(Dγⱼ)∏_{i≠j}τ_{aᵢ}(γᵢ)⟩_{g,β}.
```

Derive the primary divisor equation and its exponential generating-series form (Kontsevich–Manin 1994, §2.2, and Iritani Prop. 2.3).

*Needs:* Layers 2–5.

### 6.4 Virtual splitting

Prove the external and nonseparating **splitting axioms** by refined pullback along the target
diagonal and the virtual gluing formula. State the primary result as an equality of Chow
correspondences and its descendant version after cotangent-line pullback. After applying an
outgoing evaluation pushforward on each separate component, apply the projection formula
to derive numerical inverse-metric contraction for separating gluing. For nonseparating
gluing retain the refined pullback along the actual diagonal of the target. A numerical
inverse-metric contraction in this case requires the separate diagonal decomposition in
numerical Chow of the product. See Kontsevich–Manin 1994, §§2.2.7 and 2.3.8.

*Needs:* Layers 2–5.

### 6.5 Genus-zero topological recursion

Pull back boundary-divisor relations on `Mbar_{0,n}` and prove genus-zero topological recursion
for descendants. Check the unstable terms rather than absorbing them into an undefined
correlator (Kontsevich–Manin 1998, Cor. 1.3).

*Needs:* Layers 2–5.

### Examples

**Checks.**

In class zero on an elliptic curve, self-gluing two markings of the three-point operation gives the self-intersection of the diagonal, which vanishes. Numerical inverse-metric contraction would give twice the point class.

### Dependencies

Layers 2–5.

## Layer 7: the genus-zero potential and WDVV

### 7.1 The genus-zero potential

For a homogeneous basis `(T_a)` and `t = Σ_a t^aT_a`, define the genus-zero potential

```text
F₀(t) = Σ_{β∈NE(X)} Σ_{n≥0} Q^β/n! · ⟨t,…,t⟩_{0,β} ∈ R_X,
```

with constant-map terms of arity below three set to zero. Prove convergence in the mixed
completion and invariance under a change of homogeneous basis.

*Needs:* Layers 0–1 and 5–6.

**Checks.**

- For a point, the potential is `t³/6` in the unit coordinate.
- At Novikov order zero the potential is the classical triple-intersection cubic.
- For the projective plane, the coefficient of `Q² t_pt⁵/5!` in the degree-two contribution is the conic count one.

### 7.2 WDVV

Use the basis-free virtual splitting formula over the three boundary points of
`Mbar_{0,4} ≅ ℙ¹`, followed by an outgoing evaluation pushforward, to prove associativity of
the resulting correspondence-valued genus-zero operation. Pass to numerical equivalence and
the perfect pairing to deduce the coefficientwise WDVV identity

```text
Σ_{e,f} F_{abe} g^{ef} F_{fcd}
  = Σ_{e,f} F_{ace} g^{ef} F_{fbd},
```

where `F_{abc} = ∂_a∂_b∂_cF₀`. Prove equality in the completed ring by checking every
Novikov and parameter coefficient; formal rearrangement of an unproved infinite sum is not a
proof.

*Needs:* Layers 0–1 and 5–6.

### 7.3 Potential identities

Express string, divisor, and grading equations for `F₀`. Separate the classically cubic
degree-zero term, and prove that third derivatives eliminate the convention-dependent constant,
linear, and quadratic terms.

*Needs:* Layers 0–1 and 5–6.

### Examples

**Checks.**

At class zero the cubic potential is given by the classical triple intersection pairing. The two splittings of the four-pointed curve give the same WDVV coefficient.

### Dependencies

Layers 0–1 and 5–6.

## Layer 8: small and big quantum cohomology

### 8.1 Small product and pairing

First define the small product in rational Chow theory by the outgoing evaluation pushforward

```text
a ⋆small b = Σ_β Q^β (ev₃)_*(ev₁^*a · ev₂^*b ∩ [MbarMap 0 3 X β]vir).
```

Prove that this descends in both inputs and in its output to numerical equivalence, and prove
the characterizing identity
`(a ⋆small b,c)=Σ_βQ^β⟨a,b,c⟩_{0,β}`. Prove continuity, `Λ_X`-bilinearity, grading,
commutativity, the Frobenius identity, and that `1_X` is its unit.

*Needs:* Layers 0–1 and 5–7.

**Checks.**

- For a point, the small product is ordinary multiplication.
- On the projective line, `H ⋆small H = Q·1` for the point class `H`.
- On projective space of dimension `r`, the `r+1` power of the hyperplane class is `Q·1`.

### 8.2 Small associativity

Prove associativity of `⋆small` from the basis-free four-point WDVV correspondence. Prove that its
Novikov-order-zero specialization is the ordinary product on `H_X`. Define
`QH^*small(X) = (H_X ⊗ Λ_X, ⋆small)` and prove independence from basis and ample filtration.

*Needs:* Layers 0–1 and 5–7.

### 8.3 The big product

Define the big product first by the analogous outgoing evaluation pushforward with any number
of additional insertions of `t`. Prove convergence and descent to numerical equivalence, then
prove its equivalent coordinate characterization:

```text
a ⋆t b = Σ_{β,n} Q^β/n! · (ev_{n+3})_*
  (ev₁^*a · ev₂^*b · ∏_{i=3}^{n+2} ev_i^*t ∩ [MbarMap 0 (n+3) X β]vir),

(T_a ⋆t T_b, T_c) = ∂_a∂_b∂_c F₀(t).
```

Extend it continuously and `R_X`-bilinearly to `H_X ⊗ R_X`. Prove commutativity, the Frobenius
identity, the unit property from the string equation, and associativity from the full formal
WDVV equation. Define `QH^*big(X)` and prove that evaluation at `t=0` is the small quantum
product. See Fulton–Pandharipande (48)–(49) and Thm. 4 for the homogeneous-target case.

*Needs:* Layers 0–1 and 5–7.

**Checks.**

- The parameter origin gives the small product.
- The unit coordinate leaves the multiplication operators unchanged.
- For the projective line on the divisor slice, `H ⋆t H = Q exp(t_H)·1`.

### 8.4 Naturality and grading

Prove coordinate invariance under linear changes of homogeneous basis and functoriality under
isomorphisms of targets. Record precisely which grading survives without a Fano or monotonicity
hypothesis and how the Novikov degree restores the full cohomological grading.

*Needs:* Layers 0–1 and 5–7.

### Examples

**Checks.**

For the projective line, the point class squares to the degree-one Novikov monomial. Compare the class-zero specialization with the classical ring.

### Dependencies

Layers 0–1 and 5–7.

## Layer 9: the big quantum connection and flatness

### 9.1 The Dubrovin connection

Let `M_X = H_X ⊗ R_X((z))`. For every continuous coordinate derivation `∂_a`, define
`∇_a = ∂_a + z⁻¹C_a`, where `C_a(s)=T_a⋆_t s`. Prove the connection Leibniz rule,
continuity, and covariance under a change of basis (Iritani Def. 2.2).

*Needs:* Layers 1 and 7–8.

**Checks.**

- For a point, the unit-coordinate operator is `∂_t + z⁻¹`.
- The unit coordinate commutes with the divisor coordinate on the projective line.
- The order-`z⁻¹` terms from the multiplication operators cancel in the paired connection formula under `z ↦ −z`.

### 9.2 Curvature and flatness

Compute the curvature before invoking WDVV:

```text
[∇_a,∇_b]
  = z⁻¹(∂_aC_b-∂_bC_a) + z⁻²[C_a,C_b].
```

Prove `∂_aC_b=∂_bC_a` from symmetry of fourth derivatives of `F₀`. Prove
`[C_a,C_b]=0` from commutativity and associativity of `⋆_t`. Conclude that the big quantum
connection is flat. Conversely, for a commutative product, vanishing of the `z⁻²`
coefficient as an endomorphism on every state gives associativity: commute `C_c` and
`C_a` on `b` to identify `(a⋆b)⋆c` with `a⋆(b⋆c)`.

*Needs:* Layers 1 and 7–8.

### 9.3 Flat pairing

Define the `z`-sesquilinear pairing
`S(s₁,s₂) = (s₁(-z),s₂(z))`. Prove
`∂_aS(s₁,s₂)=S(∇_as₁,s₂)+S(s₁,∇_as₂)` using the Frobenius identity. Package the connection,
flat pairing, unit, and multiplication as the formal Frobenius structure attached to `X`.

*Needs:* Layers 1 and 7–8.

### 9.4 The formal fundamental solution

Extend the connection to `H_X ⊗ Λ_X((z))⟦t⁰,…,tᴺ⟧`, the inverse limit of the Laurent
modules over the finite parameter truncations. Use the Novikov topology coefficientwise,
and allow the lower Laurent bound to depend on the truncation order. In this module solve
the horizontal equations recursively in the parameter degree, with identity constant term.
Use flatness to prove consistency of the recursions and characteristic zero for uniqueness.
See Iritani §2.3 and Prop. 2.3 for the formal solution convention.

*Needs:* Layers 1 and 7–8.

### Examples

**Checks.**

For the point target the normalized solution is exp(−t/z). Each truncation in t has a finite pole order.

### Dependencies

Layers 1 and 7–8.

## Layer 10: big and small quantum `D`-modules

### 10.1 The Rees algebra

Define the Rees differential-operator algebra `D_big,z` generated over
`R_X[z]` by symbols `z∂_a`, with relations
`[z∂_a,f]=z∂_a(f)` and `[z∂_a,z∂_b]=0`. Prove its normal-form and continuity properties.

*Needs:* Layers 1 and 6–9.

### 10.2 The big quantum module

Make `H_X⊗R_X[z]` a left `D_big,z`-module by
`z∂_a·s = z∂_a(s)+T_a⋆_t s`. Prove the relations using flatness. Define this module, together
with its localization at `z`, as the **big quantum `D`-module**, and identify its horizontal
equations with those of the Dubrovin connection. Identify the localized module over
`R_X[z,z⁻¹]`, and its parameter-adic completion over `Λ_X[z,z⁻¹]⟦t⁰,…,tᴺ⟧`, separately.
Map this completion into the Laurent-series solution space of Layer 9. See Iritani Def. 2.2.

*Needs:* Layers 1 and 6–9.

**Checks.**

- For the point target, the action of `z∂_t` is `z∂_t + 1`.
- The commutator with multiplication by `t^a` is multiplication by `z`.
- The point's horizontal solution belongs to the parameter completion of the localized module.

### 10.3 The small connection

For `D ∈ N¹(X)_ℚ`, use Layer 1's Novikov derivation `δ_D`. Define the coordinate-free small
connection

```text
∇^small_D = δ_D + z⁻¹(D ⋆small -).
```

Prove `ℚ`-linearity in `D`, the Leibniz rule over `Λ_X`, and
`[∇^small_D,∇^small_E]=0`. The proof uses the divisor equation, not a choice of generators of
the effective cone.

*Needs:* Layers 1 and 6–9.

### 10.4 The small quantum module

Define the small Rees differential-operator algebra generated by `zδ_D` and the small quantum
`D`-module with action `zδ_D + D⋆small`. Prove independence from a basis of `N¹(X)`.

*Needs:* Layers 1 and 6–9.

**Checks.**

- The zero divisor induces the zero differential operator.
- On a Novikov monomial, the commutator of the small operator with multiplication by `Q^β` is multiplication by `z(D·β)Q^β`.
- On the projective line, the operator for the point divisor sends the constant section `1` to `H` and the constant section `H` to `Q·1`.

### 10.5 The divisor slice

For a basis `D_i` of the divisor variables define
`φ : Λ_X → Λ_X⟦t_div⟧` by `Q^β ↦ exp(Σ_i t^i(D_i·β))Q^β`. Prove
`∂_(t^i) φ(f) = φ(δ_(D_i) f)`. Use the divisor equation to identify the divisor restriction
of the big product, connection and Rees module with the pullback of the small ones along
`φ`, using the displayed relation to identify the operators. Prove basis independence.

*Needs:* Layers 1 and 6–9.

### Examples

**Checks.**

On the divisor slice for the projective line, the first Novikov monomial becomes exp(t)Q and the logarithmic Novikov derivation becomes differentiation in t.

### Dependencies

Layers 1 and 6–9.

## Acceptance criteria and worked examples

- **The point.** For `X = Spec k`, identify stable maps with stable curves, the virtual class
  with `[Mbar g n]`, and descendant invariants with ψ-class intersection numbers. Show that the
  quantum ring is `ℚ`, the big product is constant, and in the unit coordinate the rank-one
  connection is `∂_t+z⁻¹`. Its normalized solution `exp(−t/z)` lies in
  `ℚ((z))⟦t⟧`, with unbounded pole order as the parameter degree increases.
- **Class zero.** For genus zero and `β=0`, compute the three-point invariant as
  `deg_X(a·b·c)`. Verify that the zero-Novikov part of both quantum products is numerical Chow
  multiplication and that WDVV reduces to its associativity.
- **Projective line.** With `H` the point/divisor class, compute
  `QH^*small(ℙ¹) ≅ Λ[H]/(H²-Q)`. Write the two multiplication matrices and check the small
  curvature calculation directly.
- **Projective space.** Prove the degree-one calculation needed for
  `QH^*small(ℙ^r) ≅ Λ[H]/(H^{r+1}-Q)`, including the enumerative transversality or virtual-class
  argument and every dimension constraint (Fulton–Pandharipande §10).
- **Products.** Compare the virtual product formula on exterior-product insertions, using
  the two projections on numerical curve classes to match the Novikov coefficients.
  Work on the exterior-product state subspace, and state the product-class sum on the
  coefficient side. A tensor-product identification of the whole quantum state space
  requires the exterior-product numerical Künneth isomorphism. Check that for an elliptic
  curve the diagonal in the square is outside the exterior-product span.
- **A boundary calculation.** On `Mbar_{0,4}`, compute both sides of one basis-free WDVV
  correspondence by the two splittings `12|34` and `13|24`, including the diagonal Gysin map and
  automorphism factors. Pair its numerical image with a fourth insertion and recover the
  inverse-metric coefficient identity. This test must fail if the gluing fibre product or
  diagonal Gysin map is oriented incorrectly.

## Downstream consumers

Mirror comparison for projective targets uses the genus-zero product, the small quantum
connection and the divisor-slice comparison. The algebraic invariants and virtual splitting
formulas also supply the inputs to reconstruction problems for particular targets.

## References

- M. Kontsevich and Yu. Manin,
  [*Relations between the correlators of the topological sigma-model coupled to gravity*](https://arxiv.org/abs/alg-geom/9708024),
  for the ancestor and descendant comparison and genus-zero recursion.

- K. Behrend and Yu. Manin,
  [*Stacks of stable maps and Gromov–Witten invariants*](https://arxiv.org/abs/alg-geom/9506023),
  Duke Math. J. 85 (1996), 1–60, for stable-map stacks, decorated graphs, evaluation, gluing, and
  the axiomatic structure of the invariants.
- K. Behrend,
  [*Gromov–Witten invariants in algebraic geometry*](https://arxiv.org/abs/alg-geom/9601011),
  Invent. Math. 127 (1997), 601–617, for the stable-map obstruction theory and virtual
  fundamental class in arbitrary genus.
- K. Behrend and B. Fantechi,
  [*The intrinsic normal cone*](https://arxiv.org/abs/alg-geom/9601010), Invent. Math. 128
  (1997), 45–88, for perfect obstruction theories, virtual classes, and their functoriality.
- W. Fulton and R. Pandharipande,
  [*Notes on stable maps and quantum cohomology*](https://arxiv.org/abs/alg-geom/9608011),
  Proc. Sympos. Pure Math. 62 (1997), Part 2, 45–96, for the projective construction of stable-map
  moduli, Gromov–Witten invariants, WDVV, and small and big quantum products.
- M. Kontsevich and Yu. Manin,
  [*Gromov–Witten classes, quantum cohomology, and enumerative geometry*](https://arxiv.org/abs/hep-th/9402147),
  Comm. Math. Phys. 164 (1994), 525–562, for the axioms, splitting formulas, reconstruction, and
  the WDVV equations.
- B. Dubrovin,
  [*Geometry of 2D topological field theories*](https://arxiv.org/abs/hep-th/9407018), in
  *Integrable Systems and Quantum Groups*, Lecture Notes in Math. 1620, Springer, 1996, for
  Frobenius manifolds and the flat Dubrovin connection.
- H. Iritani,
  [*Quantum D-modules and generalized mirror transformations*](https://arxiv.org/abs/math/0411111),
  Topology 47 (2008), 225–276, for the small and big quantum `D`-module conventions and their
  divisor-slice relationship.
- W. Fulton, *Intersection Theory*, 2nd ed., Springer, 1998, for Chow groups, numerical
  equivalence, refined diagonal pullbacks, and intersection pairings.

## Acknowledgements

The geometric spine follows Behrend–Manin, Behrend–Fantechi, and Behrend. The axioms and WDVV
organization follow Kontsevich–Manin and Fulton–Pandharipande, while the connection and quantum
`D`-module package follows Dubrovin and Iritani.
