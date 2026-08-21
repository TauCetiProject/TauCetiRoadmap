# Roadmap: integral quadratic forms and lattices

Mathlib has the material a lattice is made of. It does not have the arithmetic of
lattices. This roadmap builds that arithmetic over `ℤ` and `ℤ_p`.

The foundational carrier, duality, discriminant-form, and gluing layers are the reviewed
interface already merged in upstream PR #200. This roadmap extends that interface; it does
not replace it with the broader programme below. In particular there is one lattice carrier,
one discriminant-form convention, and one overlattice correspondence throughout.

Mathlib supplies:

- quadratic maps over a commutative semiring, with the polar and companion calculus, which
  works over `ℤ`;
- symmetric bilinear forms, their Gram matrices, and a base change that does not invert 2;
- Smith normal form over a principal ideal domain, with the theorem that the index of a
  full-rank submodule is the absolute value of a determinant;
- the dual submodule of a bilinear form, whose own file asks for the lattice theory below;
- lattices in real vector spaces, with covolume and lattice-point counts;
- root systems and the Cartan matrices, including `CartanMatrix.E₈`;
- Jacobi theta functions with their transformation laws.

Mathlib supplies none of the following, and no other Lean library supplies them either:

- even and odd lattices, and unimodular lattices;
- discriminant groups and discriminant forms;
- Jordan splittings, the genus, and Conway–Sloane genus symbols;
- class numbers and spinor genera;
- the mass formula;
- Nikulin's existence, uniqueness and embedding theory;
- the theta series of a lattice.

The principal results of this roadmap are:

1. the classification of even unimodular lattices in low rank;
2. the genus, its Conway–Sloane symbols, the class and spinor-genus dictionary, and the local
   densities that a mass formula is assembled from;
3. Nikulin's theory of existence, uniqueness and primitive embeddings for even lattices.

⚠ The **Smith–Minkowski–Siegel mass formula itself is not a milestone here**, and neither is
Eichler's theorem. Both are assembled from an adelic volume comparison for `SO(V)` — strong
approximation for `Spin` and a Tamagawa normalization — and neither #246 `AdelicAlgebraicGroups`
nor #255 `OrthogonalSpinGroups` exports those in its accepted scope. Their exact owner is the
named successor roadmap **`OrthogonalTamagawaAndLatticeMass`**; see §*Scope*. What stays here is
everything that supplier will need from the lattice side: the class/genus/spinor-genus
dictionary, the stabilizers, the local densities at odd `p` and at `2`, the archimedean factor,
and the low-rank values.

Two projects consume the results. The LMFDB lattice section stores positive definite
integral lattices with their genus representatives. The K3 surface pipeline enumerates
genera and applies Nikulin's embedding criteria.

Suggested homes, which follow Mathlib's directory conventions:

- `TauCeti/LinearAlgebra/QuadraticForm/IntegralLattice/` for Layers 0 to 2. These layers
  hold the lattice structure, the bilinear and quadratic dictionary, dual lattices,
  discriminant groups, finite quadratic forms, reduction theory, and automorphism groups.
- `TauCeti/NumberTheory/IntegralLattice/` for Layers 3 to 8. These layers hold
  localizations, Jordan theory, the genus and its symbols, class numbers, spinor genera,
  Nikulin's theory, the unimodular classification, the local mass ingredients, and theta series.

## Scope

In scope: the arithmetic of integral lattices over `ℤ` and `ℤ_p`, as listed in the layers
below.

The direct roadmap dependencies are exactly `QuadraticFormInvariants`,
`GlobalQuadraticForms`, `GlobalNumberFields`, `ClassFieldTheory`,
`AdelicAlgebraicGroups`, `OrthogonalSpinGroups`, `RepresentationTheory/RootSystems`, and
`LFunctions`. Their field-level, global-form, order/class-field, adelic, spin, ADE, and
analytic inputs are consumed; none is repackaged as a private lattice-side carrier. Every
declaration this roadmap names in those suppliers is one they actually export in their accepted
scope — that is the point of the narrowing recorded next.

### What moved out, and who owns it

The reviewed scopes of #246 and #255 deliberately exclude generic strong approximation,
reduction theory, Tamagawa measures, and the central-isogeny volume comparison. Anything here
that rested on them therefore had no supplier at all, and a prose reference to a removed
milestone is not a closed dependency. Those results move out, to one exact owner:

| Moved out | Was | Exact owner |
| --- | --- | --- |
| Eichler's theorem `cls⁺ L = spn⁺ L` for indefinite rank `≥ 3`, and the class-number finiteness that follows from it | 4D, and the rank-`≥ 3` half of 4E | **`OrthogonalTamagawaAndLatticeMass`** |
| the adelic decomposition of `SO(V)(ℚ) \ SO(V)(𝔸)` into class-indexed pieces | 7B | **`OrthogonalTamagawaAndLatticeMass`** |
| the identification of a local density with the Haar volume of a stabilizer in the Tamagawa normalization | one bullet of 7C | **`OrthogonalTamagawaAndLatticeMass`** |
| the volume theorem `vol(SO(V)(ℚ) \ SO(V)(𝔸)) = 2` | 7F | **`OrthogonalTamagawaAndLatticeMass`**, over the generic `TamagawaMeasures` |
| the Conway–Sloane mass formula and its checks | 7H | **`OrthogonalTamagawaAndLatticeMass`** |
| the rank-16 completeness statement, that the genus of `E₈²` has exactly two classes | 7I | **`OrthogonalTamagawaAndLatticeMass`** |

`OrthogonalTamagawaAndLatticeMass` is the orthogonal specialization named by #255 and #246; it
sits on the generic successors `AlgebraicGroupStrongApproximation`, `ArithmeticReductionTheory`
and `TamagawaMeasures` that #246 names. It consumes this roadmap and is not consumed by it, so
the dependency stays one-way. Everything it needs from the lattice side — 4A, 4B, 4C, the local
densities 7C and 7D, the archimedean factor 7E, the mass definitions and the relation `m⁺ = 2m`
of 7A, and the low-rank values 7G — remains a milestone **here**, so the split does not leave a
gap between the two roadmaps.

Out of scope, with the owner of each subject:

| Subject | Owner |
| --- | --- |
| local quadratic forms, square classes, Witt/Brauer/Hasse/Clifford invariants, the Hilbert symbol, and dyadic classification | [Quadratic Form Invariants](../QuadraticFormInvariants/README.md) |
| Hasse--Minkowski and global classification, representation, and realization of rational forms | [Global Quadratic Forms](../GlobalQuadraticForms/README.md) |
| the groups `O(Q)`, `SO(Q)`, and `Spin(Q)`, the spinor norm, transvections, and local and finite-adelic spin groups | [Orthogonal and Spin Groups](../OrthogonalSpinGroups/README.md) |
| generic restricted products, compact-open families, and rational diagonals | [Adelic Algebraic Groups](../AdelicAlgebraicGroups/README.md) |
| generic algebraic-group adelic points, strong approximation, reduction theory, Tamagawa measures, and the central-isogeny volume comparison | `AlgebraicGroupStrongApproximation`, `ArithmeticReductionTheory` and `TamagawaMeasures`, the successors #246 names |
| the orthogonal specialization: strong approximation for `Spin`, `τ(SO_Q) = 2`, Eichler's theorem, the genus/spinor-genus comparison in rank `≥ 3`, and the Smith–Minkowski–Siegel mass formula | `OrthogonalTamagawaAndLatticeMass`, the successor #255 names |
| root systems, Weyl groups, `DynkinType`, the ADE classification | [Root Systems](../RepresentationTheory/RootSystems/README.md) |
| Poisson summation and the real-parameter Gaussian theta transformation | [L-functions](../LFunctions/README.md) |
| number-field orders, conductors, raw proper fractional ideals, invertible proper fractional ideals, the ideal class monoid, `Pic`, and `NarrowPic` for the nonsplit binary branch | [Global Number Fields](../GlobalNumberFields/README.md) |
| ring class fields and their Artin isomorphisms for nonsplit quadratic field orders | [Class Field Theory](../ClassFieldTheory/README.md) |
| modular forms of integral weight, Hecke theory, newforms | [Modular Forms](../ModularForms/README.md) |

The following subjects have no owner and are not part of this roadmap. They are listed so
that a reader can see the boundary.

- Modularity of theta series. No roadmap proves that the theta series of an even lattice
  is a modular form, and half-integral weight is developed nowhere. Layer 8 therefore
  stops after the transformation law.
- The analytic proof of the mass formula, which uses Siegel Eisenstein series, the Weil
  representation and Siegel–Weil. The route to the mass formula is the adelic volume of `SO(V)`,
  and it is `OrthogonalTamagawaAndLatticeMass`'s, not this roadmap's.
- Lattices over the ring of integers of a number field. Every statement here is over `ℤ`
  or `ℤ_p`.
- Lattice reduction algorithms beyond the bounds that finiteness needs.
- Automorphism groups of indefinite lattices, and Borcherds' method.
- Sphere packing optimality, and constructions of lattices from codes.

## How to read a milestone

Each layer states its milestones with a label, such as `3E`. Other roadmaps and the tables
below cite these labels. One layer carries a letter instead of a number: Layer B holds the
binary theory, and its milestones are `B1` to `B8`. Each layer ends with a table of direct
prerequisites. Every prerequisite has one of four kinds:

- **M**: a declaration that exists in Mathlib.
- **T**: a declaration that exists in Tau Ceti.
- **L**: an earlier milestone of this roadmap.
- **R**: a prerequisite from another roadmap. Where that roadmap has fixed a Lean name, the
  row names the **declaration**, and §What other roadmaps supply carries its type; a subject is
  then never a prerequisite, so "the Picard group of an order" is not one and `Pic` is. Where the
  supplier has fixed a milestone but no name, the row cites the layer, and the supplier table
  gives the provisional name marked with an asterisk.

No prerequisite has any other kind. A Mathlib pull request, an external repository, a
branch, and a future Mathlib version are all excluded.

## Conventions

These decisions hold in every layer.

**The single lattice carrier.** The canonical object is the reviewed embedded carrier from
PR #200: a full `ℤ`-submodule of a rational vector space, with a symmetric rational form
which is integer-valued on the carrier:

```lean
structure IntegralLattice (V : Type u) [AddCommGroup V] [Module ℚ V] where
  carrier : Submodule ℤ V
  [isLattice : carrier.IsLattice ℚ]
  form : LinearMap.BilinForm ℚ V
  isSymm : form.IsSymm
  integral : ∀ x ∈ carrier, ∀ y ∈ carrier, form x y ∈ (1 : Submodule ℤ ℚ)
```

`Submodule.IsLattice ℚ` supplies finite generation, freeness, full rational span, bases, and
rank. An abstract finite free `ℤ`-module with an integral symmetric form is an input view,
not a second carrier: rationalization embeds it as an `IntegralLattice`, and restriction of
an `IntegralLattice` to its carrier recovers the abstract form. Milestone 1A proves these
constructions inverse up to isometry and transports every invariant. The prose writes `B`
for the rational form and `L` for the embedded lattice. Nondegeneracy and definiteness are
predicates, never structure fields.

**The bilinear form is the primary datum.** The norm of `x` is `B x x`. The roadmap never
halves a norm without saying so. `L` is even when `B(x,x) ∈ 2ℤ` for every `x ∈ L`, and
odd otherwise. Restricting `B` to the carrier gives an integral symmetric bilinear form;
an even restriction is `Q.polarBilin` for a unique `Q : QuadraticForm ℤ L` with
`Q x = B(x,x)/2`. Milestones 0B and 1A prove this dictionary and its transport.

**Do not use the associated bilinear form over `ℤ`.** `QuadraticMap.associated` requires
`[Invertible (2 : Module.End R N)]`, which fails for `R = N = ℤ`.
`QuadraticForm.toMatrix`, `QuadraticForm.discr` and `QuadraticForm.baseChange` require
`[Invertible (2 : R)]`, which fails for `R = ℤ`. The polar and companion calculus and the
bilinear Gram and base-change API have no such hypothesis. This is why the roadmap states
everything through the bilinear form.

**Determinant.** The Gram matrix of `β` in a basis `b` is
`LinearMap.BilinForm.toMatrix b β`. A change of basis over `ℤ` has determinant `±1`. Gram
determinants are therefore equal, and not merely equal up to squares, so `det L : ℤ` is an
invariant. The word discriminant is reserved for the discriminant group `A_L` and the
discriminant form `q_L`.

**Signature and degeneracy.** The signature is the reviewed triple `(t₊, t₀, t₋)` over
`ℚ`: `t₊` and `t₋` are Mathlib's `sigPos` and `sigNeg` for `B.toQuadraticMap`, and `t₀`
is the dimension of `LinearMap.ker B`. They sum to the rank. The abbreviation `(t₊,t₋)`
is used only after nondegeneracy has supplied `t₀=0`; the signature index is then
`τ(L)=t₊−t₋`. Positive/negative semidefinite and indefinite are predicates in this same
vocabulary, so degenerate affine Cartan forms remain objects of the canonical carrier.

**Definiteness.** `PosDef` is `QuadraticMap.PosDef` of `B.toQuadraticMap`. `NegDef L`
means `PosDef (L(−1))`. Definite means positive definite or negative definite.
Indefinite means `t₊ > 0` and `t₋ > 0`; this condition itself implies nondegeneracy only
when `t₀=0` is separately known.

**Positive definite, not definite.** Sets of bounded norm, minima, shells, reduction theory
and theta series are stated for positive definite lattices. For a negative definite form
the set `{x | β x x ≤ C}` is infinite, and the theta series diverges. A statement that is
invariant under `β ⇝ −β`, such as finiteness of the automorphism group, is proved for
positive definite lattices and then extended by that substitution.

**Form twists, carrier dilations, and sums.** `L.formTwist a`, also written `L(a)`, keeps
the carrier and replaces the form by `a • β`, so `E₈(−1)` is negative definite. This is
different from the scalar image `a • L.carrier` inside the rational ambient space. A
statement about a nondegenerate form twist assumes `a ≠ 0`; positive definiteness and theta
scaling assume `a > 0`. For nonzero integral `a`, the dual formula is the carrier identity
`dual_{aB}(L) = (a : ℚ)⁻¹ • dual_B(L)`, not a form twist on the old dual carrier. The
orthogonal direct sum `L ⊕ M` carries the sum of the two forms, and its Gram matrix is the
block sum. Isometry is `LinearMap.BilinForm.Equivalent`. A class is an isometry class over
`ℤ`.

**Rational ambient space and abstract inputs.** The ambient space `V` and its rational
form `B` are part of `IntegralLattice`; they are not reconstructed independently in each
layer. For an abstract integral form the dictionary uses `V = ℚ ⊗ L` and
`B = β.baseChange ℚ`. The quotient group used by both discriminant pairings and quadratic
forms is `ℚ/ℤ = AddCircle (1 : ℚ)`.

**Dual lattice.** The dual lattice is `L^⋆ = LinearMap.BilinForm.dualSubmodule B L`.
Integrality of `β` is the statement `L ≤ L^⋆`. The discriminant group is `A_L = L^⋆/L`.

**Discriminant forms.** The discriminant bilinear form is `b_L : A_L × A_L → ℚ/ℤ`,
`b_L(x̄,ȳ)=B(x,y) mod ℤ`. For even `L` the canonical discriminant quadratic form uses the
reviewed half-norm convention
`q_L : A_L → ℚ/ℤ`, `q_L(x̄)=B(x,x)/2 mod ℤ`, so its polar is literally `b_L`.
Nikulin's equivalent full-norm convention has values in `ℚ/2ℤ`; every cited value in that
convention is divided by two at the boundary. No quadratic discriminant form is attached
to an odd lattice.

**Finite modules.** A finite bilinear module carries a symmetric biadditive
`A × A → ℚ/ℤ`; a finite quadratic module extends it with a Mathlib
`QuadraticMap ℤ A (AddCircle (1 : ℚ))` whose polar is the pairing. Nondegeneracy is a
predicate asserting that the adjoint `A → CharacterModule A` is an additive equivalence,
not a structure field. For `H ≤ A`, isotropic means the form vanishes on `H`, while
Lagrangian means the stronger equality `H=H^⊥`. These reviewed carriers are also the
carriers used by the Nikulin programme; no `ℚ/2ℤ`-valued duplicate is introduced.

**Two invariants with different names.** The Gauss-sum invariant `sign q ∈ ℤ/8` of a
nondegenerate finite quadratic form is defined by
`∑_{a ∈ A} e^{2πi q(a)} = √#A · e^{2πi·sign(q)/8}`. The factor `2πi` is forced by the
half-norm codomain `ℚ/ℤ`; the factor `πi` belongs only to the full-norm `ℚ/2ℤ` convention.
It is a statement about finite quadratic
forms, and milestone 1H proves it. Milgram's theorem is the different statement that
`t₊ − t₋ ≡ sign q_L (mod 8)` for an even lattice, and milestone 1I proves it. The roadmap
does not use one name for both.

**Scale, norm ideal, level.** `𝔰(L)` is the ideal generated by the values `β x y`, and
`𝔫(L)` is the ideal generated by the values `β x x`. Then `2𝔰 ⊆ 𝔫 ⊆ 𝔰`, and `L` is even
exactly when `𝔫 ⊆ 2ℤ`. The level of a nondegenerate integral `L` is the least `N > 0` such
that `N·G⁻¹` is integral with even diagonal, for a Gram matrix `G`. For even `L` the level
is the least `N` with `N·q_L = 0`.

**Genus symbols.** The symbols are those of Conway–Sloane, SPLAG Chapter 15, in the
terminology of their mass formula paper. A symbol records the Jordan constituents at each
scale `p^i`, their ranks, and their signs `ε = (det f_q | p)`. At `p = 2` it also records
the type, which is I for odd and II for even, and the oddity, which is the trace mod 8.
Dyadic Jordan splittings are not unique, and the resulting moves on symbols are sign
walking and oddity fusion. The canonical 2-adic symbol is the corrected one of
Allcock–Gal–Mark, and not the one printed in SPLAG.

**Nikulin's notation.** `l(A)` is the least number of generators of a finite abelian group
`A`, and `l(A_q) = max_p l(A_{q_p})`. `K(q_p)` is a `p`-adic lattice of rank `l(A_{q_p})`
whose discriminant form is `q_p`, and `discr K(q_p)` is its determinant square class in
`ℤ_p^*/(ℤ_p^*)²`. The generating finite quadratic forms are `q_θ^{(p)}(p^k)` on `ℤ/p^k`,
and `u^{(2)}(2^k)` and `v^{(2)}(2^k)` on `(ℤ/2^k)²`. They are the discriminant forms of the
`p`-adic lattices with Gram matrices `(θ p^k)`, `2^k·!![0,1;1,0]` and `2^k·!![2,1;1,2]`.
Nikulin's `E₈` is negative definite, and this roadmap's `E₈` is positive definite, so a
citation from his paper carries the twist `E₈(−1)`. The K3 lattice is
`Λ_{K3} = U³ ⊕ E₈(−1)²`, which is even unimodular of signature `(3,19)`.

**Theta series.** For positive definite `L`, `Θ_L(τ) = ∑_{x ∈ L} exp(πiτ·β(x,x))` on the
upper half-plane. The nome is `q = e^{πiτ}`, which makes `Θ_ℤ` equal to Mathlib's
`jacobiTheta`. For even `L` the same series has nome `e^{2πiτ}` and exponents the
half-norms. In the transformation law `(τ/i)^{n/2}` means `Complex.cpow (τ/i) (n/2)` for the
principal branch. That branch is correct because `τ/i` has positive real part when `τ` is
in the upper half-plane. The determinant factor is the positive real square root
`Real.sqrt (det L)`, which exists because a positive definite lattice has `det L > 0`.

**Mass.** For a genus `G` of positive definite lattices, the full mass is
`m(G) = ∑_{cls L ∈ G} 1/|O(L)|`, and the proper mass is
`m⁺(G) = ∑_{cls⁺ L ∈ G} 1/|SO(L)|`. The normalization is that of Conway–Sloane, equation
(1) of their mass formula paper. Their sections 3 and 6 record that the formula, as usually
stated, is false in dimension at most 1, where a factor 2 becomes 1. The low rank values
are part of the statement of milestone 7H, and 7G proves them here independently of it.

## What Mathlib supplies

Each row is consumed by the milestones in the last column.

| Declarations | File | Consumed by |
| --- | --- | --- |
| `QuadraticMap`, `exists_companion'`, `polar`, `polarBilin`, `ofPolar`, `LinearMap.BilinMap.toQuadraticMap`, `polar_self`, `two_nsmul_associated`, `QuadraticMap.PosDef`, `Matrix.toQuadraticForm'` | `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean` | 0A, 0B, 0E, 2A |
| `IsSymm`, `IsRefl`, `Nondegenerate`, `restrict`, `flip`, `Isometry`, `IsometryEquiv`, `Equivalent` | `Mathlib/LinearAlgebra/BilinearForm/` | 0A, 0G, 2G |
| `LinearMap.BilinForm.toMatrix`, `Matrix.toBilin`, `toMatrix_apply`, `toMatrix_mul_basis_toMatrix`, `nondegenerate_iff_det_ne_zero` | `Mathlib/LinearAlgebra/Matrix/BilinearForm.lean` | 0A, 0C |
| `LinearMap.BilinForm.baseChange`, `baseChange_tmul`, `IsSymm.baseChange` | `Mathlib/LinearAlgebra/BilinearForm/TensorProduct.lean` | 0E, 1A, 3A |
| `dualSubmodule`, `dualSubmodule_span_of_basis`, `dualSubmodule_dualSubmodule_of_basis`, `dualSubmoduleToDual` | `Mathlib/LinearAlgebra/BilinearForm/DualLattice.lean` | 1B, 1C |
| `Submodule.basisOfPid`, `Module.Basis.SmithNormalForm`, `Submodule.smithNormalFormOfRankEq` | `Mathlib/LinearAlgebra/FreeModule/PID.lean` | 1C, 4F |
| `Submodule.natAbs_det_basis_change`, `AddSubgroup.index_eq_natAbs_det`, `AddSubgroup.relIndex_eq_natAbs_det`, `AddSubgroup.relIndex_eq_abs_det` | `Mathlib/LinearAlgebra/FreeModule/Finite/CardQuotient.lean` | 0C, 1C |
| `Submodule.quotientEquivPiZMod` | `Mathlib/LinearAlgebra/FreeModule/Finite/Quotient.lean` | 1C |
| `AddCommGroup.equiv_directSum_zmod_of_finite`, character duality | `Mathlib/GroupTheory/FiniteAbelian/Basic.lean`, `Duality.lean` | 1C, 1G |
| `AddCircle`, `AddCircle.equivAddCircle`, `equivAddCircle_apply_mk` | `Mathlib/Topology/Instances/AddCircle/Defs.lean` | 1D, 1G |
| `IsOrtho`, `iIsOrtho`, `orthogonal`, `nondegenerate_restrict_of_disjoint_orthogonal` | `Mathlib/LinearAlgebra/BilinearForm/Orthogonal.lean` | 0F, 3B |
| `IsZLattice`, `ZLattice.rank`, fundamental domains | `Mathlib/Algebra/Module/ZLattice/Basic.lean` | 2A, 2D, 8A |
| `ZLattice.covolume`, `covolume_eq_det`, `covolume_div_covolume_eq_relIndex`, `tendsto_card_div_pow` | `Mathlib/Algebra/Module/ZLattice/Covolume.lean` | 2D, 2E, 8D |
| norm-power summability over a lattice | `Mathlib/Algebra/Module/ZLattice/Summable.lean` | 8B |
| `exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure` | `Mathlib/MeasureTheory/Group/GeometryOfNumbers.lean` | 2E |
| `sigPos`, `sigNeg`, `sigPos_add_sigNeg_add_radical`, `QuadraticForm.sigPos_of_equiv_weightedSumSquares`, `isometryEquivSignWeightedSumSquares` | `Mathlib/LinearAlgebra/QuadraticForm/Signature.lean`, `Real.lean` | 0E |
| `CartanMatrix.A`, `CartanMatrix.D`, `CartanMatrix.E₆`, `CartanMatrix.E₇`, `CartanMatrix.E₈` | `Mathlib/LinearAlgebra/Matrix/Cartan.lean` | 0G, 6C |
| `jacobiTheta`, `jacobiTheta_two_add`, `jacobiTheta_S_smul` | `Mathlib/NumberTheory/ModularForms/JacobiTheta/OneVariable.lean` | 8C |
| `Complex.tsum_exp_neg_quadratic`, `Real.tsum_eq_tsum_fourier` | `Mathlib/Analysis/SpecialFunctions/Gaussian/PoissonSummation.lean`, `Mathlib/Analysis/Fourier/PoissonSummation.lean` | 8B |
| `Matrix.PosDef`, `Matrix.PosSemidef`, congruence invariance | `Mathlib/LinearAlgebra/Matrix/PosDef.lean` | 0E |
| `ℤ_[p]`, `ℚ_[p]`, Hensel's lemma, `PadicInt.unitCoeff` | `Mathlib/NumberTheory/Padics/` | 3A |
| Gauss sums and quadratic characters | `Mathlib/NumberTheory/LegendreSymbol/GaussSum.lean` | 1H |

Two limits of the Mathlib API shape this roadmap. The eigenvalue and determinant
characterizations of `Matrix.PosDef` require `RCLike`, so milestone 0E builds the transfer
from `ℤ` to `ℝ` itself. The splitting results in `BilinearForm/Orthogonal.lean` are stated
over a field, so milestone 0F proves the correct statement over `ℤ`, where the hypothesis
is unimodularity and not nondegeneracy.

## What Tau Ceti supplies

| Declarations | Location | Consumed by |
| --- | --- | --- |
| `squareClass`, `squareClass_eq_zero_iff`, `linearIndependent_squareClass_iff` | `TauCeti/FieldTheory/SquareClassGroup.lean` | 3C, 4C |
| `orthogonalGroupToLinearIsometryEquiv` | `TauCeti/LinearAlgebra/OrthogonalGroup.lean` | 2C |
| box packing and doubling counts | `TauCeti/NumberTheory/GeometryOfNumbers/Doubling.lean` | 2E, 2G |

## What other roadmaps supply

Each row fixes an owner and, where one exists, the exact Lean declaration consumed. A
README-only supplier milestone stays a milestone here; `Suggested.lean` does not fabricate a
structure or carrier for it.

| Consumer milestones | Supplier | Exact declaration or milestone | Contract |
| --- | --- | --- | --- |
| 0C, 3H | Quadratic Form Invariants | `hasseInvariant`, `hilbertSymbol`, `localHasse`, `exists_of_realization`; Layer 6D classification | field and nonarchimedean local invariants, including the dyadic classification |
| 3G | Quadratic Form Invariants | `hilbertSymbol_eq_cohomological`, `hilbertSymbol_productFormula` | the norm-equation symbol agrees with CFT's pairing and inherits Hilbert reciprocity |
| 3H, 4A | Global Quadratic Forms | `atFinitePlace`, `atRealPlace`, `hasseMinkowski_equivalent`, `equivalent_of_locallyEquivalent` | localization and global equivalence of the underlying rational quadratic spaces |
| B1--B5, `¬ IsSquare Δ` | Global Number Fields | `NumberFieldOrder`, `NumberFieldOrder.conductor`, `NumberFieldOrder.IsProperFractionalIdeal`, `NumberFieldOrder.properFractionalIdeals`, `NumberFieldOrder.invertibleProperFractionalIdeals`, `NumberFieldOrder.invertible_isProper`, `NumberFieldOrder.isProper_iff_isUnit_of_finrank_eq_two`, `IdealClassMonoid`, `NumberFieldOrder.mkIdealClassMonoid`, `picEquivUnitsIdealClassMonoid`, `Pic`, `NumberFieldOrder.mkPic`, `NumberFieldOrder.mkPic_surjective`, `NarrowPic`, `NumberFieldOrder.narrowPrincipal`, `NumberFieldOrder.narrowToPic`, `NumberFieldOrder.narrowToPic_surjective`, `finite_pic`, `finite_narrowPic` | field orders and their ideal-class monoids and wide and narrow Picard groups; only the invertible proper carrier enters `Pic` and `NarrowPic`, while raw noninvertible proper ideals remain in `IdealClassMonoid`; the square-discriminant split branch is elementary and does not use these carriers |
| B3, `Δ < 0` | Class Field Theory | Layer 6, ring class fields and `Gal(H_O/K) ≃ Pic O` | the class-field interpretation in the nonsplit field case only; there is no split ring-class-field claim |
| 3G | Class Field Theory | `hilbertProductFormula` | cohomological Hilbert reciprocity, reached on classical symbols through QFI's comparison |
| 4B | Adelic Algebraic Groups | `FiniteAdelicPoints`, `AdelicPoints`, `rationalDiagonal` | generic restricted products and rational diagonals. ⚠ Quotient measures and Tamagawa normalization are **not** exported by #246 and are not cited here; they belong to `TamagawaMeasures` and reach the lattice mass only through `OrthogonalTamagawaAndLatticeMass` |
| 4B, 4C, 4F, B7 | Orthogonal and Spin Groups | `orthogonalGroup`, `orthogonalBaseChange`, `orthogonalBaseChangeReal`, `spinorNorm`, `spinorNorm_reflection`, `OrthogonalCompactOpens`, `finiteAdelicOrthogonal`, `transvection`, `transvectionLiftHom` | orthogonal/spin-specific algebra, local spinor norms, and the finite-adelic point groups. ⚠ `strongApproximation_finiteAdelicSpin` and the orthogonal volume theorem are **not** #255 exports and are no longer cited; #255's README states that only `OrthogonalTamagawaAndLatticeMass` may export them |
| 8D--8E | L-functions | Layer 1 Poisson summation, analytic dual/covolume identities, and Gaussian theta transformation; `FEPairWithLevel` for the resulting real-parameter functional equation | analytic Gaussian transformation only; the arithmetic upper-half-plane theta remains here |
| 6C, 6G | Root Systems | Layer 5 ADE classification and `Nat.card P.weylGroup` | the rank-eight root system with the `E8` Cartan matrix is of type `E8` |

The dependency on `LFunctions` is strictly one-way:

```text
LFunctions -> IntegralLattices.
```

L-functions owns Poisson summation and the Gaussian real-parameter identity. Integral
Lattices identifies the analytic dual with its arithmetic dual lattice, rewrites covolume by
the Gram determinant, and owns the holomorphic theta and its arithmetic consequences. No
L-functions milestone imports a lattice-side theorem.

---

## The build, in layers

### Layer 0: lattices, the dictionary, and the first invariants

**0A. The lattice and its predicates.** The object is `IntegralLattice`, as fixed in the
conventions, with a genuine `[carrier.IsLattice ℚ]` instance. This milestone asks for:

- the predicates `IsEven`, `IsNondegenerate`, `IsUnimodular`, and `PosDef`, with
  `IsUnimodular` defined by `L = L^⋆`; determinant and quotient-cardinality criteria are
  equivalence theorems, not alternate definitions;
- the orthogonal direct sum, the twist `L(a)`, and isometry;
- the determinant of a direct sum is the product of the determinants, and the determinant
  of `L(a)` is `aⁿ det L`;
- the rank is additive over direct sums;
- two restriction constructors: a submodule of full rational span gives an
  `IntegralLattice` in the same `V`, while an arbitrary finite-free submodule gives one in
  its own ambient space `ℚ ⊗[ℤ] M`. Prove that the constructions agree up to the canonical
  isometry when `M` is full. An arbitrary submodule is not silently treated as full.

An isometry is a rational linear equivalence preserving both carrier and form. Every
invariance theorem requires this structure; a bare additive or module equivalence is an
explicit rejection test.

For `a : ℤ`, `formTwist a` remains integral, and an even form remains even. Its rank-`n`
Gram determinant is `aⁿ det L`; the converse parity implication needs the expected unit or
coprimality hypothesis. Nondegeneracy needs `a ≠ 0`, and positive definiteness and the theta
scaling law need `a > 0`. Discriminant groups and forms under a nonunit twist are related by
the induced inclusions and quotients; they are not claimed to be unchanged.

**0B. The even and quadratic dictionary.** An even symmetric `β` is the polar form of a
unique `Q : QuadraticForm ℤ L`. The polar form of any `Q` is symmetric and even, and
satisfies `Q.polarBilin x x = 2 * Q x`. Both round trips are proved. The dictionary is
transported to Gram matrices, where evenness is an even diagonal, and to direct sums and
twists.

**0C. Gram matrices and the determinant.** The Gram matrix of a basis, and equality of
Gram determinants under a change of basis. Then `det L : ℤ` is an invariant of the lattice.
Its behavior under direct sums and twists is proved. For a sublattice `L' ≤ L` of finite
index, `det L' = [L : L']² · det L`.

The comparison with the square-class invariants of the rational form is also proved:
`d(β ⊗ ℚ) = [det L]` and `d±(β ⊗ ℚ) = (−1)^{n(n−1)/2}·[det L]`.

**0D. Scale, norm ideal and level.** The ideals `𝔰(L)` and `𝔫(L)`, the inclusions
`2𝔰 ⊆ 𝔫 ⊆ 𝔰`, and the characterization of evenness by `𝔫 ⊆ 2ℤ`. The level of a
nondegenerate integral lattice, and its independence of the chosen basis.

**0E. Radical, definiteness, and signature.** Define the radical as `LinearMap.ker B` and
the signature triple `(t₊,t₀,t₋)`. Prove it sums to the rank, is invariant under isometry,
and characterizes positive/negative (semi)definiteness, degeneracy, and indefiniteness.
Nondegeneracy is equivalent to radical `⊥`, to `t₀=0`, and to nonzero Gram determinant.
`PosDef` over `ℤ` is equivalent to `PosDef` of the rational and real forms and to
`Matrix.PosDef` of the real Gram matrix. Construct the carrier image in the quotient by
the radical, prove it is a full integral nondegenerate lattice, transports evenness, and
has signature `(t₊,0,t₋)`. This is the only route from a degenerate affine Cartan lattice
to the later nondegenerate layers.

**0F. Unimodular orthogonal splitting.** If `M ≤ L` and the restriction of `β` to `M` is
unimodular, then `L = M ⊕ M^⊥`. Over `ℤ` the correct hypothesis is unimodularity, not
nondegeneracy. A vector of norm `±1` therefore splits off a summand `⟨±1⟩`. Cancellation
over `ℤ` is false, and the failure is stated with the counterexample given in the table of
hard theorems.

**0G. The standard and degeneracy examples.** The examples are `⟨a⟩`, `Iₙ`, the
hyperbolic plane `U` with Gram matrix `!![0,1;1,0]`, and the root lattices `Aₙ`, `Dₙ`,
`E₆`, `E₇` and `E₈`. For each one the milestone asks for rank, signed determinant,
nonnegative discriminant, parity, signature, and level. The Cartan matrices are the Gram
matrices of the root lattices. The coordinate models
`Aₙ={x∈ℤ^{n+1} | ∑x=0}` and `Dₙ={x∈ℤⁿ | ∑x even}` are constructed, and isometries with
the Gram models are proved. Three reviewed rejection tests are mandatory: `U` is even,
unimodular, and indefinite of signature `(1,0,1)`; `⟨-2⟩` is negative definite of
signature `(0,0,1)`; and affine `Ã₁` with Gram `!![2,-2;-2,2]` is even,
positive-semidefinite, degenerate of signature `(1,1,0)`, with radical quotient isometric
to `A₁=⟨2⟩`.

| Milestone | Direct prerequisites |
| --- | --- |
| 0A | M `LinearMap.BilinForm.IsSymm`, `Nondegenerate`, `nondegenerate_iff_det_ne_zero`, `QuadraticMap.PosDef` |
| 0B | M `polarBilin`, `exists_companion'`, `polar_self`, `two_nsmul_associated`; L 0A |
| 0C | M `BilinForm.toMatrix`, `toMatrix_mul_basis_toMatrix`, `Submodule.natAbs_det_basis_change`; L 0A; R Quadratic Form Invariants Layer 3 |
| 0D | L 0A, 0C |
| 0E | M `sigPos`, `sigNeg`, `sigPos_add_sigNeg_add_radical`, `Matrix.PosDef`, `LinearMap.BilinForm.baseChange`; L 0A, 0C |
| 0F | M `IsOrtho`, `orthogonal`, `nondegenerate_restrict_of_disjoint_orthogonal`; L 0A, 0C |
| 0G | M `CartanMatrix.A`, `CartanMatrix.D`, `CartanMatrix.E₆`, `CartanMatrix.E₇`, `CartanMatrix.E₈`; L 0A to 0F |

### Layer 1: dual lattices, discriminant groups, and finite quadratic forms

**1A. The abstract-form dictionary.** Starting from an abstract finite free `ℤ`-module
with symmetric integral `β`, construct the canonical `IntegralLattice` in
`V=ℚ⊗L` with `B=β.baseChange ℚ`. Conversely restrict the rational form of an
`IntegralLattice` to its carrier. Prove both round trips up to the reviewed isometry type
and transport every Layer-0 invariant. This is a dictionary around the one embedded
carrier, not a second public lattice structure. Integrality is `L ≤ L^⋆`.

**1B. The dual lattice.** `L^⋆ = B.dualSubmodule L`, with `L^{⋆⋆} = L` for symmetric
nondegenerate `B`. Duality reverses inclusions. For nonzero `a : ℤ`, twisting the form gives
the carrier identity `dual_{aB}(L) = (a : ℚ)⁻¹ • dual_B(L)` inside `V`; the right side is
scalar dilation of a submodule, not the form twist `L^⋆(a⁻¹)`. The Gram matrix of the dual
basis is `G⁻¹`, and `det L^⋆ = (det L)⁻¹` in `ℚ`. A
lattice is unimodular exactly when `L = L^⋆`. Prove the load-bearing statements that the
dual is a full lattice exactly when `B` is nondegenerate and that
`dualSubmoduleToDual : L^⋆ ≃ Module.Dual ℤ L` is an equivalence. Establish double duality
first with `B.flip`, then specialize using symmetry.

**1C. The discriminant group.** `A_L` is the actual quotient of the subtype `L^⋆` by the
inverse image of `L`, with quotient map, representatives, zero criterion, and isometry
functoriality. It is finite exactly when `L` is nondegenerate; in that case it has order
`|det L|`, and
`l(A_L) ≤ rank L`. Its invariant factors come from `Submodule.quotientEquivPiZMod`. The
pairing `A_L × A_L → ℚ/ℤ` is perfect. Mathlib states finite abelian duality for
homomorphisms into `Mˣ`, so the comparison with the `ℚ/ℤ`-valued dual is part of this
milestone. This discharges the two open requests in
`Mathlib/LinearAlgebra/BilinearForm/DualLattice.lean`.

**1D. The discriminant forms.** `b_L` for a nondegenerate integral lattice, and the
half-norm `q_L : A_L → ℚ/ℤ` for an even lattice. The polar of `q_L` is exactly `b_L`.
Canonical isometries
`A_{L⊕M} ≅ A_L ⊕ A_M` carrying `q_{L⊕M}` to `q_L ⊕ q_M`, and `A_{L(−1)} ≅ A_L` carrying
`q_{L(−1)}` to `−q_L`. These are isometries of finite quadratic forms, and not equalities
of types.

**1E. Integral overlattices.** Let `L` be nondegenerate and integral, and let `M ⊇ L` have
finite index. Then `M/L ≤ A_L`, and `M` is integral exactly when `b_L` vanishes on `M/L`.
This gives a bijection between integral overlattices and subgroups `H ≤ A_L` with
`b_L|_{H×H} = 0`. For such an `H`, `A_M ≅ H^⊥/H` with the induced form, and
`det M = det L / [M : L]²`. Construct this as an order isomorphism between intermediate
submodules and subgroups, not merely an existence theorem.

**1F. Even overlattices.** Let `L` be even. Then an overlattice `M` of finite index is even
exactly when `q_L` vanishes on `M/L`. This gives a bijection between even overlattices and
subgroups `H` with `q_L|_H = 0`, and `A_M ≅ H^⊥/H` carries the induced `q_M`. Isotropy for
`q_L` implies isotropy for `b_L`, so the even correspondence is a restriction of the
integral one. The two are different: milestone 1F is the one Layer 5 uses, and the smallest
lattice where they differ is `A₁ ⊕ A₁`. Prove that the glued lattice is unimodular exactly
when `H` is Lagrangian (`H=H^⊥`), and that its discriminant form is the orthogonal quotient
`H^⊥/H`.

**1G. Finite bilinear and quadratic modules.** Use the reviewed `FiniteBilinearModule` and
`FiniteQuadraticModule` carriers from the conventions. Nondegeneracy is bijectivity of the
adjoint `A → CharacterModule A`. Define `H^⊥`, isotropic and Lagrangian subgroups, and prove
`#H·#H^⊥=#A` for a nondegenerate module. Define the orthogonal quotient `H^⊥/H`, prove its
induced form nondegenerate, and then add:

- orthogonal sums, and the `p`-primary decomposition `q = ⊕_p q_p`;
- isometries, and the group `O(q)`;
- the generators `q_θ^{(p)}(p^k)`, `u^{(2)}(2^k)` and `v^{(2)}(2^k)` of Nikulin
  Proposition 1.8.1, with the theorem that every **nondegenerate** finite quadratic form
  is an orthogonal sum of them;
- the relations among the generators for nondegenerate forms, which are Nikulin
  Proposition 1.8.2.

Without the relations the list of generators is not a classification. Layers 3 and 5 need
the classification. The broad carrier still permits degenerate restrictions to subgroups;
nondegeneracy is an explicit hypothesis before the generator classification, its relations,
the Gauss-sum invariant, or the comparison theorem is invoked.

**1H. The Gauss-sum invariant.** For nondegenerate `(A,q)` in the canonical half-norm
convention,
`∑_{a ∈ A} e^{2πi q(a)} = √#A · e^{2πi·sign(q)/8}`, which defines `sign q ∈ ℤ/8`. The
invariant is additive over orthogonal sums. Its values on the generators are those of
Nikulin Proposition 1.11.2:

- `sign q_θ^{(p)}(p^k) ≡ k²(1−p) + 4kη (mod 8)` for odd `p`, where `(θ|p) = (−1)^η`;
- `sign q_θ^{(2)}(2^k) ≡ θ + 4kω(θ) (mod 8)`, where `ω(θ) ≡ (θ²−1)/8 (mod 2)`;
- `sign v^{(2)}(2^k) ≡ 4k (mod 8)`;
- `sign u^{(2)}(2^k) ≡ 0 (mod 8)`.

Nikulin Theorem 1.11.3 is proved with them: two **nondegenerate** finite quadratic forms
with isometric bilinear forms are isometric exactly when their invariants agree mod 8.

**1I. Milgram's theorem.** For an even nondegenerate lattice, `t₊ − t₋ ≡ sign q_L (mod 8)`.
An even unimodular lattice has `A_L = 0`, so `8 ∣ t₊ − t₋`.

**1J. Level.** For an even lattice the level is the exponent of the annihilator of `q_L`,
and it agrees with the definition through `N·G⁻¹`. The level divides `2·det L`, with the
divisibility calculus that follows.

**1K. Reviewed rank-one, ADE, and gluing acceptance suite.** These are calculations in the
actual dual quotient, not table lookups. For `⟨2m⟩`, `m≠0`, prove
`L^⋆=(1/(2m))ℤ`, `A_L≃ℤ/(2m)`, `#A_L=|2m|`, and on its generator
`b(g,g)=1/(2m)`, `q(g)=1/(4m)` in `ℚ/ℤ`; verify the polar identity directly and both signs
of `m`. The excluded zero form is the degenerate signature `(0,1,0)` example and has no
finite discriminant group.

Construct the positive ADE lattices from Tau Ceti's Bourbaki-numbered root data and verify
the full finite quadratic modules below. Representatives, exhaustion of the quotient, all
pairings needed for isometry, and nondegeneracy are required; group order alone is not.

| lattice | discriminant group | checked half-norm values in `ℚ/ℤ` |
| --- | --- | --- |
| `A_n`, `n≥1` | `ℤ/(n+1)` | the first fundamental weight generates, `q=n/(2(n+1))` |
| `D_n`, odd `n≥5` | `ℤ/4` | a spinor class generates, `q(s)=n/8`; `v=2s`, `q(v)=1/2` |
| `D_n`, even `n≥4` | `(ℤ/2)²` | vector and spinor classes exhaust; `q(v)=1/2`, `q(s)=q(c)=n/8` |
| `E₆` | `ℤ/3` | a minuscule-weight class generates, `q=2/3` |
| `E₇` | `ℤ/2` | the minuscule-weight class generates, `q=3/4` |
| `E₈` | trivial | self-dual and the quadratic module is trivial |

Finally carry out the reviewed `D₈→E₈` route. With
`D₈={x∈ℤ⁸ | ∑x_i even}` and `s=(1/2)∑e_i`, the class of `s` generates an order-two
quadratic-isotropic subgroup `H≤A_{D₈}` because `q(s)=8/8=0`. Identify its preimage as
`D₈⁺=D₈∪(s+D₈)`, prove `H=H^⊥`, and obtain evenness and unimodularity from the general
gluing theorem. Construct an explicit basis or rational isometry whose Gram matrix is the
positive `E₈` Cartan matrix, yielding an actual isometry `D₈⁺≅E₈`; determinant one alone is
not an acceptable argument. Check `A_{D₈⁺}≅H^⊥/H=0` against the direct `E₈` calculation.

| Milestone | Direct prerequisites |
| --- | --- |
| 1A | M `LinearMap.BilinForm.baseChange`, `IsSymm.baseChange`; L 0A, 0C |
| 1B | M `dualSubmodule`, `dualSubmodule_span_of_basis`, `dualSubmodule_dualSubmodule_of_basis`; L 1A |
| 1C | M `AddSubgroup.relIndex_eq_abs_det`, `Submodule.quotientEquivPiZMod`, `AddCommGroup.equiv_directSum_zmod_of_finite`, `Mathlib/GroupTheory/FiniteAbelian/Duality.lean`; L 1B |
| 1D | M `AddCircle`, `AddCircle.equivAddCircle`; L 1C |
| 1E | L 1C, 1D |
| 1F | L 1E |
| 1G | M `AddCircle`, `AddCommGroup.equiv_directSum_zmod_of_finite`; L 1D |
| 1H | M Gauss sums and quadratic characters; L 1G |
| 1I | L 0E, 1D, 1H |
| 1J | L 0D, 1D |
| 1K | T Root Systems Layer 5 ADE bridge; L 0G, 1B to 1G |

### Layer 2: positive definite lattices, reduction, and automorphisms

Every statement in this layer assumes that `L` is positive definite, unless it says
otherwise. The negative definite case follows by replacing `β` with `−β`.

**2A. Sets of bounded norm are finite.** For positive definite `L` and any `C`, the set
`{x | β x x ≤ C}` is finite. Two proofs are acceptable: realization in `ℝⁿ` with
`ZLattice` discreteness, or an elementary bound from the Gram matrix.

**2B. Minimum, shells, kissing number.** `min L` is the least value of `β x x` over nonzero
`x`, and it is defined when `rank L ≥ 1`. The shell `S_k(L) = {x | β x x = k}` is defined
for every rank. In rank 0, `S_0 = {0}` and every other shell is empty. The kissing number
is `#S_{min L}(L)`, and `r_L(k) = #S_k(L)` are the theta coefficients of Layer 8.

**2C. Automorphism groups.** `O(L)` is the group of isometries of `L`, and `SO(L)` is its
subgroup of elements of determinant 1. For definite `L`, `O(L)` is finite. Also
`O(L) × O(M) ≤ O(L ⊕ M)`, with the obstruction to equality identified. Definiteness is
needed: 4F gives an infinite `O(L)` for every indefinite lattice of rank at least 3, and B4
settles rank 2, where `O(L)` is infinite exactly when the norm form is anisotropic.

**2D. Covolume.** For a positive definite lattice realized in Euclidean space,
`covolume(L)² = det L`. This is where the square root in the theta transformation is fixed.

**2E. Minkowski and Hermite bounds.** Both statements assume `rank L = n ≥ 1`, because `min L`
is defined only there. Minkowski's bound is `min L ≤ c_n (det L)^{1/n}`, with `c_n` the
explicit constant from the convex body theorem. Hermite's inequality is
`min L ≤ (4/3)^{(n−1)/2} (det L)^{1/n}`, with that constant. `A₂` attains equality in rank 2.

**2F. Successive minima.** For positive definite `L` of rank `n ≥ 1` and `1 ≤ i ≤ n`, the
`i`-th successive minimum is

    λ_i(L) = min {c : the set {x ∈ L : β x x ≤ c} spans a subgroup of rank at least i},

so `λ_i` is a value of the form `β x x`, and not a length. This milestone asks for: the
minimum exists, and `λ₁(L) = min L`; the sequence is nondecreasing; vectors `x₁, …, xₙ`
with `β x_i x_i = λ_i(L)` and `x₁, …, xₙ` linearly independent exist; and Minkowski's second
theorem `∏_i λ_i(L) ≤ γ_n^n det L` with the explicit constant. Vectors attaining the
successive minima need not form a `ℤ`-basis, and this roadmap does not claim that they do.
Milestone 2G produces the basis it needs by reduction, not from 2F.

**2G. Reduction and finiteness of classes.** Minkowski-reduced bases exist. A reduced Gram
matrix of given rank and determinant has entries bounded explicitly in terms of the rank
and the determinant. There are therefore finitely many isometry classes of positive
definite lattices of a given rank and determinant. This is the positive definite case of
class-number finiteness, and it is what the enumeration in the LMFDB rests on.

| Milestone | Direct prerequisites |
| --- | --- |
| 2A | M `IsZLattice`, `Matrix.PosDef`; L 0E |
| 2B | L 2A |
| 2C | M `IsZLattice`; T `orthogonalGroupToLinearIsometryEquiv`; L 2A |
| 2D | M `ZLattice.covolume`, `covolume_eq_det`; L 0C, 0E |
| 2E | M `exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure`, `ZLattice.covolume`; T doubling counts; L 2B, 2D |
| 2F | M `exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure`; L 2B, 2E |
| 2G | T doubling counts; L 2E, 2F |

### Layer 3: localization, Jordan splittings, and the genus

**3A. The embedded-to-local bridge.** First restrict the accepted rational form to an
actual integral form
`L.integralForm : LinearMap.BilinForm ℤ L.carrier`, characterized by
`((L.integralForm x y : ℤ) : ℚ) = L.form x y`. Then form the integral localization

```text
L_p = ℤ_p ⊗[ℤ] L.carrier,
B_{L,p} = L.integralForm.baseChange ℤ_p.
```

Independently form the completed rational quadratic space

```text
V_p = ℚ_p ⊗[ℚ] V,
B_{V,p} = L.form.baseChange ℚ_p.
```

Construct the canonical `ℤ_p`-linear map `L_p → V_p`, prove it injective and full after
extension to `ℚ_p`, and prove that `B_{L,p}` is the restriction of `B_{V,p}`. Prove
compatibility with direct sums, form twists, carrier dilations, duality, and isometries.
The integral `ℤ_p`-lattice carries scale, norm, Jordan, and integral-duality data; the
rational `ℚ_p`-space carries dimension, determinant square class, Hasse invariant, and
Witt data. No statement silently passes between these two objects. The construction works
at `p = 2` as well: bilinear-form base change needs no inverse of 2. The splitting result
0F holds over `ℤ_p`, and it is stronger there: a unimodular summand of maximal scale
splits off.

**3B. Jordan splittings exist.** Every nondegenerate `ℤ_p`-lattice is an orthogonal sum
`⊕_i p^i L_i` with each `L_i` unimodular.

**3C. Odd `p`.** A unimodular `ℤ_p`-lattice with `p` odd is diagonalizable. The rank and
the square class of the unit determinant classify such lattices. There are therefore
exactly two of each positive rank, and one of rank 0. The Jordan invariants are unique, and
two lattices are isometric exactly when their Jordan data agree.

**3D. The dyadic case.** Over `ℤ_2` an orthogonal basis need not exist: the hyperbolic
plane `U` is not diagonalizable. Jordan splittings are not unique. The invariants are the
type of each constituent, the norm group, and the weight. The order of work is: the
unimodular classification first, then the general dyadic classification.

**3E. Conway–Sloane 2-adic symbols.** The symbol of a dyadic lattice, with the scale, rank,
sign, type and oddity of each constituent, and with compartments and trains. The theorem is
that two symbols describe isometric lattices exactly when sign walking and oddity fusion
relate them. The canonical form is the corrected one of Allcock–Gal–Mark.

**3F. The genus.** `gen L = gen M` when `L_p ≅ M_p` for every `p` and the real signatures
agree. Only the primes dividing `2 det L` matter: at every other `p` both localizations are
unimodular of the same rank and determinant square class, so 3C makes them isometric. The
genus is therefore decided by the finite family of local isometry classes at `p ∣ 2 det L`
together with the signature, and 3G turns that family into a finite symbol.

**3G. Genus symbols and their constraints.** The genus symbol is the family of `p`-adic
symbols for `p ∣ 2·det L`, and it determines the genus. Its well-formedness conditions are
the compatibilities of rank, determinant and oddity, together with the oddity formula and
the sign product conditions. Those two are proved from the Hilbert product formula. The
resulting conditions on symbols are decidable.

**3H. The rational form of a genus.** Two lattices in one genus have equivalent forms over
`ℚ` and over every `ℚ_p`, in the invariants `(rank, d±, s_p, signature)`. Conversely,
rational equivalence together with the integral local data gives membership in one genus.

| Milestone | Direct prerequisites |
| --- | --- |
| 3A | M `LinearMap.BilinForm.baseChange`, `TensorProduct`, `ℤ_[p]`, `ℚ_[p]`; L 0A, 1A, 1B |
| 3B | M `IsOrtho`, `iIsOrtho`; L 3A |
| 3C | M `PadicInt.unitCoeff`; T `squareClass`; L 3B |
| 3D | L 3B |
| 3E | L 3D |
| 3F | L 0E, 3C, 3D |
| 3G | L 3E, 3F; R Class Field Theory `hilbertProductFormula`; R Quadratic Form Invariants `hilbertSymbol_eq_cohomological`, `hilbertSymbol_productFormula` |
| 3H | L 3F; R Quadratic Form Invariants Layers 1, 3 and 6; R Global Quadratic Forms `hasseMinkowski_equivalent`, `equivalent_of_locallyEquivalent` |

### Layer B: binary lattices and quadratic orders

Rank 2 is the exception in four places: 2C and 4F for automorphism groups, 4E for class
numbers, and 7G for the mass. Its theory is the arithmetic of quadratic orders, and it is
not the theory the other ranks use. This layer builds it, and its inputs are Layers 0 to 3
only; in particular B8 proves the rank-2 passage from the proper mass to the full mass
here, rather than waiting for 7A. Mathlib has `Zsqrtd` and Pell's equation, and it has no
theory of non-maximal quadratic orders or of binary form classes.

⚠ **The field-order and class-group branch is consumed, not built.** Global Number Fields
Layer 11 owns orders in number fields, conductors, raw proper fractional ideals, the group of
invertible proper fractional ideals, the separate ideal class monoid, `Pic`, and `NarrowPic`.
Class Field Theory Layer 6 owns ring class fields and their Artin isomorphisms.
Those interfaces apply only when `Δ` is nonsquare. If `Δ` is square, the quadratic algebra
splits and this layer uses a separate elementary product-order route; it does not instantiate
`NumberFieldOrder`, `Pic`, `NarrowPic`, or a ring class field. This layer owns the
**binary** side in both branches: the norm form, content and discriminant, form classes,
composition, automorphism groups, and the rank-2 mass.

**B1. The order of a binary lattice, with an explicit field/split branch.** Let `L` be
nondegenerate of rank 2, with Gram matrix
`!![A, B; B, C]` in a basis. Its norm form is `N_L(x, y) = A x² + 2B x y + C y²`, an integral
binary quadratic form with even middle coefficient and discriminant
`disc N_L = 4B² − 4AC = −4 det L`. Write `N_L = c·f` with `c > 0` the content and `f`
primitive. Then `Δ(L) := disc f` satisfies `Δ ≡ 0` or `1 (mod 4)`, is negative for definite
`L`, and is positive for indefinite `L`. The quadratic étale algebra is
`A_Δ = ℚ[t]/(t² − Δ)` and the order is `𝒪(L) = ℤ[(Δ + √Δ)/2] ⊆ A_Δ`, of discriminant
`Δ`. The milestone also fixes an orientation of `L` and proves that `c`, `f` and `Δ` do not
depend on the chosen basis.

For a full finite-index sublattice `M ≤ L`, restriction gives
`𝔰(M) ⊆ 𝔰(L)` and `𝔫(M) ⊆ 𝔫(L)`, a basis matrix `P` sends the Gram matrix to
`Pᵀ G P`, and `det M = [L:M]² det L`. The content of the binary norm form has no formula
depending only on `[L:M]`: restricting `x²+y²` to
`M = ⟨2e₁,e₂⟩ ≤ ℤ²` gives `4x²+y²`, still of content 1. By contrast, the separate form
twist by `a : ℤ` multiplies content by `|a|`.

If `¬ IsSquare Δ`, then `A_Δ` is the quadratic number field `K_Δ`; the construction returns
the supplier's actual `NumberFieldOrder K_Δ` and identifies its `conductor` with `f_Δ`.
If `IsSquare Δ`, then `A_Δ ≃ ℚ × ℚ`; the order is handled as an explicit product order
inside that algebra, with its unit and ideal arithmetic proved directly. In particular,
`Δ = 1` gives `𝒪_U ≃ ℤ × ℤ`. No field-order carrier is used in this branch. In the
nonsquare branch, `𝒪_Δ` is nonmaximal whenever `Δ` is not fundamental, which is why the
Global Number Fields order API, rather than `ClassGroup (𝓞 K)`, is required.

**B2. Forms and ideal classes.** First suppose `¬ IsSquare Δ`. Fix
`Δ ≡ 0` or `1 (mod 4)`, and let `f = (a, b, c)` be a primitive form of discriminant `Δ`.
Send it to the `𝒪_Δ`-submodule
`𝔞_f = aℤ + ((−b + √Δ)/2)ℤ` of `K_Δ`. This map is a bijection from proper equivalence
classes of primitive forms of discriminant `Δ` to invertible proper ideal classes of `𝒪_Δ`.
First exhibit `𝔞_f` in the supplier's raw carrier
`NumberFieldOrder.properFractionalIdeals`. Then use the quadratic-field hypothesis
`Module.finrank ℚ K_Δ = 2` and the supplier theorem
`NumberFieldOrder.isProper_iff_isUnit_of_finrank_eq_two` to place it in
`NumberFieldOrder.invertibleProperFractionalIdeals`. The equivalence is proved **into the
consumed group**, not into a target defined here:

- for `Δ < 0` the source is the set of positive definite classes and the target is
  `Pic 𝒪_Δ`, through the consumed `NumberFieldOrder.mkPic`;
- for `Δ > 0` the target is the consumed `NarrowPic 𝒪_Δ`, the quotient by the principal ideals
  with a generator of positive norm.

This use of the quadratic-order theorem is load-bearing. For a general number-field order,
properness is only the multiplier-ring condition and does not imply invertibility. Such raw
proper ideals map to the supplier's `IdealClassMonoid`; its unit classes correspond to `Pic`
through `picEquivUnitsIdealClassMonoid`. No noninvertible ideal is assigned a Picard class here.

⚠ The positive-discriminant target is `NarrowPic` and never `Pic`. The two differ exactly when
the fundamental unit has norm `+1`, and `Δ = 12` is the smallest witness: `Pic 𝒪_{12}` is
trivial while `NarrowPic 𝒪_{12}` has order 2, and the forms `x² − 3y²` and `−x² + 3y²` are
inequivalent properly while representing the same ideal class. A dictionary stated into `Pic`
for `Δ > 0` is false, and the ownership of the narrow group is the supplier's so that no second
narrow quotient exists to state it into.

For square `Δ`, define proper classes and composition directly for the split product order.
Prove the elementary class behavior without mapping into `Pic` or `NarrowPic`; for `U` the
split proper class is principal. This branch is an explicit case split in every theorem that
otherwise mentions the supplier's ideal-class carriers.

Cox, *Primes of the form x²+ny²*, Theorem 7.7 and its narrow analogue is the source.

**B3. Compatibility, and the ring class field.** In the nonsquare branch, the bijection of
B2 carries Gauss composition
to multiplication **in the consumed group** — in `Pic 𝒪_Δ` for `Δ < 0` and in `NarrowPic 𝒪_Δ`
for `Δ > 0` — the opposite form to the inverse class, and the principal form to the trivial
class. It carries the genus of `L`, in the sense of 3F, to a coset of the subgroup of squares.
Discriminants agree on both sides.

Because the target is the supplier's group and not a copy of it, one further statement is
available and is a milestone here:

```text
Gal(H_{𝒪_Δ}/K_Δ) ≃ Pic 𝒪_Δ ≃ proper equivalence classes of primitive forms of discriminant Δ
```

for `Δ < 0` (hence automatically nonsquare), the first isomorphism being Class Field
Theory's ring-class-field milestone and
the second the dictionary of B2. This roadmap proves the composite, and neither half. It is the
statement that makes the classical `x² + ny²` criteria a fact about binary forms, and it is
exactly what a copy of the Picard group would not have delivered.

There is no ring-class-field corollary in the square-discriminant branch. Its composition
law is the elementary split law from B2.

**B4. Automorphisms, ambiguous classes, and the Pell criterion.** For a nondegenerate
binary `L` of nonsquare discriminant, the supplier order gives

    SO(L) ≅ {u ∈ 𝒪(L)ˣ : N(u) = 1}.

The index `[O(L) : SO(L)]` is 1 or 2, and it is **not** always 2, so `|O(L)| = 2·#𝒪(L)ˣ` is
not a general formula. Which of the two values it takes is decided by an involution.
Conjugation `x + y√Δ ↦ x − y√Δ` of `K_Δ` carries an invertible `𝒪_Δ`-ideal `𝔞` to `𝔞̄`, with
`𝔞𝔞̄ = N(𝔞)·𝒪_Δ`; since `N(𝔞)` is a positive integer, it induces inversion on the proper
class group of B2, and under B2 it corresponds to `f = (a, b, c) ↦ f⁻ = (a, −b, c)`. The
milestone proves

    [O(L) : SO(L)] = 2  ⟺  f and f⁻ are properly equivalent  ⟺  [𝔞_f]² = 1,

the class being taken in the consumed `Pic 𝒪_Δ` for `Δ < 0` and in the consumed `NarrowPic 𝒪_Δ`
for `Δ > 0`.
A nonsquare class satisfying this is called ambiguous, and an improper automorphism is then obtained
by composing the reflection `σ(x, y) = (x, −y)`, which carries `f` to `f⁻`, with any proper
equivalence from `f⁻` back to `f`.

The witness for the other case is `!![4, 1; 1, 6]`, of determinant 23, whose norm form is
`4x² + 2xy + 6y² = 2·(2x² + xy + 3y²)`, so `Δ = −23`. Its minimum is 4 and the only vectors
of that norm are `±e₁`, so an isometry sends `e₁` to `±e₁`, and preserving `β e₁ e₂` and
the norm of `e₂` then forces `±I`, the integrality of the remaining coefficient being what
rules out the other solution. Hence `O(L) = SO(L) = {±I}` has order 2, while `#𝒪ˣ = 2` and
`2·#𝒪ˣ = 4`. The class of `(2, 1, 3)` has order 3 in `Pic 𝒪_{−23} ≅ ℤ/3`, so it is not
ambiguous, which is the same statement on the ideal side.

Together with the direct split calculation, three cases follow:

- `Δ < 0`: the norm is positive definite, so every unit has norm 1 and
  `SO(L) ≅ 𝒪(L)ˣ`. The unit group is finite, with `#𝒪(L)ˣ = 6` for `Δ = −3`, `4` for
  `Δ = −4`, and `2` otherwise. So `|SO(L)| = #𝒪(L)ˣ`, and `|O(L)|` is `#𝒪(L)ˣ` or
  `2·#𝒪(L)ˣ` according to whether the class is ambiguous;
- `Δ > 0` and `Δ` is not a square: the norm-one units are infinite, by Pell's equation, so
  `O(L)` is infinite. This is the branch that 4F consumes;
- `Δ > 0` and `Δ` is a square: this is the separate split branch. The product order and its
  norm are handled directly; its integral norm-one units are `{±1}` and `O(L)` is finite.
  The hyperbolic plane `U` has content 2, primitive part `xy`, `Δ = 1`, and
  `𝒪_U = ℤ × ℤ`; its single split proper class is ambiguous and
  `|O(U)| = 4 = 2·|SO(U)|`.

**B5. Reduction of forms, and the class number.** For nonsquare `Δ`, finiteness of
`Pic 𝒪_Δ` and of `NarrowPic 𝒪_Δ` is the consumed `finite_pic` and `finite_narrowPic`, and
is not proved again here. What this milestone owns is the **form-side** route, which the
supplier does not have and which is what a class-number computation runs: for `Δ < 0` the reduced forms satisfy
`|b| ≤ a ≤ c`, and for `Δ > 0` the reduced forms fall into finitely many cycles under the
continued-fraction step. Both give an explicit finite list of classes for each `Δ`, and B2
transports the count to the consumed group. For square `Δ`, prove finiteness and the class
count directly in the split algebra, without citing either supplier finiteness theorem.

**B6. The norm-one torus and its points.** For a binary lattice `L` use its quadratic
étale algebra `A_Δ`: the norm-one group is
`T_L(R) = {u ∈ (A_Δ ⊗ R)ˣ : N(u) = 1}` for `R = ℚ`, `ℚ_p`, `ℝ` and `ℤ_p`, with
`T_L(ℤ_p)` defined through `𝒪(L) ⊗ ℤ_p`. In the nonsquare branch this is the norm-one
torus of `K_Δ`; in the square branch identify it explicitly with the split torus rather
than coercing `ℚ × ℚ` to a number field. Required: `T_L(ℤ_p)` is compact open in
`T_L(ℚ_p)`; the isomorphisms `SO(L_p) ≅ T_L(ℤ_p)` and `SO(V_p) ≅ T_L(ℚ_p)` transported from
B4; and the diagonal embedding of `T_L(ℚ)`.

**B7. Measures in rank 2.** A canonical Haar measure on `T_L(ℚ_p)` and on `T_L(ℝ)`, the
product measure on the restricted product of the `T_L(ℚ_p)` relative to the `T_L(ℤ_p)`, and
the finite covolume of the diagonal `T_L(ℚ)`. The normalization is compared with the one the
sibling roadmap uses for `SO`, so that 7G here and the successor's 7H speak of one measure.

**B8. The mass of a positive definite binary genus.** Let `L` be positive definite of rank 2
with order `𝒪 = 𝒪(L)`, so `Δ < 0`, and write `w = #𝒪ˣ`. The content and the determinant are
genus invariants, so `Δ` and `w` are constant on `gen L`, and B4 gives `|SO(M)| = w` for
every `M` in `gen L`. The proper classes in the genus are finite in number by B5 and form a
coset of the squares by B3. Writing `h⁺(gen L)` for their number, the **proper** mass is

    m⁺(gen L) = h⁺(gen L) / w.

The full mass is obtained from that by a splitting, and not by putting the full class number
in place of `h⁺`. Two forms are improperly equivalent exactly when one is properly
equivalent to the opposite of the other, so by B2 and B3 the full classes in the genus are
the orbits of inversion on the proper classes; this is the rank-2 case of 7A, proved here
from Layer B so that this layer does not wait for Layer 7. By B4 an ambiguous proper class
is one full class with `|O(M)| = 2w`, and a pair of distinct inverse proper classes is one
full class with `|O(M)| = w`. With `a` ambiguous classes and `(h⁺ − a)/2` pairs,

    m(gen L) = a·(2w)⁻¹ + ((h⁺(gen L) − a)/2)·w⁻¹ = h⁺(gen L) / (2w),

for every value of `a`, so `m⁺ = 2m` as 7A states in general. The full class number is
`h(gen L) = (h⁺(gen L) + a)/2`, and it is `h⁺`, not `h`, that appears in the mass.

For `A₂` this gives `Δ = −3`, `w = 6`, `h⁺ = 1` with the principal class ambiguous, so
`h = 1`, `|O(A₂)| = 12` and `m = 1/12`. The genus of `!![4, 1; 1, 6]` separates the two
class numbers and is a required check: `Δ = −23`, `w = 2`, `h⁺ = 3` and `a = 1`, so `h = 2`,
the two classes are `!![2, 1; 1, 12]` with `|O| = 4` and `!![4, 1; 1, 6]` with `|O| = 2`,
and `m = 1/4 + 1/2 = 3/4 = h⁺/(2w)`, whereas `h/(2w)` would give `1/2`. The milestone also
proves that these values agree with the Conway–Sloane normalization that the successor's 7H
uses in rank 2, so the two documents cannot drift apart on the rank-2 constant.

| Milestone | Direct prerequisites |
| --- | --- |
| B1 | M `Matrix.det`, `Zsqrtd`, product rings; L 0A, 0C; for `¬ IsSquare Δ` only, R Global Number Fields `NumberFieldOrder`, `NumberFieldOrder.conductor` |
| B2 | M `Ideal`, `Submodule`; L B1; for `¬ IsSquare Δ` only, R Global Number Fields `NumberFieldOrder.properFractionalIdeals`, `NumberFieldOrder.invertibleProperFractionalIdeals`, `NumberFieldOrder.isProper_iff_isUnit_of_finrank_eq_two`, `IdealClassMonoid`, `Pic`, `NumberFieldOrder.mkPic`, `NarrowPic`; split classes are local |
| B3 | L 3F, B2; for `¬ IsSquare Δ` only, R Global Number Fields `Pic`, `NarrowPic`; for `Δ < 0`, R Class Field Theory Layer 6 ring class field and Artin isomorphism; no split ring class field |
| B4 | M `Pell.Solution₁`, `Pell.exists_of_not_isSquare`; L 2C, B1, B2, B3 |
| B5 | L B2; for `¬ IsSquare Δ` only, R Global Number Fields `finite_pic`, `finite_narrowPic`; split finiteness is proved directly |
| B6 | M `ℤ_[p]`, `ℚ_[p]`, `LinearMap.BilinForm.baseChange`; L 3A, B4 |
| B7 | M `MeasureTheory.Measure.haar`; L B6; R Adelic Algebraic Groups Layers 3, 6, 7; R Orthogonal and Spin Groups Layer 5 |
| B8 | L 2C, 3F, B2, B3, B4, B5 |

### Layer 4: classes, spinor genera, Eichler's theorem, and neighbors

Orthogonal and Spin Groups owns the quadratic-space groups, the spinor norm and the local
spinor norms. Adelic Algebraic Groups owns the generic restricted-product and rational-diagonal
substrate. This layer owns their specialization to integral lattices.

⚠ **4D and the rank-`≥ 3` half of 4E are not milestones of this roadmap.** They rest on strong
approximation for `Spin`, which neither supplier exports; their exact owner is
`OrthogonalTamagawaAndLatticeMass` (§*Scope*). They are stated below because this layer supplies
their lattice-side inputs and the successor must consume 4A–4C by name rather than rebuild them.

**4A. Class sets.** The class `cls L`, the proper class `cls⁺ L`, the genus `gen L`, and
the proper genus, with the inclusions `cls ⊆ spn ⊆ gen` once 4C defines the middle term.
The class number `h(L)` is the number of classes in `gen L`, and the proper class number is
its analogue. For definite `L` the class number is finite. In rank 0 and rank 1 the class
sets are computed directly.

**4B. Stabilizers and the adelic dictionary.** This roadmap is bilinear-first, and the supplier
states its groups for a quadratic form over a field. The first part of the milestone is the
transport. Over `ℚ_p` the element 2 is invertible, so the automorphism group of the bilinear
form `β_p` and the orthogonal group of the half-norm form `Q_p = ½ β_p(x, x)` are the same
group, by Orthogonal and Spin Groups 0C. The same holds for the determinant-one subgroups.
Everything below is stated for the transported group.

For `V = ℚ ⊗ L`, the stabilizers are `K_p(L) = {g ∈ O(V_p) : g L_p = L_p}` and
`K_p⁺(L) = K_p(L) ∩ SO(V_p)`. Prove that each is compact and open. For all but finitely many
`p` it is the stabilizer of a unimodular `ℤ_p`-lattice, in the form that makes the restricted
product well defined. The products `K_f(L)` and `K_f⁺(L)` are compact open subgroups. The two
correspondences are proved in both directions:

    {classes in gen L}        ≃  O(V)(ℚ) \ O(V)(𝔸_f) / K_f(L),
    {proper classes in gen L} ≃  SO(V)(ℚ) \ SO(V)(𝔸_f) / K_f⁺(L).

**4C. Spinor genera.** The images `θ_p(K_p⁺(L))` of the local spinor norm on the stabilizers,
computed from the Jordan data of Layer 3. The spinor genus `spn L` and the proper spinor genus
`spn⁺ L`. The definition through local spinor norms agrees with the definition through adelic
double cosets.

The count of proper spinor genera is a named group. Let `J` be the idele group of `ℚ`, the
restricted product of the groups `ℚ_pˣ` and `ℝˣ` relative to the subgroups `ℤ_pˣ`. Let `J²`
be its subgroup of squares, let `ℚˣ` sit in `J` diagonally, and put

    J_L = {j ∈ J : j_p ∈ θ_p(K_p⁺(L)) for every p, and j_∞ ∈ θ_∞(SO(V_∞))}.

Define

    ProperSpinorGenusClassGroup L = J / (ℚˣ · J² · J_L).

The milestone proves three statements:

- the group is finite, and every element has order at most 2;
- the map that sends a proper class in `gen L` to its idele class induces a bijection from
  the proper spinor genera in `gen L` to `ProperSpinorGenusClassGroup L`;
- its order is the count in O'Meara 102:7.


**4D. Eichler's theorem.** *Owner:* `OrthogonalTamagawaAndLatticeMass`. For an indefinite
nondegenerate lattice of rank at least 3, a proper spinor genus contains exactly one proper
class, so `cls⁺ L = spn⁺ L`. The passage from proper classes to classes needs the analysis of
when `O(L) ≠ SO(L)`, and that is part of the milestone. The input is strong approximation for
`Spin` in the noncompact-place form; no roadmap in the current portfolio proves it, which is
why this statement is recorded here as the successor's obligation and not as one of ours.

**4E. Class numbers of indefinite lattices.** *Rank 2 is owned here; rank at least 3 is owned by*
`OrthogonalTamagawaAndLatticeMass`. For rank 2 the theorem is B5, through the correspondence B2:
the classes in a genus form a subset of the invertible proper ideal classes of `𝒪(L)`, hence of
its Picard group, and that group is finite. The rank-2 proof does not use strong approximation,
and the proof for rank at least 3 does not cover rank 2 — so the split is not an accident of the
narrowing. For rank at least 3 the class number is finite and bounded by the count of 4C; that
argument runs through 4D and moves with it.

**4F. Automorphism groups of indefinite lattices.** For an indefinite nondegenerate lattice
of rank at least 3, `O(L)` is infinite. The proof splits by whether `V = ℚ ⊗ L` has a nonzero
isotropic vector, because an indefinite rational space need not have one: the form
`x² + y² − 3z²` is indefinite over `ℝ` and anisotropic over `ℚ`, since a primitive integral
solution of `x² + y² = 3z²` forces `3 ∣ x` and `3 ∣ y`.

- **Isotropic case.** Choose a primitive isotropic `u ∈ L`, which exists because an
  isotropic rational vector can be scaled to a primitive lattice vector. For `w ∈ u^⊥ ∩ L`
  the Eichler transvection of Orthogonal and Spin Groups 2C is

      E_{u,w}(x) = x + β(x, u)·w − β(x, w)·u − ½N_L(w)·β(x, u)·u,

  the supplier's `Q(w)` being `½N_L(w)` in this roadmap's bilinear-first notation. The
  supplier already states `w ↦ E_{u,w}` as a homomorphism on `u^⊥/ℚu`, and the integral
  statement below is the specialization of that, not a strengthening of it: the parameter
  is **not** `w` itself. Since `N_L(u) = 0` and `β(u, w) = 0`, the substitution
  `w ↦ w + a·u` leaves every term unchanged, so `E_{u,w+au} = E_{u,w}` for every `a ∈ ℤ`,
  and every nonzero multiple of `u` lies in the kernel; no finite-index subgroup of
  `u^⊥ ∩ L` avoids those, so `w ↦ E_{u,w}` is injective on none of them. The parameter is
  the class of `w` in

      Λ_u = (u^⊥ ∩ L) / ℤu,

  which is free of rank `rank L − 2`, because `u` is primitive in `L` and therefore
  primitive in `u^⊥ ∩ L`. The milestone proves four statements:

  - `E_{u,w}` depends only on the class of `w` in `Λ_u`, and the induced map
    `Λ_u → O(V)` is a group homomorphism;
  - it is injective: if `E_{u,w} = E_{u,w'}`, evaluate at an `x` with `β(x, u) ≠ 0`, which
    exists because `β` is nondegenerate, to get `β(x, u)·(w − w') ∈ ℚu`; primitivity of `u`
    gives `ℚu ∩ L = ℤu`, and dividing by the nonzero integer `β(x, u)` inside `ℚu` puts
    `w − w'` in `ℤu`;
  - the integrality condition is on `N_L(w)`, not on `w`: for `w` in the sublattice
    `M_u = {w ∈ u^⊥ ∩ L : N_L(w) ∈ 2ℤ}`, which has index 1 or 2 because `N_L mod 2` is
    additive, every coefficient above is an integer, so `E_{u,w}` and its inverse
    `E_{u,−w}` preserve `L` and `E_{u,w} ∈ O(L)`;
  - the image of `M_u` in `Λ_u` has rank `rank L − 2 ≥ 1`, so it is infinite.

  Hence `O(L)` is infinite. In rank 2 the quotient `Λ_u` is trivial, which is the correct
  reason this argument stops there and B4 takes over.
- **Anisotropic case.** Choose a rational nondegenerate indefinite plane `W ⊆ V`, which
  exists because `t₊ > 0` and `t₋ > 0`. Put `M = L ∩ W` and `N = L ∩ W^⊥`. Then `M ⊕ N` has
  finite index in `L`, and `M` is an indefinite binary lattice whose norm form is
  anisotropic over `ℚ`, so `O(M)` is infinite by B4. The group `O(M) × O(N)` acts on the
  finite set of overlattices of `M ⊕ N` of that index, so the stabilizer of `L` has finite
  index in it and is again infinite, and it embeds in `O(L)`.

Together with B4 this settles the definiteness hypothesis in 2C, and it is why Layer 7
treats positive definite genera only.

**4G. Kneser neighbors.** Integral lattices `L` and `M` on `V` are `p`-neighbors when
`[L : L ∩ M] = [M : L ∩ M] = p`. This milestone asks for:

- the definition and its symmetry;
- equality of determinants for neighbors;
- equality of genus when `p ∤ 2 det L`;
- the construction of a neighbor from an isotropic vector mod `p`;
- a decidable check for one edge.

This milestone proves nothing about enumeration. Connectivity of the neighbor graph is not
claimed, and no consumer may infer a complete list of classes from neighbor steps.

| Milestone | Direct prerequisites |
| --- | --- |
| 4A | L 2C, 2G, 3F, B2, B5 |
| 4B | L 3A, 3B, 4A; R Adelic Algebraic Groups Layers 1--3; R Orthogonal and Spin Groups Layers 0, 2 and 3 |
| 4C | T `squareClass`; L 3C, 3D, 4B; R Orthogonal and Spin Groups Layers 1 and 2 |
| 4D | *successor milestone*: L 4B, 4C; strong approximation for `Spin`, from `OrthogonalTamagawaAndLatticeMass` over `AlgebraicGroupStrongApproximation` |
| 4E, rank 2 | L B2, B5 |
| 4E, rank ≥ 3 | *successor milestone*: L 4C, 4D |
| 4F | L 0E, 2C, B4; R Orthogonal and Spin Groups Layer 2 |
| 4G | M `Submodule.basisOfPid`; L 0C, 3F |

### Layer 5: discriminant forms and Nikulin's theory

Citations are to Nikulin, *Integer symmetric bilinear forms and some of their geometric
applications*, where the numbering of the translation agrees with the original. His `E₈` is
negative definite, so each citation carries the twist.

**5A. The genus and the discriminant form.** For even lattices, `gen L` is determined by
`(t₊, t₋, q_L)`, which is Nikulin Corollary 1.9.4. The odd analogue is Corollary 1.16.3: the
genus of any nondegenerate lattice over `ℤ` is determined by its parity together with
`(t₊, t₋, b_L)`, where `b_L` is the discriminant bilinear form of 1D. Both statements are
milestones. So is the translation between the Conway–Sloane symbols of 3E and the invariants
`(t₊, t₋, q)`, in both directions, since the K3 work uses the second and the mass formula
uses the first.

**5B. Existence.** An even lattice with invariants `(t₊, t₋, q)` exists if and only if:

1. `t₊ − t₋ ≡ sign q (mod 8)`;
2. `t₊ ≥ 0`, `t₋ ≥ 0`, and `t₊ + t₋ ≥ l(A_q)`;
3. `(−1)^{t₋} |A_q| ≡ discr K(q_p) (mod (ℤ_p^*)²)` for every odd prime `p` with
   `t₊ + t₋ = l(A_{q_p})`;
4. `|A_q| ≡ ± discr K(q₂) (mod (ℤ_2^*)²)`, whenever `t₊ + t₋ = l(A_{q₂})` and `q₂` has no
   summand `q_θ^{(2)}(2)`.

This is Theorem 1.10.1. Corollary 1.10.2 is the sufficient form: conditions 1 and 2 with
the strict inequality `t₊ + t₋ > l(A_q)`. Both are milestones, and the corollary does not
replace the theorem.

**5C. Uniqueness.** An even lattice with invariants `(t₊, t₋, q)` is unique in its genus if:

1. `t₊ ≥ 1`, `t₋ ≥ 1`, and `t₊ + t₋ ≥ 3`;
2. for every odd `p`, either `rank ≥ l(A_{q_p}) + 2`, or
   `q_p ≅ q_{θ₁}^{(p)}(p^k) ⊕ q_{θ₂}^{(p)}(p^k) ⊕ q'`;
3. at `p = 2`, either `rank ≥ l(A_{q₂}) + 2`, or `q₂ ≅ u^{(2)}(2^k) ⊕ q'`, or
   `q₂ ≅ v^{(2)}(2^k) ⊕ q'`, or
   `q₂ ≅ q_{θ₁}^{(2)}(2^k) ⊕ q_{θ₂}^{(2)}(2^{k+1}) ⊕ q'`.

This is Theorem 1.13.2. With 5B it gives Corollary 1.13.3: an even lattice with invariants
`(t₊, t₋, q)` exists and is unique when `t₊ − t₋ ≡ sign q (mod 8)`,
`t₊ + t₋ ≥ l(A_q) + 2`, `t₊ ≥ 1` and `t₋ ≥ 1`.

**5D. Stabilization and splitting.** Corollary 1.13.4 has two parts. Let `T` be even with
invariants `(t₊, t₋, q)`. Then `U ⊕ T` is the unique even lattice with invariants
`(t₊+1, t₋+1, q)`. If in addition `t₊ > 0`, then `E₈(−1) ⊕ T` is the unique even lattice
with invariants `(t₊, t₋+8, q)`.

Corollary 1.13.5 also has two parts. Let `S` be an even lattice of signature `(t₊, t₋)`.
Then `S ≅ U ⊕ T` for some `T` when `t₊ ≥ 1`, `t₋ ≥ 1` and `t₊ + t₋ ≥ l(A_S) + 3`. And
`S ≅ E₈(−1) ⊕ T` for some `T` when `t₊ ≥ 1`, `t₋ ≥ 8` and `t₊ + t₋ ≥ l(A_S) + 9`.

**5E. The map from isometries to isometries of the discriminant form.** Theorem 1.14.2
assumes that `T` is an even indefinite lattice with two properties. First,
`rank T ≥ l(A_{T_p}) + 2` for every odd `p`. Second, if `rank T = l(A_{T₂})`, then
`q_{T₂} ≅ u^{(2)}(2) ⊕ q'` or `q_{T₂} ≅ v^{(2)}(2) ⊕ q'`. The conclusion is that the genus
of `T` has one class, and that `O(T) → O(q_T)` is surjective.

Proposition 1.14.1 is proved with it. It reduces the Witt-type statements to three
conditions on the orthogonal complement.

**5F. Primitivity.** An injection of finite free `ℤ`-modules has torsion-free cokernel
exactly when its image is a direct summand. Every statement below quantifies over primitive
embeddings.

**5G. Primitive embeddings into an even unimodular lattice.** Theorem 1.12.2: for an even
lattice `S` with invariants `(t₊, t₋, q)` and integers `l₊`, `l₋`, the following are
equivalent:

1. `S` embeds primitively into some even unimodular lattice of signature `(l₊, l₋)`;
2. an even lattice with invariants `(l₊ − t₊, l₋ − t₋, −q)` exists;
3. all four of: `l₊ − l₋ ≡ 0 (mod 8)`; `l₊ − t₊ ≥ 0`, `l₋ − t₋ ≥ 0` and
   `l₊ + l₋ − t₊ − t₋ ≥ l(A_q)`; `(−1)^{l₊ − t₊} |A_q| ≡ discr K(q_p) (mod (ℤ_p^*)²)` for
   every odd `p` with `l₊ + l₋ − t₊ − t₋ = l(A_{q_p})`; and
   `|A_q| ≡ ± discr K(q₂) (mod (ℤ_2^*)²)` if `l₊ + l₋ − t₊ − t₋ = l(A_{q₂})` and `q₂` has no
   summand `q_θ^{(2)}(2)`.

Corollary 1.12.3 is the sufficient form with `l₊ + l₋ − t₊ − t₋ > l(A_q)`. Theorem 1.12.4 is
the criterion in terms of the signatures alone: for nonnegative integers `t₊, t₋, l₊, l₋`,
every even lattice of signature `(t₊, t₋)` embeds primitively into some even unimodular
lattice of signature `(l₊, l₋)` if and only if `l₊ − l₋ ≡ 0 (mod 8)`, `t₊ ≤ l₊`, `t₋ ≤ l₋`,
and `2(t₊ + t₋) ≤ l₊ + l₋`.

**5H. Uniqueness of a primitive embedding.** Theorem 1.14.4 concerns a primitive embedding
of an even lattice `M` of signature `(t₊, t₋)` into an even unimodular lattice `L` of
signature `(l₊, l₋)`. The embedding is unique up to `O(L)` if:

1. `l₊ − t₊ > 0` and `l₋ − t₋ > 0`;
2. `l₊ + l₋ − t₊ − t₋ ≥ l(A_{M_p}) + 2` for every odd `p`;
3. `q_M ≅ u^{(2)}(2) ⊕ q'` or `q_M ≅ v^{(2)}(2) ⊕ q'`, in the case
   `l₊ + l₋ − t₊ − t₋ = l(A_{M₂})`.

**5I. Primitive embeddings into a general even lattice.** Proposition 1.15.1: primitive
embeddings of `S` into even lattices with invariants `(m₊, m₋, q)` correspond to tuples
`(H_S, H_q, γ; K, γ_K)`. The components are:

- subgroups `H_S ≤ A_S` and `H_q ≤ A_q`;
- an isometry `γ` from `q_S|H_S` to `q|H_q`;
- an even lattice `K` with invariants `(m₊ − t₊, m₋ − t₋, −δ)`, where
  `δ = (q_S ⊕ (−q))|Γ_γ^⊥ / Γ_γ` and `Γ_γ ⊆ A_S ⊕ A_q` is the graph of `γ`;
- an isometry `γ_K` from `q_K` to `−δ`.

Two tuples `(H_S, H_q, γ; K, γ_K)` and `(H'_S, H'_q, γ'; K', γ'_K)` give isomorphic
primitive embeddings exactly when `H_S = H'_S` and there are `ξ ∈ O(q)` and an isometry
`ψ : K ≅ K'` such that

1. `ξ(H_q) = H'_q`, so that `ξ` restricts to an isometry `ξ|_{H_q} : q|H_q ≅ q|H'_q`;
2. `γ' = ξ|_{H_q} ∘ γ`, an equation of isometries `q_S|H_S ≅ q|H'_q`, which is typed
   because `H'_S = H_S` makes the two sides share a source;
3. `ξ̄ ∘ γ_K = γ'_K ∘ ψ̄`, an equation of isometries `q_K ≅ −δ'`.

The two induced maps in the third equation are named, and neither is assumed. Condition 1
makes `id_{A_S} ⊕ ξ` an isometry of `q_S ⊕ (−q)` that carries the graph `Γ_γ` onto
`Γ_{γ'}`, hence `Γ_γ^⊥` onto `Γ_{γ'}^⊥`, hence induces the isometry `ξ̄ : δ ≅ δ'` of the
quotient forms, which is also an isometry `−δ ≅ −δ'`; and `ψ̄ : q_K ≅ q_{K'}` is the
isometry of discriminant forms induced by `ψ` through the functoriality of 1D. The same
tuples give isomorphic primitive sublattices under the weaker condition that `H_S` and
`H'_S` are conjugate by an automorphism of `S`.
The lattice `K` is the orthogonal complement of `S`. Corollary 1.15.2 states the genus-level
version.

**5J. 2-elementary lattices.** `S` is 2-elementary when `A_S ≅ (ℤ/2)^a`. Then `q_S` is an
orthogonal sum of forms `q_θ^{(2)}(2)`, `u^{(2)}(2)` and `v^{(2)}(2)`, and `δ_S` is 0 when
no summand `q_θ^{(2)}(2)` occurs and 1 otherwise. Theorem 3.6.2: the genus of an even
2-elementary lattice is determined by `(δ_S; t₊, t₋, a)`, and when `t₊ > 0` and `t₋ > 0`
these invariants determine the isometry class. Such a lattice exists, for `δ_S ∈ {0,1}` and
`a, t₊, t₋ ≥ 0`, if and only if:

1. `a ≤ t₊ + t₋`;
2. `t₊ + t₋ + a ≡ 0 (mod 2)`;
3. `t₊ − t₋ ≡ 0 (mod 4)` when `δ_S = 0`;
4. `δ_S = 0` and `t₊ − t₋ ≡ 0 (mod 8)` when `a = 0`;
5. `t₊ − t₋ ≡ ±1 (mod 8)` when `a = 1`;
6. `δ_S = 0` when `a = 2` and `t₊ − t₋ ≡ 4 (mod 8)`;
7. `t₊ − t₋ ≡ 0 (mod 8)` when `δ_S = 0` and `a = t₊ + t₋`.

Theorem 3.6.3: for indefinite even 2-elementary `S`, the map `O(S) → O(q_S)` is surjective.
Nikulin's paper has no `p`-elementary theorem for odd `p`. For odd `p` the classification
follows from 5C, and the roadmap states it that way.

| Milestone | Direct prerequisites |
| --- | --- |
| 5A | L 1D, 1G, 3E, 3F |
| 5B | L 1G, 1H, 3C, 3D, 5A |
| 5C | L 5A, 5B |
| 5D | L 0G, 5C |
| 5E | L 2C, 5C |
| 5F | M `Submodule.basisOfPid`, `IsCompl` |
| 5G | L 1E, 1F, 5B, 5F |
| 5H | L 5E, 5G |
| 5I | L 1F, 5G, 5H |
| 5J | L 1G, 5B, 5C, 5E |

### Layer 6: unimodular lattices in low rank

**6A. Indefinite classification.** Let `L` be indefinite unimodular of signature
`(t₊, t₋)`, and put `k = |t₊ − t₋| / 8`. If `L` is even, then `8 ∣ t₊ − t₋` by 1I, and the
signature determines `L`:

- if `t₊ ≥ t₋`, then `L ≅ U^{t₋} ⊕ E₈^{k}`, with the positive definite `E₈`;
- if `t₋ ≥ t₊`, then `L ≅ U^{t₊} ⊕ E₈(−1)^{k}`.

If `L` is odd, then `L ≅ ⟨1⟩^{t₊} ⊕ ⟨−1⟩^{t₋}`. Both statements are proved milestones.

**6B. Existence in the definite case.** An even unimodular positive definite lattice of
rank `n` exists exactly when `8 ∣ n`.

**6C. Rank at most 9.** A positive definite unimodular lattice of rank at most 9 is `Iₙ`,
`E₈`, or `E₈ ⊕ I₁`. The proof follows O'Meara: uniqueness of the decomposition into
indecomposable summands, and a count of characteristic vectors. It follows that `E₈` is the
unique even unimodular lattice of rank 8. The alternative proof through root systems, in
which the minimal vectors form a root system of type `E₈`, discharges the same milestone.

**6D. Rank 16, the two classes.** `E₈²` and `D₁₆⁺` are even unimodular of rank 16, they lie
in one genus, and they are not isometric, because their root systems differ. This milestone
constructs both lattices and proves those four statements. It claims no completeness: that
the genus has no third class is 7I, which comes after the mass formula and belongs to
`OrthogonalTamagawaAndLatticeMass`.

**6E. Rank 24 reference lattices.** The 24 Niemeier lattices are defined by explicit Gram
data or glue data. For each row the milestone proves evenness, unimodularity, rank 24, and
the stated root system. It also proves that the 24 rows are pairwise non-isometric: 23 of
them have pairwise distinct root systems, and the remaining row has no roots, so the root
system separates all 24. The name Leech denotes the row with no roots. This milestone states
no completeness theorem for rank 24, and it proves no characterization of the Leech row
beyond the ones listed here.

**6F. Two models of `E₈`.** The Gram matrix model of 0G and the coordinate model
`{x ∈ ℤ⁸ ∪ (ℤ+½)⁸ : ∑ x ∈ 2ℤ}` are isometric. The proof gives Tau Ceti one `E₈` and one
isometry, rather than two unrelated lattices.

**6G. The order of `O(E₈)`.** Reflections in the 240 roots of `E₈` generate `O(E₈)`, and
`−1` lies in that group, so `O(E₈) = W(E₈)`. The order is computed by orbits and
stabilizers: `W(E₈)` is transitive on the 240 roots with stabilizer `W(E₇)`; `W(E₇)` is
transitive on its 126 roots with stabilizer `W(D₆)`; and `|W(D₆)| = 2⁵·6! = 23040`. Hence

    |O(E₈)| = 240 · 126 · 23040 = 696729600.

This milestone is owned here. The Root Systems roadmap classifies root systems and defines
the Weyl group order abstractly, and it proves no type-specific value.

| Milestone | Direct prerequisites |
| --- | --- |
| 6A | L 1I, 5C, 5D |
| 6B | L 1I, 0G |
| 6C | M `CartanMatrix.E₈`; L 0F, 2G; R Root Systems Layer 5 |
| 6D | L 2C, 3F, 5A, 6B |
| 6E | L 0C, 1C, 2B |
| 6F | L 0G, 2B |
| 6G | M `CartanMatrix.E₈`; L 0G, 2B, 2C; R Root Systems Layer 5 |

### Layer 7: masses, local densities, and the archimedean factor

Every statement in this layer is about positive definite genera, and the Conway–Sloane mass
formula paper is the source for the normalization.

⚠ **The mass formula itself is not a milestone of this roadmap.** Assembling the local factors
into `m(f)` runs through the adelic volume of `SO(V)`, which needs a Tamagawa normalization and
the volume theorem; #246 exports neither, and #255 states explicitly that only
`OrthogonalTamagawaAndLatticeMass` may export the orthogonal volume theorem. Milestones **7B,
7F, 7H and 7I are therefore that successor's**, and are stated here only as the boundary it
must meet. What this roadmap owns is everything the successor consumes from the lattice side:
the two masses and their comparison (7A), the local densities at odd `p` (7C) and at `2` (7D),
the archimedean factor (7E), and the low-rank values (7G). Those are lattice arithmetic and use
no adelic volume.

⚠ Do not conflate the two orthogonal inputs the successor needs. Strong approximation is an
*indefinite* statement, the volume theorem is what a *positive definite* mass needs, and neither
implies the other.

**7A. Proper mass and full mass.** The two sums are defined, and both are finite by 2C and
2G. For `rank L ≥ 1` the relation between them is proved, and not assumed. A class either
stays one proper class, in which case `|O(M)| = 2|SO(M)|`, or splits into two proper classes,
in which case `O(M) = SO(M)`. In both cases `m⁺ = 2m`. In rank 0 the relation fails, and 7G
gives the values there.

There is no product formula for the mass of a direct sum, and that non-statement is
recorded. The mass of a twist `L(a)` is stated for `a > 0` only.

**7B. The adelic decomposition.** *Owner:* `OrthogonalTamagawaAndLatticeMass`. The inputs are
`TamagawaMeasures`' quotient and Tamagawa-measure substrate, that successor's own orthogonal
volume theorem, and the dictionary of 4B, which is ours. The quotient
`SO(V)(ℚ) \ SO(V)(𝔸)` is decomposed into measurable pieces, indexed by the proper classes.
The piece of the class of `M` has volume

    vol(K_∞) / |SO(M)| · ∏_p vol(K_p⁺(M)).

Every quotient and stabilizer in that formula is named.

**7C. Local densities at odd primes.** Let `L` be a nondegenerate `ℤ_p`-lattice of rank `n`
with Gram matrix `A` in a basis. The local automorphism density is

    α_p(L) = lim_{r→∞} p^{−r·n(n−1)/2} · #{X ∈ Mₙ(ℤ/p^r) : Xᵀ A X ≡ A (mod p^r)}.

This milestone asks for:

- stabilization: the counting function equals `p^{r·n(n−1)/2}·α_p(L)` for every `r ≥ r₀`,
  with `r₀` given explicitly in terms of `n` and `v_p(2 det A)`, so the limit exists and is
  a positive rational number;
- independence of the basis, and dependence only on the isometry class of `L_p`;
- `[K_p(L) : K_p⁺(L)] = 2` exactly when `K_p(L)` contains an element of determinant `−1`.
  ⚠ The companion identity `vol(K_p(L)) = α_p(L)`, for the measure attached to the gauge form of
  the equation `Xᵀ A X = A`, is **not** a milestone here: that measure is the local factor of the
  Tamagawa measure, which no current supplier defines. It is `OrthogonalTamagawaAndLatticeMass`'s
  first obligation, and `α_p` as defined above is exactly what it must be shown equal to;
- the unramified value: for `p ∤ 2 det L`, so that `L_p` is unimodular,

      α_p(L) = 2 ∏_{i=1}^{m} (1 − p^{−2i})                      if n = 2m + 1,
      α_p(L) = 2 (1 − ε p^{−m}) ∏_{i=1}^{m−1} (1 − p^{−2i})     if n = 2m,

  where `ε = ±1` is the **type** of the reduction of `L_p`, which is the split/nonsplit
  invariant of the orthogonal group and not the square class of the determinant. It is
  fixed by the signed determinant:

      ε = ((−1)^m · det L_p | p),

  the Legendre symbol. The value comes from `α_p(L) = #O(L_p ⊗ 𝔽_p)/p^{n(n−1)/2}` together
  with `#O^ε_{2m}(𝔽_p) = 2 p^{m(m−1)}(p^m − ε)∏_{i=1}^{m−1}(p^{2i} − 1)`, and `O^ε_{2m}` is
  split exactly when `(−1)^m det` is a square. The genus symbol of 3G records the Legendre
  symbol of the determinant itself, in the Conway–Sloane convention, so the translation
  between the two carries the factor `(−1 | p)^m` and the milestone states it that way;
- the mandatory test that separates the two conventions: the hyperbolic plane over `p = 3`
  has `m = 1` and `det = −1`, a nonsquare mod 3, yet it is split, `#O_2^+(𝔽_3) = 4`, and
  `α_3 = 4/3 = 2(1 − 3^{−1})`. Reading `ε` off the raw determinant would give `8/3`;
- the reduction of `∏_p α_p(L)⁻¹` to a product of the standard Euler factors of those two
  displays, times the finitely many corrections at `p ∣ 2 det L`, and the convergence of
  that product;
- the dictionary to the Conway–Sloane local mass `m_p`, in their section 12, including every
  factor of 2.

The values at odd `p` are computed from the Jordan decomposition of 3C.

**7D. The local density at 2.** At `p = 2` the naive count does not stabilize, and the
density is read off a smooth model. The theorem consumed is Cho, Theorem 5.2, and it is
stated in the generality he proves and in his normalization, because the exponent below is
generally nonzero and dropping it changes the answer by a power of 2.

Let `R` be an unramified finite extension of `ℤ_2`, with fraction field `F` and residue
field `κ` of cardinality `f`; Cho calls this ring `A`, which is the Gram matrix in 7C. Let
`(L, q)` be a quadratic `R`-lattice of rank `n` with `⟨x, y⟩ = ½(q(x+y) − q(x) − q(y))`
integral and `V = L ⊗_R F` nondegenerate; in this roadmap's vocabulary `⟨·,·⟩` is `β` and
`q` is the norm form `N_L`, since `⟨x, x⟩ = q(x)`. Fix a Jordan splitting `L = ⊕_i L_i` as
in 3B, where `L_i = 2^i M_i` is the `2^i`-modular constituent, of rank `n_i`. Following
Cho, `L_i` is of **type I** when its norm ideal is all of `R` and of **type II** otherwise,
which is the odd/even distinction of the 2-adic symbol in 3E; and `L_i` is **bound** when
`L_{i−1}` or `L_{i+1}` is of type I, and **free** when neither is. Put

    N_M = ∑_{L_i type I} (2n_i − 1) + ∑_{i<j} (j − i)·n_i·n_j + 2b,
    N_Q = ∑_{L_i type I} 2n_i + ∑_{i<j} j·n_i·n_j + ∑_i d_i + b + c,
    N   = N_Q − N_M = t + ∑_{i<j} i·n_i·n_j + ∑_i d_i − b + c,

where `d_i = i·n_i(n_i + 1)/2`, `t` is the number of constituents of type I, `b` is the
number of pairs of adjacent constituents `L_i`, `L_{i+1}` both of type I, which is
Conway–Sloane's `n(I, I)`, and `c` is the sum of the dimensions of the nonempty
constituents of type II, which is their `n(II)`. Let `𝒢_L` be the smooth affine group scheme
over `R` with generic fiber `O(V, q)` and `𝒢_L(R) = O(L)`, let `𝒢̃_L` be its special fiber
and `U_L` the unipotent radical of `𝒢̃_L`. Then Cho's local density of `(L, q)`, which he
writes `β_L` and which is not the bilinear form `β` of Layer 0, is

    β_L = [O(V, q) : SO(V, q)]⁻¹ · f^N · f^{−dim O(V,q)} · #𝒢̃_L(κ),      dim O(V,q) = n(n−1)/2,

and `#𝒢̃_L(κ) = #U_L(κ)·#(𝒢̃_L/U_L)(κ)` with `#U_L(κ) = f^{dim U_L}`, the reductive quotient
`𝒢̃_L/U_L` being `∏_i O(V̄_i, q̄_i)_red` times an elementary abelian 2-group whose rank is
the `α + β` of Cho's Lemma 4.2, by his Theorem 4.12.

This milestone asks for:

- the construction of `𝒢_L` from the Jordan data of 3D, with the type and bound/free
  classification, and the convention in rank 0;
- the proof that `𝒢_L` is smooth of relative dimension `n(n−1)/2`;
- the exponents `N_M`, `N_Q` and `N`, and the displayed formula, over a general unramified
  `R`, with `R = ℤ_2` and `f = 2` specialized only afterwards;
- the factor `[O(V, q) : SO(V, q)]⁻¹`: the index is 2 for `n ≥ 1` in characteristic zero,
  so the factor is `½`, and it is the reason `β_L` is a density for `SO` and not for `O`;
- the comparison with the limit definition of 7C, which is where the roadmap's `α_2`
  is fixed. The odd-prime case pins the expected constant: Gan–Yu give
  `β_{L_p} = ½·p^{−n(n−1)/2}·#O(L_p ⊗ 𝔽_p)`, which is half the `α_p` of 7C, so the target
  is `α_2(L) = 2·β_L = 2^{N − n(n−1)/2}·#𝒢̃_L(𝔽_2)`, and the milestone proves that equality
  rather than assuming it;
- the proof that the resulting factor is the Conway–Sloane dyadic factor, oddity and type
  included.

The Conway–Sloane dyadic tables are data, and not a proof.

**7E. The archimedean factor.** With the measure from the standard Euclidean structure,
`SO(n)/SO(n−1) ≅ S^{n−1}` and `vol(S^{n−1}) = 2π^{n/2}/Γ(n/2)`, so

    vol(SO(n)) = ∏_{j=2}^{n} 2π^{j/2} / Γ(j/2),      vol(O(n)) = 2·vol(SO(n)).

The milestone proves the fibration, the sphere volume, the product, and then the identity
that connects it with the mass formula:

    2 π^{−n(n+1)/4} ∏_{j=1}^{n} Γ(j/2) = 2^{n+1} / vol(O(n)).

It also proves that this real volume is the archimedean factor of the measure used in 7B.

**7F. The volume theorem.** *Owner:* `OrthogonalTamagawaAndLatticeMass`.
`vol(SO(V)(ℚ) \ SO(V)(𝔸)) = 2`, with its dimension hypotheses and normalization, and with the
low-dimensional exceptions recorded. ⚠ This roadmap's low-rank branch 7G states the rank `0`,
`1` and `2` mass values directly and does not derive them from this theorem, so the two
documents must agree on the exceptions rather than one deducing them from the other.

**7G. Low rank.** Three cases are proved directly, and none of them is a specialization of
the general derivation:

- rank 0: `O(L) = SO(L) = 1` and the genus has one class, so `m⁺ = m = 1`;
- rank 1: the genus of `⟨a⟩` with `a > 0` has one class, with `O(L) = {±1}` and `SO(L) = 1`,
  so `m = 1/2` and `m⁺ = 1`;
- rank 2: B8 gives `m⁺(gen L) = h⁺(gen L)/#𝒪(L)ˣ` and `m(gen L) = h⁺(gen L)/(2·#𝒪(L)ˣ)`,
  through the norm-one torus of B6 and its measures in B7. Both denominators count
  **proper** classes; the full class number `h(gen L)` is not what divides here, because
  `|O(M)|` is not constant on the genus.

The derivation of 7B to 7F is stated for rank at least 3, and 7H packages all ranks with
explicit branches. 7G is proved here, without any of them.

**7H. The Conway–Sloane formula and its checks.** *Owner:*
`OrthogonalTamagawaAndLatticeMass`. The formula

    m(f) = 2 π^{−n(n+1)/4} ∏_{j=1}^{n} Γ(j/2) ∏_p 2 m_p(f)

with the dimension guard, together with the dictionary to Siegel's local density notation
`α_p`. Then the checks:

- the rank-8 even unimodular genus has mass `1/696729600`, class number 1, and
  `|O(E₈)| = |W(E₈)| = 696729600`;
- the genus of `A₂` has class number 1;
- in rank 16, `1/|O(E₈²)| + 1/|O(D₁₆⁺)| = m₁₆`, where `m₁₆` is the mass of the genus of 6D.

The third check is the input to 7I.

**7I. The rank-16 genus has two classes.** *Owner:* `OrthogonalTamagawaAndLatticeMass`; the two
automorphism orders it needs are computed here, in 6D and 6G. Both automorphism orders are
computed first. `E₈²`
has two indecomposable summands, both isometric to `E₈`, so `|O(E₈²)| = 2·|O(E₈)|²`, with
`|O(E₈)|` from 6G. The order `|O(D₁₆⁺)|` is computed from its root system `D₁₆` together
with the stabilizer of the glue vector. With `m₁₆` from 7H, the
equality `1/|O(E₈²)| + 1/|O(D₁₆⁺)| = m₁₆` and the finiteness of the class set prove that
`E₈²` and `D₁₆⁺` exhaust the genus. This is the completeness theorem that 6D does not claim.

| Milestone | Direct prerequisites |
| --- | --- |
| 7A | L 2C, 2G, 4A |
| 7B | *successor milestone*: L 4B, 7A; `TamagawaMeasures` quotient and measure substrate; the volume theorem 7F |
| 7C | L 3B, 3C, 4B |
| 7D | L 3D, 3E, 4B |
| 7E | M `Real.Gamma`, sphere volumes; L 2D |
| 7F | *successor milestone*: `TamagawaMeasures`, and `OrthogonalTamagawaAndLatticeMass`'s own gauge forms |
| 7G | L 2C, 4A, 7A, B6, B7, B8 |
| 7H | *successor milestone*: L 2C, 6C, 6D, 6G, 7C, 7D, 7E, 7G; successor 7B, 7F |
| 7I | *successor milestone*: L 2G, 6D, 6G; successor 7H |

### Layer 8: theta series

**8A. The two levels of theta.** The analytic theta takes a lattice in a real inner product
space and a positive definite real quadratic form, and assumes no integrality. The
arithmetic theta of this layer is a wrapper: realize a positive definite `(L, β)` as such a
lattice, and define `Θ_L` as the analytic theta of that realization. The definition does
not depend on the realization. The dual lattice `L^⋆` carries a rational-valued form, so
`Θ_{L^⋆}` is an instance of the analytic theta and not of the arithmetic one.

**8B. Convergence and the q-expansion.** `Θ_L(τ) = ∑_{x ∈ L} exp(πiτ·β(x,x))` converges
absolutely and locally uniformly on the upper half-plane, for positive definite `L`. Its
expansion is `Θ_L = ∑_k r_L(k) q^k` in `q = e^{πiτ}`, where `r_L(k)` are the shell counts
of 2B.

**8C. Sums, twists, and the rank-one case.** `Θ_{L⊕M} = Θ_L·Θ_M`. For `a > 0`,
`Θ_{L(a)}(τ) = Θ_L(aτ)`. `Θ_ℤ = jacobiTheta`, and `Θ_{Iₙ} = jacobiTheta^n`.

**8D. The dual lattice and the covolume.** The analytic dual of the realization of `L` is
the image of the dual lattice of 1B, so the two notions agree. For positive definite `L`,
`covolume(L) = Real.sqrt (det L)`.

**8E. The transformation law.** From the Gaussian theta transformation for real `t > 0`,
together with 8D and analytic continuation in `τ`,

    Θ_L(−1/τ) = (τ/i)^{n/2} (det L)^{−1/2} Θ_{L^⋆}(τ).

Both sides are holomorphic on the upper half-plane and agree on the positive imaginary
axis. The branch of `(τ/i)^{n/2}` and the square root are those fixed in the conventions.
For unimodular `L` this becomes `Θ_L(−1/τ) = (τ/i)^{n/2} Θ_L(τ)`.

| Milestone | Direct prerequisites |
| --- | --- |
| 8A | M `IsZLattice`, `EuclideanSpace`; L 0E, 2A |
| 8B | M `Mathlib/Algebra/Module/ZLattice/Summable.lean`; L 2B, 8A |
| 8C | M `jacobiTheta`; L 0A, 8B |
| 8D | M `ZLattice.covolume`; L 1B, 2D, 8A; R L-functions Layer 1 analytic dual and covolume milestones |
| 8E | L 8B, 8D; R L-functions Layer 1 Gaussian theta transformation |

### Layer 9: what the LMFDB lattice columns assert

**9A. The stored columns.** A record of the LMFDB lattice section is a Gram matrix `G`, a
label `dim.det.level.class_number.index`, a list of Gram matrices called the genus
representatives, and the numerical columns. The milestone defines one object,
`StoredGenusCertificate`, whose fields are the statements the record asserts:

- `G` is integral, symmetric and positive definite, so 0A to 0E apply to the lattice `L` it
  defines;
- the dimension is the rank of 0A, the determinant is that of 0C, and the level is that of
  0D;
- the minimum and the kissing number are those of 2B, the automorphism group order is that
  of 2C, and the theta coefficients are those of 8B;
- every listed Gram matrix defines a lattice in `gen L`, by 3F;
- the listed lattices are pairwise non-isometric, which is a decidable check for positive
  definite lattices by 2G;
- the number of listed lattices is the class number of `gen L`, which is the label
  component `class_number`, is the invariant defined in 4A, and is finite by 2G.

The last field is the completeness statement, and a mass certificate from the successor's 7H is
one way to prove it for a given genus, not a prerequisite of the definition. The fifth label component
has no mathematical content in this roadmap.

`Suggested.lean` carries the structure, because every condition in it is expressible at the
current Mathlib: isometry is integral congruence of Gram matrices, and genus membership is
congruence over every `ℤ_p` together with positive definiteness on both sides, which is 3F
written out. Nothing in the certificate waits for the genus symbols of 3E or the mass
formula of Layer 7.

| Milestone | Direct prerequisites |
| --- | --- |
| 9A | L 0A, 0C, 0D, 0E, 2B, 2C, 2G, 3F, 4A, 8B |

---

## Basic API for each new object

A definition without lemmas is not a contribution. For each object below the roadmap asks
for the eight items listed. The layer that introduces the object owns them.

### The lattice form (0A)

- **Constructors.** From a symmetric bilinear form; from a Gram matrix over `ℤ`; from a
  quadratic form, when the lattice is even; by restriction to a full submodule in the same
  ambient space; from an arbitrary finite-free submodule in its rational span
  `ℚ ⊗[ℤ] M`.
- **Examples.** `⟨a⟩`, `Iₙ`, `U`, the root lattices, `Λ_{K3}` (0G).
- **Morphisms.** Isometries, isometric embeddings, and primitive embeddings (5F).
- **Functoriality.** Direct sums, twists, full sublattices of finite index, and orthogonal
  complements; arbitrary finite-free submodules are compared in their rational spans.
- **Comparison lemmas.** The Gram matrix in a basis; the real form; the rational form; the
  `ℤ_p`-form.
- **Naturality.** An isometry induces equality of determinant, signature, level, scale and
  norm ideal.
- **Edge cases.** Rank 0; degenerate forms; the zero form.
- **Downstream.** Every later layer.

### The dual lattice (1B)

- **Constructors.** `B.dualSubmodule L` in `V = ℚ ⊗ L`; the dual basis of a basis.
- **Examples.** `L^⋆ = L` for unimodular `L`; `(Aₙ)^⋆/Aₙ ≅ ℤ/(n+1)`.
- **Morphisms.** An isometry of `L` induces an isometry of `L^⋆`.
- **Functoriality.** `(L ⊕ M)^⋆ = L^⋆ ⊕ M^⋆`;
  `dual_{aB}(L) = (a : ℚ)⁻¹ • dual_B(L)` for nonzero integral `a`, with scalar
  dilation on the right; inclusion reversal.
- **Comparison lemmas.** The Gram matrix of the dual basis is `G⁻¹`;
  `det L^⋆ = (det L)⁻¹`; the analytic dual of the realization is the same submodule (8D).
- **Naturality.** Biduality `L^{⋆⋆} = L`, and its compatibility with sums and twists.
- **Edge cases.** Degenerate `β`, where the dual is not a lattice; rank 0.
- **Downstream.** 1C, 1D, 5G, 8D.

### The discriminant group and its forms (1C, 1D)

- **Constructors.** `A_L = L^⋆/L`; `b_L` from `B`; `q_L` from `B` when `L` is even.
- **Examples.** `A_{E₈} = 0`; `A_{A₂} ≅ ℤ/3` with half-norm `q = 1/3`; `A_U = 0`.
- **Morphisms.** `O(L) → O(q_L)`, whose surjectivity is 5E.
- **Functoriality.** Sums and the sign twist `L(−1)`, as canonical isometries and not
  equalities (1D); nonunit twists instead use the induced inclusion/quotient comparison.
- **Comparison lemmas.** `#A_L = |det L|`; `l(A_L) ≤ rank L`; the polarization of `q_L` is
  `b_L`; the invariant-factor description.
- **Naturality.** An isometry of lattices induces an isometry of discriminant forms, and
  this assignment respects composition.
- **Edge cases.** Unimodular `L`, where `A_L = 0`; odd `L`, which has no `q_L`; rank 0.
- **Downstream.** 1E, 1F, 5A to 5J, 6A.

### Finite quadratic forms (1G)

- **Constructors.** From `(A, q)` with the two axioms; the generators `q_θ^{(p)}(p^k)`,
  `u^{(2)}(2^k)`, `v^{(2)}(2^k)`; the discriminant form of an even lattice.
- **Examples.** The forms listed for the standard lattices above.
- **Morphisms.** Isometries, and the group `O(q)`.
- **Functoriality.** Orthogonal sums; the `p`-primary decomposition; restriction to a
  subgroup; the quotient `H^⊥/H` for isotropic `H`.
- **Comparison lemmas.** For nondegenerate modules, the relations among generators
  (Nikulin 1.8.2) and the Gauss-sum invariant of each generator (1H).
- **Naturality.** `sign` is additive over sums and invariant under isometry.
- **Edge cases.** The trivial group; degenerate restrictions, which remain objects of the
  carrier but are excluded explicitly from the generator and Gauss-sum classifications.
- **Downstream.** 1H, 3E, 5A to 5J.

### Lattices over `ℤ_p` and their Jordan data (3A, 3B)

- **Constructors.** `L.integralForm`; `L_p = ℤ_p ⊗[ℤ] L.carrier` with its localized
  integral form; `V_p = ℚ_p ⊗[ℚ] V` with its completed rational form; the embedding
  `L_p → V_p`; a Jordan splitting; a Gram matrix over `ℤ_p`.
- **Examples.** Unimodular `ℤ_p`-lattices at odd `p`; `U` over `ℤ_2`.
- **Morphisms.** Isometries over `ℤ_p`, and base change from `ℤ`.
- **Functoriality.** Sums, twists, and scaling by `p^i`.
- **Comparison lemmas.** `L.integralForm` casts to `L.form`; the canonical `L_p → V_p` is
  injective and full after scalar extension; its integral form is the restriction of the
  completed rational form. The Jordan invariants at odd `p` are unique (3C); at `p = 2`
  the splitting is not unique and the symbols of 3E replace it.
- **Naturality.** Localization commutes with sums, form twists, carrier dilations, duality,
  and isometries.
- **Edge cases.** `p = 2`; rank 0; a scale-zero constituent.
- **Downstream.** 3C to 3H, 4C, 7C, 7D.

### Genus symbols (3E, 3G)

- **Constructors.** From a Jordan splitting; from a Gram matrix by an algorithm.
- **Examples.** The symbols of `A₂`, `U`, `E₈`, and one rank-4 lattice with a nontrivial
  2-adic part.
- **Morphisms.** The moves: sign walking and oddity fusion.
- **Functoriality.** The symbol of a direct sum, and of a twist.
- **Comparison lemmas.** Two symbols describe isometric lattices exactly when the moves
  relate them; the symbol determines the genus; the translation to `(t₊, t₋, q)` (5A).
- **Naturality.** The symbol depends only on the isometry class of `L_p`.
- **Edge cases.** `p = 2`; determinant `±1`, where the symbol is empty; rank 0.
- **Downstream.** 3F, 3G, 5A, 7C, 7D, 9A.

### Class, genus and spinor genus (4A, 4C)

- **Constructors.** `cls L`, `cls⁺ L`, `gen L`, `spn L`, `spn⁺ L`.
- **Examples.** Genera of class number 1; the rank-16 genus with two classes (6D — that they
  are the *only* two is the successor's 7I).
- **Morphisms.** The inclusions between the five sets, and the double-coset description
  (4B).
- **Functoriality.** Behavior under twists, and under orthogonal sums where it is defined.
- **Comparison lemmas.** The count of proper spinor genera (4C). Eichler's theorem (4D) is the
  successor's, and this API is what it consumes.
- **Naturality.** The double-coset description is compatible with a change of the base
  lattice inside a genus.
- **Edge cases.** Rank 0, 1 and 2; definite and indefinite.
- **Downstream.** 4E to 4G, 7A, 9A; and the successor's 7B.

### The quadratic order of a binary lattice (B1)

- **Constructors.** From a binary Gram matrix through the primitive part of the norm form;
  from a discriminant `Δ ≡ 0` or `1 (mod 4)`.
- **Examples.** `A₂` gives content 2, `Δ = −3` and `𝒪 = ℤ[ζ₃]`; `U` gives content 2,
  `Δ = 1` and the split algebra `ℤ × ℤ`; `⟨1,−2⟩` gives content 1, `Δ = 8` and `ℤ[√2]`;
  `!![4,1;1,6]` gives content 2 and `Δ = −23`.
- **Morphisms.** Isometries of binary lattices induce isomorphisms of the associated
  orders, and proper isometries act trivially on `Pic`. An improper isometry acts by the
  conjugation of B4, which is inversion on `Pic`.
- **Functoriality.** A basis matrix `P` sends `G` to `PᵀGP`; a finite-index sublattice
  satisfies `det M = [L:M]² det L`, `𝔰(M) ⊆ 𝔰(L)`, and `𝔫(M) ⊆ 𝔫(L)`. Content
  has no formula determined solely by the index. The distinct form twist `L(a)` multiplies
  content by `|a|`.
- **Comparison lemmas.** `Δ(L) = disc f` with `disc N_L = −4 det L`; forms and invertible
  proper ideal classes (B2); composition and multiplication (B3); `SO(L)` and the norm-one
  units (B4).
- **Naturality.** The correspondence of B2 commutes with the maps induced by isometries.
- **Edge cases.** Imprimitive norm forms; square discriminants, which use the separate
  product-order branch and never `NumberFieldOrder`, `Pic`, `NarrowPic`, or ring class fields;
  the two orders with extra units, `Δ = −3` and `Δ = −4`, and non-ambiguous classes, where
  `O(L) = SO(L)`.
- **Downstream.** 2C, 4E, 4F, 7G.

### The mass (7A)

- **Constructors.** `m(gen L)` and `m⁺(gen L)`.
- **Examples.** Rank 0 gives 1 and rank 1 gives 1/2, both from 7G. The rank-8 even unimodular
  value `1/696729600` follows from the successor's 7H and is not proved here; what is proved
  here is `|O(E₈)| = 696729600` (6G), the number that value inverts.
- **Morphisms.** None: the mass is a rational number attached to a genus.
- **Functoriality.** Behavior under a positive twist. There is no formula for a direct sum,
  and that non-statement is recorded.
- **Comparison lemmas.** `m⁺ = 2m` for `rank L ≥ 1`, and `m⁺ = m = 1` in rank 0; the local
  factors of 7C and 7D. The dictionary to Siegel's `α_p` is stated with the successor's 7H.
- **Naturality.** The mass depends only on the genus.
- **Edge cases.** Ranks 0, 1 and 2 (7G).
- **Downstream.** 6D, 9A.

### The theta series (8B)

- **Constructors.** `Θ_L` for positive definite `L`, through the realization of 8A.
- **Examples.** `Θ_ℤ = jacobiTheta`; `Θ_{Iₙ}`; `Θ_{E₈}` with `r_{E₈}(2) = 240`.
- **Morphisms.** None on `Θ_L` itself. An isometry gives equality of theta series.
- **Functoriality.** `Θ_{L⊕M} = Θ_L·Θ_M`, and `Θ_{L(a)}(τ) = Θ_L(aτ)` for `a > 0`.
- **Comparison lemmas.** The q-expansion with the shell counts; the transformation law
  (8E).
- **Naturality.** Independence of the chosen realization (8A).
- **Edge cases.** Rank 0, where `Θ_L = 1`; negative definite and indefinite lattices, which
  are excluded.
- **Downstream.** 9A.

## Hard theorems: source, hypotheses, and a nearby false statement

| Theorem | Source | Hypotheses that carry the proof | A nearby false statement |
| --- | --- | --- | --- |
| Unimodular splitting (0F) | O'Meara §82 | the restriction of `β` to `M` is unimodular | "a nondegenerate restriction splits". Take `L = ℤ` with `β(x,y) = xy` and `M = 2ℤ`. Then `β|_M` is nondegenerate, `M^⊥ = 0`, and `M ⊕ M^⊥ ≠ L`. |
| Content under sublattices (B1) | Gram-matrix change of basis | the full basis matrix is retained, not only its determinant | "a finite-index sublattice multiplies content by its index". Restrict `x²+y²` on `ℤ²` to `⟨2e₁,e₂⟩`: the index is 2 but the form `4x²+y²` still has content 1. Only a form twist has the `|a|` content formula. |
| Cancellation over `ℤ` (0F) | Milnor–Husemoller II §5; Serre V.2.2 | none: the statement is false | "`L ⊕ N ≅ M ⊕ N` implies `L ≅ M`". Take `N = U`, `L = E₈²`, `M = D₁₆⁺`. Both sums are even unimodular of signature `(17,1)`, hence isometric, while `E₈² ≇ D₁₆⁺`. |
| Milgram's theorem (1I) | Nikulin Thm 1.3.3; Milnor–Husemoller App. 4 | `L` is even and nondegenerate | "every unimodular lattice has `8 ∣ t₊ − t₋`". The odd lattice `⟨1⟩` is unimodular with `t₊ − t₋ = 1`. |
| Finiteness of `O(L)` (2C) | O'Meara §102 | `L` is definite | "`O(L)` is finite for every nondegenerate `L`". `O(⟨1,−2⟩)` is infinite, being carried by the unit group of `ℤ[√2]` (B4), and 4F gives infinitude in every indefinite rank at least 3. |
| Diagonalization over `ℤ_p` (3C) | O'Meara 92:1 | `p` is odd | "every symmetric form over `ℤ_2` has an orthogonal basis". The hyperbolic plane `U` has none. |
| Two unimodular classes per rank (3C) | O'Meara 92:1a | `p` odd and rank at least 1 | "exactly two for every rank". In rank 0 there is one. |
| Uniqueness of Jordan invariants (3C) | O'Meara 91:9 | `p` is odd | "Jordan invariants are unique for every `p`". At `p = 2` they are not, which is why 3E states the moves. |
| Existence of an even lattice (5B) | Nikulin Thm 1.10.1 | conditions 3 and 4 apply exactly when `t₊ + t₋ = l(A_{q_p})` | "conditions 1 and 2 suffice". They suffice only under the strict inequality `t₊ + t₋ > l(A_q)`, which is Corollary 1.10.2. |
| Uniqueness in a genus (5C) | Nikulin Thm 1.13.2 | `t₊ ≥ 1` and `t₋ ≥ 1`, so `L` is indefinite | "the invariants `(t₊, t₋, q)` determine the isometry class". `E₈²` and `D₁₆⁺` share all three and are not isometric. |
| Surjectivity of `O(T) → O(q_T)` (5E) | Nikulin Thm 1.14.2 | `T` indefinite, and the two rank conditions | "the map is always surjective". It can fail for definite lattices, where the genus can have several classes. |
| Eichler's theorem (4D, not owned here) | O'Meara 104:5 | indefinite, and rank at least 3 | "every indefinite lattice satisfies `cls⁺ = spn⁺`". Rank 2 is excluded, and the rank-2 half of 4E — which stays here — proves that case by a different argument. |
| Strong approximation for `Spin` (not owned here) | O'Meara 104:4 | dimension at least 3, and a noncompact place | "it also proves the Tamagawa volume theorem". It does not: 7F is a separate theorem, and both belong to `OrthogonalTamagawaAndLatticeMass`. |
| The mass formula (7H, not owned here) | Conway–Sloane, eq. (2) | rank at least 2, in the stated normalization | "the formula holds in every rank". In rank at most 1 a factor 2 becomes 1, and `m` is 1/2 in rank 1 and 1 in rank 0 — which 7G proves here, so the successor must not re-derive it from the general formula. |
| The local density at 2 (7D) | Cho, Compositio 151 (2015) | residue characteristic 2, with the smoothened model | "the Conway–Sloane dyadic table proves it". The table is stated there without proof. |
| Classification in rank at most 9 (6C) | O'Meara 106:13 | rank at most 9, positive definite | "a positive definite unimodular lattice is determined by its rank and parity". Rank 16 has two even classes (6D). |
| Automorphisms of an indefinite lattice (4F) | O'Meara §104; Cassels ch. 13 | rank at least 3, and a case split on isotropy over `ℚ` | "an indefinite rational space has an isotropic vector". `x² + y² − 3z²` is indefinite over `ℝ` and anisotropic over `ℚ`, so the transvection proof covers only one case. |
| Automorphisms of a binary lattice (B4) | Pell's equation; Cassels ch. 13 | `Δ > 0` and `Δ` not a square | "an indefinite binary lattice has infinite `O(L)`". `U` has `Δ = 1`, a square, and `|O(U)| = 4`. |
| Improper binary automorphisms (B4) | Gauss; Cox §3 | the proper class of the primitive part is fixed by inversion | "`[O(L) : SO(L)] = 2` for every nondegenerate binary `L`". `!![4,1;1,6]` has `Δ = −23` and only `±e₁` of norm 4, so `O(L) = SO(L) = {±I}` has order 2, while `2·#𝒪ˣ = 4`. |
| The rank-2 mass (B8) | Gauss; Conway–Sloane §2 | the count is of **proper** classes | "`m(gen L) = h(gen L)/(2·#𝒪ˣ)` with `h` the class number". The genus of `!![4,1;1,6]` has `h = 2`, `h⁺ = 3` and `w = 2`, and its mass is `1/4 + 1/2 = 3/4 = h⁺/(2w)`, not `1/2`. |
| Eichler transvections (4F) | O'Meara §104; Cassels ch. 13 | `w` is taken modulo `ℤu`, and `N_L(w)` is even | "`w ↦ E_{u,w}` is injective on a finite-index subgroup of `u^⊥ ∩ L`". `E_{u,w+au} = E_{u,w}` for every `a`, and every finite-index subgroup contains a nonzero multiple of `u`. |
| The odd local density type (7C) | Conway–Sloane §12; Gan–Yu Thm 7.3 | `ε` is the type of the reduction, `((−1)^m det | p)` | "`ε = +1` exactly when `det L_p` is a square". The hyperbolic plane over `p = 3` has `det = −1`, a nonsquare, and is split, with `α_3 = 4/3`. |
| Cho's dyadic formula (7D) | Cho Thm 5.2 with Lemma 5.1 | the exponent `N = N_Q − N_M` and the index `[O : SO]` | "`α_2(L) = 2^{−n(n−1)/2}·#𝒢̃_L(𝔽_2)`". `N` is generally nonzero, and `β_L` carries `[O(V,q) : SO(V,q)]⁻¹`. |
| Proper against full mass (7A) | Conway–Sloane §2 | `rank L ≥ 1` | "`m⁺ = 2m` always". In rank 0 both masses are 1, because `O(L) = SO(L) = 1`. |
| Rank-16 completeness (7I, not owned here) | Witt; Conway–Sloane §9 | the mass formula and both automorphism orders | "the two classes are known to exhaust the genus once they are constructed". 6D proves only that the two exist, lie in one genus, and differ; completeness waits for `OrthogonalTamagawaAndLatticeMass`. |
| Theta convergence (8B) | Poisson summation; `ZLattice` summability | `L` is positive definite | "the theta series of a definite lattice converges". For a negative definite lattice the terms are unbounded. |

## Worked examples

Each example is discharged with the milestone that owns it. Each one catches a wrong
factor of 2, a wrong sign, or a vacuous definition.

- `⟨1⟩ = ℤ`: odd, unimodular, and `Θ_ℤ = jacobiTheta` (0G, 8C).
- `U`: even, `det = −1`, signature `(1,0,1)`, level 1, `A_U = 0`, and not diagonalizable over
  `ℤ_2`; its primitive binary discriminant is `1`, so its algebra/order branch is explicitly
  `ℚ × ℚ`/`ℤ × ℤ`, with one split proper class and `|O(U)| = 4` (0G, 3D, B1--B5).
- The index-two sublattice `⟨2e₁,e₂⟩ ≤ ℤ²` restricts `x²+y²` to `4x²+y²`; its content
  remains 1 although the determinant is multiplied by 4 (0C, B1).
- `⟨-2⟩` is negative definite of signature `(0,0,1)`; the zero rank-one form is
  degenerate of signature `(0,1,0)` and has zero radical quotient (0G, 1K).
- Affine `Ã₁` with Gram `!![2,-2;-2,2]` is even and positive-semidefinite of signature
  `(1,1,0)`, and its radical quotient is `A₁=⟨2⟩` (0E, 0G).
- `A₂`: even, `det = 3`, level 3, and `A_{A₂} ≅ ℤ/3` with half-norm
  `q = 1/3` in `ℚ/ℤ`. Its 3-adic
  Jordan splitting has two rank-one constituents, of scales 1 and 3. Equality holds in
  Hermite's bound, and the class number is 1 (0G, 1D, 2E, 3B, 4A). Its order is `ℤ[ζ₃]`,
  with `Δ = −3` and six units, and its class is ambiguous, so `|SO(A₂)| = 6`,
  `|O(A₂)| = 12` and the mass of its genus is `1/12` (B1, B4, B8).
- `!![4,1;1,6]`: content 2, `Δ = −23`, and `O(L) = SO(L) = {±I}`, so it has no improper
  automorphism. Its genus has three proper classes and two classes, `!![2,1;1,12]` with
  `|O| = 4` and `!![4,1;1,6]` with `|O| = 2`, and mass `3/4`. The lattice `!![3,1;1,4]`, of
  determinant 11 and `Δ = −44`, is the same phenomenon at the smallest determinant
  (B4, B8).
- The family `Aₙ`: `det(Aₙ) = n+1` and `A_{Aₙ} ≅ ℤ/(n+1)` (0G, 1C).
- `D₈⁺`: the preimage of the spinor subgroup in `A_{D₈}` is proved even and unimodular
  by the general isotropic-subgroup correspondence and Lagrangian criterion, then identified
  with `E₈` by an explicit isometry; its trivial discriminant group is also computed as
  `H^⊥/H` (1K).
- `E₈`: even, unimodular, positive definite, `min = 2`, 240 minimal vectors, signature
  `(8,0)`, `sign q_{E₈} = 0`, unique in rank 8, and `|O(E₈)| = 696729600` (0G, 2B, 2C, 6C, 6G).
  Its mass `1/696729600` is the successor's 7H.
- Even unimodular lattices have `8 ∣ t₊ − t₋`, so no even unimodular positive definite
  lattice has rank 1 to 7 (1I, 6B).
- Rank 16: `E₈²` and `D₁₆⁺` lie in one genus and are not isometric (6D). That they *exhaust* the
  genus is 7I, and is the successor's.
- `Λ_{K3} = U³ ⊕ E₈(−1)²`: even, unimodular, signature `(3,19)`, `det = −1`, and unique
  with that signature. For `d > 0` the lattice `⟨2d⟩` embeds primitively, and uniquely up
  to `O(Λ_{K3})`. Every even lattice of signature `(1, ρ−1)` with `ρ ≤ 10` embeds
  primitively (5G, 5H, 6A).
- One LMFDB record checked end to end: `A₂`, and one rank-4 lattice with a nontrivial
  2-adic symbol (9A).
- Mass conventions: rank 0 gives 1, and the genus of `⟨a⟩` gives 1/2 (7G).

## Ordering and parallelism

Layer 0 comes first. After it, three groups of milestones are independent of each other:

- Layer 2, which needs no dual lattice;
- Layer 1;
- milestones 3A to 3E.

The rest of the order follows the prerequisite tables:

- milestones 3F to 3H need Layer 1 and the two suppliers named in their table;
- Layer B needs Layers 0 to 3; its nonsquare branch also needs the order and Picard carriers
  of Global Number Fields and, for negative discriminant, Class Field Theory's
  ring-class-field milestone. The square branch is elementary. Layers 4 and 7 use both
  rank-2 branches;
- Layer 4 needs Layers 2, 3 and B, and the Orthogonal and Spin Groups roadmap;
- Layer 5 needs Layers 1 and 3;
- Layer 6 needs Layers 1, 2 and 5, and milestone 6C also needs Root Systems;
- Layer 7's own milestones — 7A, 7C, 7D, 7E and 7G — need Layers 2, 3, 4 and B, and nothing
  adelic; 7B, 7F, 7H and 7I are `OrthogonalTamagawaAndLatticeMass`'s and are ordered after the
  generic `TamagawaMeasures`;
- milestones 8A to 8C need Layers 0 to 2; 8D and 8E consume L-functions Layer 1's
  analytic dual/covolume and Gaussian theta milestones, and L-functions consumes nothing back;
- Layer 9 comes last.

The shortest route to the K3 results is `0 → 1 → 5`, together with the comparison 5A. That
route uses no milestone of Layers 2, 4, 6, 7 or 8.

## References

- J. H. Conway, N. J. A. Sloane, *Low-dimensional lattices. IV. The mass formula*, Proc. R.
  Soc. Lond. A 419 (1988) 259–285. This is the source for Layer 7:
  - equation (1) for the mass, and equations (2) and (3) for the formula;
  - section 5 for the species and octane tables;
  - equations (6) to (9), (13), (15) and (16) for the standard mass;
  - sections 3 and 6 for the dimension guard;
  - section 12 for the dictionary to Siegel's densities.
- S. Cho, *Group schemes and local densities of quadratic lattices in residue characteristic
  2*, Compositio Math. 151 (2015) 793–827. The proof of the dyadic local density formula
  used in 7D: Definition 2.1 for the parity types; section 2.3 for bound and free
  constituents; Theorem 4.12 with Remark 4.13 for the maximal reductive quotient of the
  special fiber; Lemma 5.1 for `N_M` and `N_Q`; Theorem 5.2 for the density; Remark 5.3 for
  the count `#𝒢̃_L(κ)` through the unipotent radical.
- W. T. Gan, J.-K. Yu, *Group schemes and local densities*, Duke Math. J. 105 (2000)
  497–524. The smooth-model formulation of the local density that Cho extends to `p = 2`;
  its Theorem 7.3 is the odd-residue-characteristic value used in 7D to pin the constant
  between Cho's normalization and the limit definition of 7C.
- D. Allcock, I. Gal, A. Mark, *The Conway–Sloane calculus for 2-adic lattices*,
  arXiv:1511.04614. The proof of the symbol calculus and the corrected canonical form, used
  in 3E.
- V. V. Nikulin, *Integer symmetric bilinear forms and some of their geometric
  applications*, Izv. Akad. Nauk SSSR 43 (1979) 111–177; translation Math. USSR-Izv. 14
  (1980) 103–167. Source for Layers 1 and 5: Theorem 1.3.3 (1I); Propositions 1.8.1 and
  1.8.2 (1G); Proposition 1.11.2 and Theorem 1.11.3 (1H); Corollary 1.9.4 (5A); Theorem
  1.10.1 and Corollary 1.10.2 (5B); Theorems 1.13.1 and 1.13.2 with Corollary 1.13.3 (5C);
  Corollaries 1.13.4 and 1.13.5 (5D); Proposition 1.14.1 and Theorem 1.14.2 (5E); Theorems
  1.12.2 and 1.12.4 with Corollary 1.12.3 (5G); Theorem 1.14.4 (5H); Proposition 1.15.1 and
  Corollary 1.15.2 (5I); Theorems 3.6.2 and 3.6.3 (5J).
- O. T. O'Meara, *Introduction to Quadratic Forms*, Grundlehren 117, Springer (1963). This
  is the source for Layers 0, 3, 4 and 6:
  - section 82E (0D);
  - section 91C with 91:9 (3B, 3C), and 92:1 to 92:2 (3C);
  - sections 93A and 93E with 93:16, 93:28 and 93:29 (3D);
  - section 102A with 102:7 (4A, 4C);
  - 103:4 (2G, 4E), and 104:5 (4D);
  - 105:1 and 106:13 (6C), and 106:1 (6B).
- J.-P. Serre, *A Course in Arithmetic*, GTM 7, Springer (1973), Chapter V. Source for 1I,
  6A and 7H: V.1.3.5, V.1.4.3, V.2 Theorem 2 with Corollary 1, V.2.2, and V.2.3. The
  uniqueness of `E₈` is derived there from a mass formula that the chapter does not prove,
  so 6C uses O'Meara's proof instead.
- J. Milnor, D. Husemoller, *Symmetric Bilinear Forms*, Ergebnisse 73, Springer (1973).
  Chapter II for 6A, and Appendix 4 for 1H and 1I.
- J. H. Conway, N. J. A. Sloane, *Sphere Packings, Lattices and Groups*, 3rd ed.,
  Grundlehren 290, Springer (1999):
  - Chapter 2 for theta series, and Chapter 4 for root lattices and the `Dₙ⁺`
    constructions;
  - Chapter 15 for genus symbols, with the correction cited above;
  - Chapter 16 for unimodular masses;
  - Chapters 17 and 18 for Niemeier lattices, and Chapters 26 and 27 for the Leech
    lattice.
- J. W. S. Cassels, *Rational Quadratic Forms*, Academic Press (1978). Chapters 8 and 9 for
  Layer 3, Chapters 10 and 11 for Layer 4, and Chapter 13 for the binary theory used in 4E.
- W. Ebeling, *Lattices and Codes*, 3rd ed., Springer (2013). Discriminant forms, the
  classification in rank at most 24, and Niemeier lattices through glue codes.
- Y. Kitaoka, *Arithmetic of Quadratic Forms*, Cambridge Tracts 106, CUP (1993). The
  Minkowski–Siegel apparatus for Layer 7, and theta background for Layer 8.
- M. Kneser, *Quadratische Formen*, revised with R. Scharlau, Springer (2002). Neighbors and
  class numbers for Layer 4.
- J. Voight, *Kneser's method of neighbors*, arXiv:2308.11566. An algorithmic reference for
  4G.
- G. Chenevier, J. Lannes, *Automorphic Forms and Even Unimodular Lattices*, Ergebnisse 69,
  Springer (2019). Background for 6E.
- T. Kirschmer, *Definite quadratic and hermitian forms with small class number*,
  Habilitation, RWTH Aachen (2016). Tables of one-class genera and masses, used to validate
  9A.
