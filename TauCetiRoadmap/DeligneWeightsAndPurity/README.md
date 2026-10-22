# Roadmap: Deligne weights, purity and the Weil bounds

**Summary.** Build the arithmetic of Frobenius eigenvalues, then weights of sheaves and
complexes, cohomological purity, geometric semisimplicity and absolute hard
Lefschetz. The resulting API serves point counting, exponential sums, arithmetic
representations, rigid coefficients and finite-field equidistribution.

There are two purity arguments. The Rosati estimate, symplectic tensor powers,
rational pencil factors and Cartesian powers give smooth projective purity.
Local monodromy and square improvement give sharp curve-coefficient purity,
which supplies the general direct-image theorem.

Suggested homes are `TauCeti/LinearAlgebra/Weights/`,
`TauCeti/AlgebraicGeometry/Weights/` and
`TauCeti/AlgebraicGeometry/Lefschetz/`. API names are relative to
`TauCeti.Weights`, except in DWP.9, where they are relative to
`TauCeti.HardLefschetz`. [Suggested.lean](Suggested.lean) states constant-coefficient
zeta rationality (§1.10), degree-factor extraction (§4.4), and graded Lefschetz
decomposition and pairings (§9.7). Its definitions use native scheme, polynomial
and vector-space carriers. The other interface names below specify mathematical
library targets; the mathematics in this README is definitive.

## Scope and ownership

This roadmap owns the real-base scalar adapter, ordinary Frobenius and
fixed-`ι` weights, punctual and determinantal weights, local bounds,
weight–monodromy on finite-field curves, the purity theorems, mixed-complex
estimates, weight filtrations, geometric semisimplicity, absolute Lefschetz and
the weight-facing arithmetic and distribution exports of DWP.10.
Section `9.7` owns the arbitrary-field graded-vector-space primitive kernel,
decomposition and compatible-pairing core. StandardConjectures Layers `0`–`1`
consume this core through the natural-grading comparison in §9.7 and package it
in their characteristic-zero Lefschetz structures, with their additional `sl₂`,
lowering-operator and grade-projector theory. There is no dependency in the reverse direction.

Use the scheme geometry of SchemeAndStackFoundations Layers `0`–`2`. Import finite
cohomology, base change and Frobenius comparisons from EtaleCohomologyFoundations
§§F.0–F.4, F.10.1–F.10.5; geometric trace formulae from
InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4; coefficient categories, Tate twists, six operations,
duality, cycle classes and weak Lefschetz from EtaleCohomologyFoundations §§F.0–F.7;
arithmetic-model approximation from SchemeAndStackFoundations §0.9 and
LefschetzPencilsAndVanishingCycles §§7b.3, 7b.7;
trait inertia from EtaleCohomologyFoundations §F.3a;
pencils and vanishing cycles from LefschetzPencilsAndVanishingCycles §§0.2–5, with
semistable curves and invariant cycles from §§7a–7b. Polarizations, Rosati positivity and
endomorphism polynomials and the Rosati–Frobenius identity come from AbelianSchemesAndArithmeticModuli §§A2.5, A3.9, A6.10–A6.14, A6.21,
with Tate/Galois realization from ArithmeticGaloisRepresentations §§6.1–6.2 and
`H¹`/Tate comparison from AbelianSchemesAndArithmeticModuli §A4.4 / exteriorCohomology.

This roadmap constructs rational finite-field zeta functions (§1.10), extraction
of integral degree factors and their independence of `ℓ` (§4.4), component-aware
point-count bounds (§10.2), and smooth proper Deligne–Mumford-stack purity (§8.24).
Section `1.10` also owns the cohomological Euler products and rational `L`-functions
of finite-model constructible coefficients; the geometric trace identities it
uses belong to InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4.
ArithmeticGaloisRepresentations §2.6 owns the canonical natural-base scalar
predicate `WeilDeligneRep.IsWeilNumber`, the monodromy filtration and
Weil–Deligne purity. Here `IsWeilNumber` is its real-base adapter with the
additional condition `q>1`. Section `0.19` owns their comparison for natural `q≥2`
and the comparison of ordinary Frobenius purity with monodromy-graded purity;
ordinary purity agrees with Weil–Deligne purity when `N=0`. Rigid coefficient
categories, relative hard Lefschetz and decomposition are outside this roadmap;
perverse carriers used here are supplied by EtaleCohomologyFoundations §F.8.

Import the existing Hasse theorem, Abel–Jacobi construction, symplectic invariant
theory, reductive groups and compact representation theory. The contracts identify the base-point-free Picard and curve/Jacobian comparisons.
Sections `3.6`–`3.7`, `5.15` and `10.6` supply the extra measure, curve-reduction and elliptic-monodromy
comparisons needed by the weight arguments.

## Conventions

- Use geometric Frobenius, with scalar `q⁻¹` and weight `−2` on `ℚ_ℓ(1)`. At a
  closed point of degree `e` use `q_x=q^e`. Finite base extension replaces
  `(q,F)` by `(q^r,F^r)`, preserving weight.
- Integer Weil weights require algebraicity and the common modulus at every
  complex conjugate; integrality is separate. Fixed-`ι` real weights are
  `2 log_q|ια|` for `α≠0`. The chosen coefficient embedding is neither canonical
  nor `ℓ`-adically continuous.
- Characteristic roots are multisets, with multiplicities from generalized
  eigenspaces. Purity allows Jordan blocks. Transpose preserves roots;
  contragredient means inverse transpose.
- Arbitrary scalar twists give Weil lines; étale descent retains the unit and
  continuity conditions. Half twists require a square-root choice. Tate twist `r`
  subtracts `2r` from weight.
- `Hⁱ(K[m])=Hⁱ⁺ᵐ(K)`. On a smooth base, a lisse sheaf of punctual weight `β`
  gives complex weight `β+m−2r` after `[m](r)`. Upper bounds use cohomology
  stalks; lower bounds use Verdier duality, retaining dimension/Tate shifts.
- Keep normality, lissity, geometric connectedness and arithmetic witnesses
  wherever stated. Geometric semisimplicity does not give arithmetic
  semisimplicity. Potential purity includes an explicit model.
- Stalk Newton polygons sort slopes `v(α)/v(q)` with multiplicity. Newton couples
  normalize `v(q)=1` and record `(v(α),v(q^n/α))` for weight `n`. Keep branch
  orientation lines and alternating-pairing signs.

## Exact supplier contracts

### From Mathlib and Tau Ceti

Use these declarations in their existing namespaces, at Mathlib `6b7abb3` and Tau Ceti `a91d3aa`.

<a id="input-b1"></a>

- [minpoly.algHom_eq](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/FieldTheory/Minpoly/Basic.lean): Minimal polynomials are unchanged by injective algebra maps.

<a id="input-b2"></a>

- [IsAlgClosed.lift](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/FieldTheory/IsAlgClosed/Basic.lean): Algebraic domain algebras embed in an algebraically closed field with the prescribed base algebra structure.

<a id="input-b3"></a>

- [NumberField.Embeddings.pow_eq_one_of_norm_eq_one](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/NumberTheory/NumberField/InfinitePlace/Embeddings.lean): An algebraic integer whose complex embedding norms are `1` is a root of unity.

<a id="input-b4"></a>

- [IsAlgClosed.cardinal_eq_cardinal_transcendence_basis_of_aleph0_lt](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/FieldTheory/IsAlgClosed/Classification.lean): An uncountable algebraically closed field has a transcendence basis of its cardinality over a countable base.

<a id="input-b5"></a>

- [Cardinal.mk_complex](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Analysis/Complex/Cardinality.lean): The cardinality of `ℂ` is `𝔠`.

<a id="input-b6"></a>

- [IsAlgClosed.equivOfTranscendenceBasis](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/FieldTheory/IsAlgClosed/Classification.lean): Equipotent transcendence bases yield a ring equivalence; compatibility with a prescribed base embedding is a separate target.

<a id="input-b7"></a>

- [IsAlgClosed.ringEquiv_of_equiv_of_charZero](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/FieldTheory/IsAlgClosed/Classification.lean): Equal-cardinality uncountable algebraically closed characteristic-zero fields are isomorphic.

<a id="input-b8"></a>

- [Algebra.IsAlgebraic.cardinalMk_le_max](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/Algebraic/Cardinality.lean): An algebraic extension has cardinality bounded by `max(#R,ℵ₀)`.

<a id="input-b9"></a>

- [LinearMap.charpoly_baseChange](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/LinearAlgebra/Charpoly/BaseChange.lean): Characteristic polynomials commute with scalar extension for finite free modules.

<a id="input-b10"></a>

- [Module.End.hasEigenvalue_iff_isRoot_charpoly](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/LinearAlgebra/Eigenspace/Charpoly.lean): Eigenvalues are characteristic roots over a domain.

<a id="input-b11"></a>

- [LinearMap.finrank_maxGenEigenspace_eq](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/LinearAlgebra/Eigenspace/Zero.lean): Generalized eigenspace dimension equals root multiplicity.

<a id="input-b12"></a>

- [Module.End.iSup_maxGenEigenspace_eq_top](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/LinearAlgebra/Eigenspace/Triangularizable.lean): Generalized eigenspaces span over an algebraically closed field.

<a id="input-b13"></a>

- [Module.End.independent_maxGenEigenspace](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/LinearAlgebra/Eigenspace/Basic.lean): Distinct generalized eigenspaces are independent.

<a id="input-b14"></a>

- [Matrix.charpoly_fromBlocks_zero₂₁](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean): Block triangular characteristic polynomials multiply.

<a id="input-b15"></a>

- [LinearMap.charpoly_prodMap](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/LinearAlgebra/Charpoly/ToMatrix.lean): Product-map characteristic polynomials multiply.

<a id="input-b16"></a>

- [Matrix.reverse_charpoly](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean): The reversed characteristic polynomial is `det(1−tM)`.

<a id="input-b17"></a>

- [Matrix.trace_eq_sum_roots_charpoly](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/LinearAlgebra/Matrix/Charpoly/Eigs.lean): Trace is the sum of characteristic roots over an algebraically closed field.

<a id="input-b18"></a>

- [Matrix.charpoly_inv](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean): The inverse characteristic polynomial is expressed by reversal and determinant.

<a id="input-b19"></a>

- [Matrix.det_kronecker](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/LinearAlgebra/Matrix/Kronecker.lean): The Kronecker-product determinant formula.

<a id="input-b20"></a>

- [LinearMap.trace_tensorProduct'](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/LinearAlgebra/Trace.lean): Tensor-map traces multiply for finite free modules.

<a id="input-b21"></a>

- [LinearMap.det_dualMap](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/LinearAlgebra/Determinant.lean): Ordinary transpose preserves determinant; a contragredient first takes the inverse.

<a id="input-b22"></a>

- [Polynomial.isCoprime_iff_aeval_ne_zero_of_isAlgClosed](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/FieldTheory/IsAlgClosed/Basic.lean): Coprime polynomials have no common algebraic-closure root.

<a id="input-b23"></a>

- [LinearMap.aeval_self_charpoly](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/LinearAlgebra/Charpoly/Basic.lean): Cayley–Hamilton.

<a id="input-b24"></a>

- [Polynomial.sup_ker_aeval_eq_ker_aeval_mul_of_coprime](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/Polynomial/Basic.lean): Coprime polynomial kernels sum to the product kernel.

<a id="input-b25"></a>

- [AddValuation](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/Valuation/Basic.lean): Existing additive valuations with `v(0)=∞` and additive product law.

<a id="input-b26"></a>

- [Multiset.sort](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Data/Multiset/Sort.lean): Sorted multisets, preserving multiplicities.

<a id="input-b27"></a>

- [MonoidHom.eqLocus](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Algebra/Group/Subgroup/Ker.lean): Equalizer subgroup of two group homomorphisms.

<a id="input-b28"></a>

- [exteriorPower.map](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/LinearAlgebra/ExteriorPower/Basic.lean): Functorial maps on exterior powers.

<a id="input-b29"></a>

- [Module.Basis.exteriorPower](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/LinearAlgebra/ExteriorPower/Basis.lean): Exterior-power basis from a linearly ordered basis.

<a id="input-b30"></a>

- [Representation](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RepresentationTheory/Basic.lean): Group/monoid representations by linear endomorphisms.

<a id="input-b31"></a>

- [Representation.asModule](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RepresentationTheory/Basic.lean): The corresponding monoid-algebra module.

<a id="input-b32"></a>

- [Representation.invariants](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RepresentationTheory/Invariants.lean): The invariant submodule.

<a id="input-b33"></a>

- [IsSemisimpleModule](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/SimpleModule/Basic.lean): Semisimplicity as a complemented submodule lattice.

- [Representation.IsSemisimpleRepresentation](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RepresentationTheory/Semisimple.lean) and `Representation.isSemisimpleRepresentation_iff_isSemisimpleModule_asModule`: semisimplicity of a representation and its equivalence with semisimplicity of the associated monoid-algebra module.

<a id="input-b34"></a>

- [LinearMap.BilinForm.Nondegenerate](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/LinearAlgebra/BilinearForm/Properties.lean): Bilinear forms separating on both sides.

<a id="input-b35"></a>

- [LinearMap.BilinForm.restrict](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/LinearAlgebra/BilinearForm/Basic.lean): Restriction of a bilinear form.

<a id="input-b36"></a>

- [LinearMap.BilinForm.IsAlt](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/LinearAlgebra/BilinearForm/Properties.lean): Alternation `B(x,x)=0`.

<a id="input-b37"></a>

- [LinearMap.BilinForm.restrict_nondegenerate_iff_isCompl_orthogonal](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/LinearAlgebra/BilinearForm/Orthogonal.lean): Over a finite-dimensional field space with reflexive form, nondegenerate restriction is equivalent to complementarity with the orthogonal.

<a id="input-b38"></a>

- [DirectSum.IsInternal](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Algebra/DirectSum/Basic.lean): Internal direct sums via bijectivity of the canonical map.

<a id="input-b39"></a>

- [LinearMap.ker](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Algebra/Module/Submodule/Ker.lean): Linear-map kernels.

<a id="input-b40"></a>

- [Module.finrank](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/LinearAlgebra/Dimension/Finrank.lean): Finite dimension.

<a id="input-b41"></a>

- [TauCeti.Representation.isSemisimpleRepresentation_comp_subtype](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/RepresentationTheory/Induction/Clifford/Basic.lean): An irreducible finite-dimensional representation restricts semisimply to a normal subgroup over any field; apply summandwise to a semisimple representation.


- [LinearMap.BilinForm.IsAlt.even_finrank](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/LinearAlgebra/BilinearForm/SymplecticBasis.lean): a nondegenerate alternating form on a finite-dimensional space has even dimension over every field, including characteristic two. Alternation means `B(x,x)=0`; skew symmetry alone is insufficient in characteristic two. This is the parity input for §9.9 (Weil II, Corollary 4.1.5, `p`. `218`).

- [Even.pow_nonneg](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Algebra/Order/Ring/Basic.lean): even powers are nonnegative in an ordered ring, including the rational traces in §2.5.

- [MonoidHom.mrange](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Algebra/Group/Submonoid/Operations.lean) and `MonoidHom.mem_mrange`: use the image submonoid of the geometric representation directly. Membership is existence of a represented geometric group element; every such endomorphism is invertible. The image and its Zariski closure are distinguished throughout §8.14.

### From other roadmaps

Each citation identifies its mathematical interface and retains its supplying section’s hypotheses. A roadmap target is a dependency to build in Tau Ceti; it does not assert that its carrier is already in the pinned libraries.

<a id="input-e1"></a>

#### AbelianSchemesAndArithmeticModuli §A2.5 (Polarization)

A polarization defined over the finite ground field, whose duality map is compatible with Frobenius. Uses: [1.2](#target-1-2).

<a id="input-e2"></a>

#### AbelianSchemesAndArithmeticModuli §A3.9 (Polarization.rosati)

Use the Rosati anti-involution defined by the chosen polarization; its dual-isogeny and rational-endomorphism normalization is fixed in that section.

<a id="input-e3"></a>

#### AbelianSchemesAndArithmeticModuli §A6.10 (`exists_charpoly`, `End.trace`)

Use the integral monic degree-`2g` characteristic polynomial and its algebraic trace, distinct from the minimal polynomial.

<a id="input-e4"></a>

#### AbelianSchemesAndArithmeticModuli §A6.11 (charpolyTate)

Identify that characteristic polynomial with the action on the prime-to-characteristic rational Tate module.

<a id="input-e5"></a>

#### AbelianSchemesAndArithmeticModuli §A6.1 `(Hom.deg)`

Use scheme-theoretic isogeny degree, with `deg(1−π^m)` equal to the separable kernel size.

<a id="input-e6"></a>

#### AbelianSchemesAndArithmeticModuli §A6.14 (rosatiPositivity)

Use positivity of `(α,β) ↦ Tr(αβ†)` on rational endomorphisms.

<a id="input-e7"></a>

#### AbelianSchemesAndArithmeticModuli §A6.12 (trace and degree through a subfield)

On a commutative subfield of the endomorphism algebra use the supplier’s trace and norm-degree identities.

<a id="input-e8"></a>

#### SchemeAndStackFoundations §0.9 and LefschetzPencilsAndVanishingCycles §§7b.3, 7b.7 (Noetherian approximation and arithmetic models)

Noetherian approximation of finite-presentation geometry and finite coefficient data, including projective embeddings and smooth/proper pure-dimensional models. Refine a supplied arithmetic sheaf/complex model over a dense regular open; existence of an arbitrary `ℓ`-adic model is not assumed. Uses: [7.6](#target-7-6), [8.20](#target-8-20), [8.21](#target-8-21), [8.22](#target-8-22), [9.4](#target-9-4).
For complexes, consume `InvariantCycles.GeometricGenericArithmeticModel`: its
base point lies over the generic point and its family and complex have explicit
fibre identifications. Section `8.20` defines potential complex purity by purity
of the total arithmetic complex in §8.13 and supplies the smooth/lisse comparison
from fibrewise punctual purity. The general `ArithmeticModel` and `PotentiallyHas`
interfaces retain their separate closed-fibre contract.

<a id="input-e11"></a>

#### ArithmeticGaloisRepresentations §§1.1–1.6, `6.1`–`6.2` (finite coefficient models, lattices and Tate realizations)

ArithmeticGaloisRepresentations §§6.1–6.2 supplies the continuous Tate realization and its action, including arithmetic Frobenius `π_A`. Section `1.5` supplies descent to finite coefficient fields; EtaleCohomologyFoundations §F.4.0 (`exists_stable_lattice_iff`, `GaloisLattice.IntegralModel.nonempty`), realized in §1.6, supplies stable lattices for compact groups. For Weil systems compactness is imposed on the geometric image. AbelianSchemesAndArithmeticModuli §A4.4 / exteriorCohomology supplies `H¹_et(A,ℤ_ℓ)≅Hom(T_ℓA,ℤ_ℓ)`, compatibly with pullback, scalar extension and coefficient reduction. Scheme/descent Frobenius is compared through EtaleCohomologyFoundations §§F.10.2–F.10.2b. Uses: [1.4](#target-1-4), [1.7](#target-1-7), [5.2](#target-5-2), [5.7](#target-5-7), [5.15](#target-5-15).

<a id="input-agr-purity"></a>

#### ArithmeticGaloisRepresentations §2.6 (scalar Weil numbers and monodromy-graded purity)

Use the canonical natural-base `WeilDeligneRep.IsWeilNumber`, its predicates
`WeilDeligneRep.IsPureEnd` and `WeilDeligneRep.IsPure`, and its centered
`WeilDeligneRep.monodromyFiltration`. The supplier owns the filtration's
kernel/image formula, conjugation and nonzero-scaling invariance. On a
finite-dimensional characteristic-zero
space, nilpotent `N` and invertible `F` satisfying `NF=qFN` give `F`-stable filtration
steps. Section `0.19` here owns the scalar and graded-piece comparisons with DWP
purity for natural `q≥2`, including the scalar-extension identifications of the
graded quotients. Uses: [0.19](#target-0-19), [10.1](#target-10-1).

<a id="input-e12"></a>

#### EtaleCohomologyFoundations §§F.0–F.4 (constructible derived coefficients, base change and finiteness)

Constructible adic and rational coefficient categories from constructible integral models, finite coefficient extension, and the Tate line with geometric Frobenius `q⁻¹`; Weil descent is constructed in §5.2 here. Compare inverse arithmetic action on roots of unity. Uses: [0.15](#target-0-15), [5.12](#target-5-12), [5.2](#target-5-2), [5.3](#target-5-3).

Bounded constructible derived categories and cohomology sheaves over finite fields and `ℤ[1/ℓ]`; six operations, localization and Leray/Künneth with finite filtrations. The profinite-`π₁` description of lisse rational objects applies to the full subcategory admitting a global lisse integral lattice over a finite coefficient field; it includes every lisse object on a normal scheme. General lisse objects remain in the constructible category, with integral models that need only be constructible. For Weil sheaves the lattice condition concerns the underlying geometric sheaf. Include vanishing positive local `Ext` for lisse sheaves, generic constructibility/base change, tame `j_*` and monodromy base change, `Hⁱ_c=0` for `i>2dim X`, and finite evaluations detecting `H⁰`. Uses: [7.1](#target-7-1), [7.3](#target-7-3), [7.4](#target-7-4), [7.5](#target-7-5), [7.7](#target-7-7), [7.10](#target-7-10), [8.1](#target-8-1), [8.3](#target-8-3), [8.4](#target-8-4), [8.5](#target-8-5), [8.8](#target-8-8), [8.11](#target-8-11), [8.14](#target-8-14), [8.15](#target-8-15), [8.17](#target-8-17), [8.18](#target-8-18), [8.19](#target-8-19), [8.24](#target-8-24), [9.1](#target-9-1), [9.10](#target-9-10).

<a id="input-e13"></a>

#### EtaleCohomologyFoundations §§F.0, `F`.`4` (constructible coefficients and adic realization)

Change finite coefficient fields and compatible integral lattices before rational adic realization.

<a id="input-e14"></a>

#### EtaleCohomologyFoundations §§F.0.3, F.10.1–F.10.2b (Tate twists and Frobenius)

Use the invertible Tate line, with geometric Frobenius `q⁻¹` and integer tensor/inverse powers.

<a id="input-e15"></a>

#### EtaleCohomologyFoundations §F.5 (exceptional inverse image and Verdier duality)

Exceptional inverse image right adjoint to `Rf_!`, dualizing objects, biduality and exchange with the four image functors over the stated bases. Include `D(K⊗L)=RHom(K,DL)`, perfect compact/ordinary cohomology duality, and `i^!ℚ_ℓ=ℚ_ℓ(−1)[−2]` at a closed point of `Spec ℤ[1/ℓ]`. Uses: [7.15](#target-7-15), [8.2](#target-8-2), [8.5](#target-8-5), [8.9](#target-8-9), [8.10](#target-8-10), [8.11](#target-8-11), [8.12](#target-8-12), [8.13](#target-8-13), [9.10](#target-9-10).

<a id="input-e16"></a>

#### EtaleCohomologyFoundations §§F.5–F.6 (smooth purity and Poincaré duality)

Smooth dualizing object `ℚ_ℓ(N)[2N]`, perfect compact/ordinary cohomology pairings and relative traces compatible with base change. For any smooth relative-dimension-`e` morphism, including singular target, `Rf^!L=f*L(e)[2e]`. Uses: [7.12](#target-7-12), [7.14](#target-7-14), [7.15](#target-7-15), [8.2](#target-8-2), [8.3](#target-8-3), [8.5](#target-8-5), [8.9](#target-8-9), [8.10](#target-8-10), [8.13](#target-8-13), [9.1](#target-9-1), [9.3](#target-9-3), [9.4](#target-9-4), [9.6](#target-9-6), [9.8](#target-9-8), [alternating-form parity](#exact-supplier-contracts), [9.12](#target-9-12), [7.10](#target-7-10), [9.10](#target-9-10).

<a id="input-e17"></a>

#### EtaleCohomologyFoundations §§F.5–F.6, `0.11` (curve duality)

Use the perfect pairing on `H¹(C,j_*ℱ)`, dual to `H¹(C,j_*ℱ∨)(1)`; retain smooth `C` and lisse coefficients on its dense open.

<a id="input-e18"></a>

#### EtaleCohomologyFoundations §§F.4–F.6 (rational adic Poincaré duality)

Use Frobenius-equivariant perfect compact/ordinary rational cohomology pairings for smooth pure-dimensional schemes.

<a id="input-e19"></a>

#### EtaleCohomologyFoundations §§F.3, `F`.`5`–`F`.`6` (extreme-degree curve cohomology)

For smooth affine curves identify `H²_c` with geometric coinvariants twisted by `(−1)`, and `H⁰` with invariants; a nonzero lisse system has `H⁰_c=0`.

<a id="input-e20"></a>

#### EtaleCohomologyFoundations §§F.6, F.10.2–F.10.2b (equivariant pairings and traces)

Keep the Galois action on the trace line; pairings have their stated Tate twist.

<a id="input-e21"></a>

#### EtaleCohomologyFoundations §§F.5–F.6 (lisse tensor–`Hom` and curve duality)

Use the lisse tensor–`Hom` adjunction and the induced perfect curve pairings.

<a id="input-e22"></a>

#### EtaleCohomologyFoundations §§F.6–F.7 (cycle classes and projective-space cohomology)

Frobenius-equivariant projective-space and multiplicative-group cohomology, compact support and duality, in the shared Tate convention. These computations are used downstream in
AutomorphicLFunctionsAndLocalFactors §AL.3,
[the weight-facing acceptance suite](../AutomorphicLFunctionsAndLocalFactors/README.md#weight-facing-acceptance-suite).

First Chern classes, pullback/base-change and additivity; divisor cycle classes and Gysin maps with projection/trace formulas; `Tr(c₁(L)^n)=deg_L(X)`. Uses: [9.1](#target-9-1), [9.3](#target-9-3), [9.4](#target-9-4).

<a id="input-e23"></a>

#### EtaleCohomologyFoundations §F.7 (blow-ups and weak Lefschetz)

Weak Lefschetz and its Gysin transpose; Frobenius-equivariant blowup injectivity and codimension-two decomposition, preceding hard Lefschetz. Uses: [4.1](#target-4-1), [4.3](#target-4-3), [6.1](#target-6-1), [6.3](#target-6-3).

Hyperplane weak Lefschetz: restriction is an isomorphism below `n−1` and injective in degree `n−1`, with its dual Gysin statement. Uses: [9.3](#target-9-3), [9.5](#target-9-5).

<a id="input-e24"></a>

#### ArithmeticGaloisDuality §R02.3.2 (function-field ideles, local units and reciprocity)

Geometric abelianized finite-field curve Weil groups are finite prime-to-`p` by pro-`p`, using idèle class theory, local units and finite Picard group. Uses: [5.5](#target-5-5).

<a id="input-e25"></a>

#### ArithmeticGaloisRepresentations §5.13 (finite function-field Chebotarev), with the degree refinements of §3.7 here

Finite-cover function-field Chebotarev supplies Dirichlet density and Frobenius density. Section `3.7` here proves the constant-field degree congruences and per-degree refinement from the curve estimate of DWP.1. The connected double-cover zeta comparison excluding the quadratic exception is in §5.16 here; it uses DWP.1, without DWP.10. Uses: [3.7](#target-3-7), [5.16](#target-5-16).

<a id="input-e26"></a>

#### InverseGaloisAndArithmeticFundamentalGroups §IG.0.3 (local systems) and §IG.5.7 (finite-cover criterion and dense-open surjectivity)

For normal connected `X` and dense open `U`, surjectivity `π₁(U)→π₁(X)`, and lisse-sheaf/representation comparison. Uses: [8.14](#target-8-14), [8.15](#target-8-15), [8.19](#target-8-19).

<a id="input-e27"></a>

#### EtaleCohomologyFoundations §§F.0.A1–F.0.A2 and InverseGaloisAndArithmeticFundamentalGroups §§IG.1.2–IG.1.3 (arithmetic exact sequence, covers and specialization)

Arithmetic/geometric fundamental-group sequence, connected-cover classification and tame specialization; retain constant-field and component comparisons. The dense-open criterion is InverseGaloisAndArithmeticFundamentalGroups §IG.5.7; the dominant finite-index extension is proved in §5.8 here. Uses: [3.1](#target-3-1), [3.5](#target-3-5), [5.1](#target-5-1), [5.5](#target-5-5), [5.15](#target-5-15), [3.2](#target-3-2), [5.8](#target-5-8).

The arithmetic/geometric exact sequence for geometrically connected finite-field schemes and its Weil pullback over geometric Frobenius `ℤ`. Uses: [8.14](#target-8-14), [8.15](#target-8-15).

<a id="input-e28"></a>

#### EtaleCohomologyFoundations §F.3a and LefschetzPencilsAndVanishingCycles §§0.2–0.8 (boundary traits and nearby cycles)

Boundary local traits, Weil representations, tame character and branch sign lines. Uses: [5.11](#target-5-11).

<a id="input-e29"></a>

#### LefschetzPencilsAndVanishingCycles §§0.6–0.8 (specialization and nearby-cycle functoriality)

Use the actual specialization maps and their exact cohomology sequence.

<a id="input-e30"></a>

#### LefschetzPencilsAndVanishingCycles §0.5 (derived nearby cycles and the vanishing triangle)

Use derived nearby cycles and the specialization/vanishing triangle, with its Galois action.

<a id="input-e31"></a>

#### LefschetzPencilsAndVanishingCycles §§1.1–1.6 (inertia, monodromy and relative filtrations)

Quasi-unipotent inertia, `N:V→V(−1)`, centered monodromy filtration, primitive `SL₂` strings, Clebsch–Gordan tensor compatibility, duality and relative filtration criteria, with geometric-Frobenius signs. Uses: [5.11](#target-5-11), [5.12](#target-5-12).

Quasi-unipotent nearby inertia, tame character, `N` and monodromy filtrations in the geometric/arithmetic setting of WII 6.1.12. Boundary traits over any `ℓ`-invertible field have pro-`p` wild inertia (trivial in characteristic zero), with no map from pro-`p` to pro-`ℓ` for `p≠ℓ`. Uses: [8.6](#target-8-6), [8.7](#target-8-7), [7.5](#target-7-5).

<a id="input-e32"></a>

#### LefschetzPencilsAndVanishingCycles §§2.4–2.8 (quadratic singularities and branch orientation)

Vanishing-cycle triangle, specialization five-term sequence, normalization resolution and nodal branch sign line. Uses: [6.1](#target-6-1).

<a id="input-e33"></a>

#### LefschetzPencilsAndVanishingCycles §§3.1–3.5 (Lefschetz pencils)

Finite-field Lefschetz pencils with axis, blowup and singular set after finite extension/Veronese embedding. The boundary-adapted surface-pencil extension is constructed in §6.1 here: one node, tangency or crossing per exceptional fibre, in arbitrary characteristic. Uses: [6.1](#target-6-1), [6.3](#target-6-3).

<a id="input-e34"></a>

#### LefschetzPencilsAndVanishingCycles §3.2 (dual variety and incidence family)

Use the scheme-theoretic dual variety and the incidence family of smooth hyperplane sections.

<a id="input-e35"></a>

#### LefschetzPencilsAndVanishingCycles §§3.4–3.5 (existence and finite-field descent of pencils)

Use the pencil after a permitted Veronese re-embedding and finite extension of the finite base field.

<a id="input-e36"></a>

#### LefschetzPencilsAndVanishingCycles §§4.1–4.5 (global vanishing cycles)

The arithmetic vanishing subsheaf of `Rⁿf_*ℚ_ℓ`, its pairing into `ℚ_ℓ(−n)`, and geometric constancy of the other degrees, the quotient by vanishing cycles, and the radical. Uses: [3.2](#target-3-2), [6.1](#target-6-1).

<a id="input-e37"></a>

#### LefschetzPencilsAndVanishingCycles §4.1 (direct images of a pencil)

Use the constructible direct-image sheaves and their smooth-open lisse restrictions.

<a id="input-e38"></a>

#### LefschetzPencilsAndVanishingCycles §4.4 (radical quotient and pairing)

Use the vanishing subspace modulo its pairing radical, with the induced perfect pairing and arithmetic action.

<a id="input-e39"></a>

#### LefschetzPencilsAndVanishingCycles §4.2 (vanishing subspace)

Use the subspace generated by the local vanishing cycles, with its invariant intersection form.

<a id="input-e40"></a>

#### LefschetzPencilsAndVanishingCycles §§3.6, 5.1 and §5.15 here (curve reduction and monodromy specialization)

LefschetzPencilsAndVanishingCycles §3.6 / `LefschetzPencil.arithmeticGlobalMonodromy`
owns arithmetic finite-model smooth-curve specialization, simultaneously over all
congruence powers, preserving the full compact images, pairings, twists and finite
wild boundary inertia. Its §5.1 gives Bertini for a specified monodromy image.
Section `5.15` here owns the reduced-irreducible-base and finite-type-family
extension, its agreement with §3.6 on arithmetic smooth curves, and normal-scheme
curve reduction for a specified representation. The separate simultaneous-all-primes
prime-to-`p` abelian specialization and curve surjection in §5.15 supply §5.5.
These constructions precede purity. Uses: [5.5](#target-5-5), [5.9](#target-5-9), [5.15](#target-5-15).

<a id="input-e41"></a>

#### LefschetzPencilsAndVanishingCycles §5.1 (Bertini for monodromy images)

Use equality of monodromy images for a sufficiently general line adapted to the specified finite coefficient model.

<a id="input-e42"></a>

#### LefschetzPencilsAndVanishingCycles §§5.7–5.8 (compact symplectic groups and Kazhdan–Margulis)

Use openness of the nonzero symplectic radical-quotient image, in the `ℓ`-adic topology.

<a id="input-e43"></a>

#### LefschetzPencilsAndVanishingCycles §§5.2–5.3 (conjugacy and generation by transvections)

Use geometric generation by the transported local transvections, retaining the characteristic-two branch.

<a id="input-e44"></a>

#### LefschetzPencilsAndVanishingCycles §§7b.1–7b.11 (invariant cycles and support bounds)

Local/global invariant cycles and support-bound weak Lefschetz for explicitly modeled potentially pure complexes over algebraically closed fields. Keep both `K` and `DK` support bounds and hyperplane duality `D(K|Y)=(DK)|Y(−1)[−2]`. The supplier’s local/global invariant-cycle theorems retain their spectral or local-surjectivity hypotheses. Section `9.5` here discharges them with the numerical and cohomological weight estimates, giving the constant-coefficient fixed-part theorem for pencils satisfying WII 4.3.1. Uses: [9.5](#target-9-5), [9.10](#target-9-10), [9.12](#target-9-12).
The complex input to §§7b.8–7b.11 is a
`InvariantCycles.GeometricGenericArithmeticModel` with a total complex pure in
§8.13's arithmetic sense, as required by `PotentiallyPureComplex` in §8.20.
Section `9.10` uses §8.11 to prove purity of its general-incidence trait models
from §7b.7's duality comparison and then discharges §7b.8's spectral hypothesis
by the same weight separation. Closed-fibre purity in an arbitrary
`ArithmeticModel` alone supplies none of these arithmetic-purity hypotheses.

<a id="input-e45"></a>

#### LefschetzPencilsAndVanishingCycles §§7a.3, 7a.5 (nodal-curve monodromy and arithmetic descent)

Use the normalization, graph and component pieces of the centered monodromy
filtration on generic `H¹`, with §7a.5's residue-Galois-equivariant descent and
signed component and branch permutations.

<a id="input-e46"></a>

#### LefschetzPencilsAndVanishingCycles §§7a.1–7a.2, 7a.5 (normalization, specialization and arithmetic descent)

Use the geometric normalization cohomology sequence and §7a.5's
Frobenius-equivariant descent, including signed graph permutations.

<a id="input-e47"></a>

#### SchemeAndStackFoundations §0.29 (absolute, relative and `q`-power scheme Frobenius)

Scheme `p`-Frobenius and its `q=p^a` iterate, naturality, products and base change. For smooth pure `g`-dimensional schemes, supply its finite locally free degree `q^g` from étale coordinates. Uses: [1.1](#target-1-1).

**Checks.** On `ℙ¹` the supplied `q`-map has `q+1` geometric fixed points; on `Spec 𝔽_q` it
is identity. For `q=p²` its affine fixed field is `𝔽_(p²)`, while one `p`-iterate has fixed
field `𝔽_p`. The abelian specialization on an elliptic curve has degree `q`, as in §1.1.
These checks distinguish the `q`-iterate from a single absolute `p`-map and from a map
obtained by extending the closure scalars incorrectly (Milne, [AV](#ref-av), II §1, `p`. `75`;
EtaleCohomologyFoundations §F.10.1, frobeniusFixedPoints).

<a id="input-e48"></a>

#### SchemeAndStackFoundations §§1.19–1.20 (Deligne–Mumford stacks) and the coefficient descent target of §8.24 here

Étale cohomology of finite-field Deligne–Mumford stacks and the normal-crossings normalized-stratum resolution of `j_!ℚ_ℓ`. Uses: [8.24](#target-8-24).

<a id="input-e49"></a>

#### EtaleCohomologyFoundations §§F.0–F.4, F.10.1–F.10.5 and InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4 (finite cohomology, base change and geometric trace formulas)

Finite cohomology and the coefficient Grothendieck–Lefschetz formula `Z(U₀,F₀,t)=∏ det(1−Ft,Hⁱ_c)^{(−1)^{i+1}}`; curve/Jacobian fixed-point formula `1−Tr(α′)+deg α`; proper base change on pencil fibres; Frobenius-equivariant Künneth and Leray with finite abutment filtrations. Include descent of pencils, singular/sign data and coefficient models, and trace splitting for finite surjective curve covers, including ramified covers. Uses: [2.1](#target-2-1), [2.4](#target-2-4), [2.10](#target-2-10), [1.6](#target-1-6), [3.3](#target-3-3), [4.1](#target-4-1), [4.2](#target-4-2), [5.2](#target-5-2), [5.10](#target-5-10), [5.12](#target-5-12), [5.15](#target-5-15), [5.18](#target-5-18), [6.2](#target-6-2), [6.3](#target-6-3), [10.5](#target-10-5), [5.9](#target-5-9).

Proper, smooth and compact-support base change, étale invariance under universal homeomorphisms and open/closed excision. Include the coefficient trace/Euler formula; the dense-open affine fibration used for integrality is constructed in `integrality_fibrationReduction` before §7.10 here. Uses: [7.3](#target-7-3), [7.4](#target-7-4), [7.5](#target-7-5), [7.6](#target-7-6), [7.7](#target-7-7), [7.10](#target-7-10), [7.15](#target-7-15), [8.3](#target-8-3), [8.21](#target-8-21), [8.23](#target-8-23), [8.24](#target-8-24), [9.4](#target-9-4).

<a id="input-e58"></a>

#### AlgebraicCurves, Layer `12` (function-field/curve dictionary)

Smooth projective compactification of a smooth curve over a perfect field, with finite reduced étale boundary. Uses: [7.5](#target-7-5).

<a id="input-e59"></a>

#### ArithmeticDirichletSeries, Layer `8` (Landau positivity)

The nonnegative `3`,`4`,`1` trigonometric combination and exact-abscissa positivity used in WII §2. Uses: [5.16](#target-5-16).

<a id="input-e60"></a>

#### EllipticCurves, Layer `3` (Hasse bound)

Trace `a=q+1−#E(𝔽_q)` and the Hasse bound, to compare with the abelian characteristic polynomial. Uses: [1.8](#target-1-8).

<a id="input-e61"></a>

#### JacobianChallenge, Layer `F` (Abel–Jacobi), SchemeAndStackFoundations §3.6 (Picard torsors), and InverseGaloisAndArithmeticFundamentalGroups §IG.0.T1 (curve/Jacobian trace comparison)

Pointed Abel–Jacobi and its universal property, with base-point-free finite-field `Pic⁰` descent from SchemeAndStackFoundations §3.6 and translation-trivial `H¹` and Frobenius-equivariant `H¹(J)≅H¹(C)` from InverseGaloisAndArithmeticFundamentalGroups §IG.0.T1. Without a rational base point, Frobenius commutes with the Abel–Jacobi map only up to translation. Uses: [1.6](#target-1-6), [1.7](#target-1-7).

<a id="input-e62"></a>

#### ModularCurves §0E and SchemeAndStackFoundations §0.9 (spreading out)

Finite-presentation spreading of polarized projective relative curves with sections, divisors and finite étale covers over a dense base open. Uses: [7.6](#target-7-6).

<a id="input-e63"></a>

#### ModularCurves §5B and ModularCurvesPartII §§3.1–3.2, `4.11`–`4.12` (full level and geometric connectedness)

Use the actual full-level carriers. Section `4.11` / fixedPairingIntegralComponents
supplies connected geometric fibres of the fixed-pairing compactification;
§3.2 supplies smoothness at invertible level and §4.12 identifies its nonempty
elliptic open with the fixed-pairing fine curve. A connected smooth curve over
an algebraically closed field is irreducible, so that open is connected. Section `10.6` here derives the universal `SL₂` monodromy comparison and openness for nonconstant-`j` families from these connected towers and finite-index fundamental-group images. Uses: [10.6](#target-10-6).

<a id="input-e64"></a>

#### ReductiveGroups, Layer `2` (`Lie` algebras), and ReductiveGroupsPartII §RG2.0.2 (analytic charts)

Algebraic subgroup `Lie` algebras and `ℓ`-adic analytic local charts: an `ℓ`-adically open subgroup has full algebraic dimension. Use ReductiveGroupsPartII §RG2.0.2, smooth-group-analytic-charts, for the analytic dimension comparison. Uses: [2.2](#target-2-2).

<a id="input-e65"></a>

#### ReductiveGroups, Layer `3` (subgroups, quotients and components)

Algebraic Zariski closure of `ℚ_ℓ`-point subgroups and connectedness of `Sp`. Uses: [2.2](#target-2-2).

<a id="input-e66"></a>

#### ReductiveGroups, Layer `6` (reductive and semisimple groups)

Algebraic reductive and semisimple group theory, centers and central isogenies.
DWP.5 constructs the central-degree and compact-normalizer comparisons in §5.7
and the algebraic-by-`ℤ` compact-form adapter in §5.17, using the connected `Lie`-group foundations below.
Uses: [5.7](#target-5-7), [5.17](#target-5-17).

A faithful finite-dimensional representation of an affine algebraic group over algebraically closed characteristic-zero coefficients is semisimple exactly when the identity component is reductive. Finite components use averaging; image and Zariski closure have the same invariant subspaces. Uses: [8.14](#target-8-14).

#### RepresentationTheory/LieGroups, Layer `7` (complexification and real forms)

Connected reductive compact real forms, their complexification, existence and conjugacy, and the equivalence between continuous compact-group representations and holomorphic representations of their complexifications. Section `5.17` here compares these with the algebraic quotient, proves algebraicity for the relevant holomorphic semisimple-group representations, and extends across finite components, cyclic central quotients and Weil degree. Uses: [5.17](#target-5-17).

<a id="input-e67"></a>

#### RepresentationTheory/CompactGroups, Layer `5` (Peter–Weyl)

Uniform density of matrix coefficients and square-character approximation for the positive pole-order argument. Uses: [5.16](#target-5-16).

<a id="input-e68"></a>

#### RepresentationTheory/CompactGroups, Layers `0`, `6` and the `SU(2)` engine case (Haar probability, characters and `SU(2)`)

Normalized Haar, character orthogonality, class-function density and conjugacy separation, including `SU(2)` density `(2/π)sin²θ`. The compact-quotient disintegration, continuous clopen conditional masses and Dini uniform decay are targets of §3.7 here; the nullity of proper algebraic subsets of `ℓ`-adic symplectic cosets is a target of §3.6 here. Uses: [5.16](#target-5-16), [5.17](#target-5-17), [5.19](#target-5-19), [10.6](#target-10-6), [3.7](#target-3-7), [3.6](#target-3-6).

<a id="input-e69"></a>

#### RepresentationTheory/SchurWeyl, Layer `9` (symplectic pair contractions)

Complex symplectic invariant multilinear forms spanned by pair contractions, with the dimension of the invariant space. Uses: [2.3](#target-2-3).

<a id="input-newton"></a>

#### NewtonPolygons §§0.6–0.7 (slope data and the common polygon carrier)

Use `ConvexPolygon.FiniteSlopeData`, its cumulative heights and `toPolygon`,
with the order-preserving embedding of rational slopes into real slopes.
Section `5.13` supplies the Frobenius-stalk adapter; equality and comparison
use the represented heights, with `∞` outside the finite domain, rather than
equality of vertex lists. No second polygon carrier is constructed here.


## How to read the build

| Layer | Development | Output |
| --- | --- | --- |
| DWP.0 | Numerical weights and spectra | Scalar, tensor, dual, exterior and pairing API |
| DWP.1 | Rosati and Jacobians | Abelian-variety and curve Weil estimates |
| DWP.2 | Symplectic tensor powers | Fundamental estimate and coarse curve bounds |
| DWP.3 | Arithmetic pencil factors | Rational local factors |
| DWP.4 | Dimension induction and powers | Smooth projective purity |
| DWP.5 | Weil coefficients and local/analytic weights | Monodromy purity, boundary bounds and compact forms |
| DWP.6 | Curve square improvement | Sharp parabolic purity |
| DWP.7 | Dévissage, direct images and integrality | General upper bounds and smooth proper purity |
| DWP.8 | Mixed complexes and pure lisse sheaves | Weight filtration and semisimplicity |
| DWP.9 | Invariant cycles and Lefschetz | Absolute hard Lefschetz and primitive pairings |
| DWP.10 | Arithmetic and distribution interfaces | Weight transport and equidistribution |

DWP.5's coefficient prefix precedes DWP.2; its local and analytic suffix uses
the earlier estimates. DWP.6 supplies the curve case of DWP.7, which supplies
DWP.8. DWP.9 imports
`LefschetzPencilsAndVanishingCycles §§7b.1–7b.11 (invariant cycles and support bounds)`. Equidistribution
uses DWP.7 and DWP.8. These dependencies apply to individual targets rather
than forcing a cycle between whole layers.
Within DWP.8, §8.13's arithmetic purity precedes §8.20's
`PotentiallyPureComplex` and smooth/lisse model comparison. These precede
§9.10's general-incidence purity and invariant-cycle application, and §9.11
uses the smooth/lisse comparison to pass from its sheaf witness to §9.10.

Each subsection specifies mathematical targets with their hypotheses and source locators.
Definitions carry API and discriminating Checks. The supplier contracts distinguish pinned
library declarations from the mathematical interfaces supplied by other roadmaps.

## Layer DWP.0: Eigenvalue weights and functorial linear algebra

Start with the minimal polynomial and characteristic-root multiset. Scalar extension, exact sequences and polynomial kernels give the common numerical language for every coefficient realization. The prescribed-base extension in the complex-isomorphism construction is a mathematical target in its own right; a bare ring equivalence does not establish it.

<a id="target-0-1"></a>

### 0.1. Weil `q`-numbers of integer weight

Fix a real number `q > 1` and `n ∈ ℤ`. An element `α` of a field `K` of characteristic `0` is a Weil `q`-number of weight `n` (Deligne: pure of weight `n` relative to `q`) if `α` is algebraic over `ℚ` and every complex root of its minimal polynomial over `ℚ` has absolute value `q^{n/2}`. The predicate depends only on the minimal polynomial of `α`. So it is preserved and reflected by every field homomorphism `K → K′`, and it does not depend on the ambient field or on a chosen splitting field. Equivalently, `|σ(α)| = q^{n/2}` for every field homomorphism `σ : ℚ(α) → ℂ`. When `K` is algebraic over `ℚ`, it is equivalent to `|φ(α)| = q^{n/2}` for every field homomorphism `φ : K → ℂ`. A Weil `q`-number is nonzero, and its weight is unique. Integrality over `ℤ` is a separate predicate.

Use `q>1` and integer weights. The comparison with all maps `K→ℂ` assumes `K` algebraic over `ℚ`; for `ℚ̄_ℓ` use `0.6`. Algebraicity prevents the zero minimal polynomial of a transcendental element from making the root condition vacuous.

`IsWeilNumber` is the real-base adapter of ArithmeticGaloisRepresentations
§2.6's canonical scalar predicate. Its `q>1` clause is part of the predicate;
[0.19](#target-0-19) identifies the two predicates at natural `q≥2`.

Its API includes:
- `IsWeilNumber`: Algebraicity over `ℚ` and modulus `q^(n/2)` at every complex root of the minimal polynomial.

- A Weil `q`-number is algebraic over `ℚ`.

- Every field embedding into `ℂ` sends the Weil number to a number of modulus `q^(n/2)`.

- If the ambient field is algebraic over `ℚ`, purity is equivalent to the common modulus at every complex embedding.

- Field homomorphisms preserve and reflect the minimal-polynomial purity predicate.

- If `P ∈ ℚ[T]` is nonzero, `P(α) = 0` and every complex root of `P` has absolute value `q^{n/2}`, then `α` is a Weil `q`-number of weight `n`.

- A Weil `q`-number is nonzero.

- For `q>1` a nonzero Weil number has a unique integer weight.

#### Checks
- The roots of `T² − T + 2` are Weil `2`-numbers of weight `1`: the discriminant is `−7`, so the roots `(1 ± i√7)/2` are complex conjugate with product `2`.

- `1 + √2` is a Weil `q`-number for no `q > 1` and no `n`. Its conjugates `1 ± √2` have absolute values with product `1`, forcing `n = 0`, while `|1 + √2| ≠ 1`. It has absolute value `q^{1/2}` at one real embedding for `q = (1 + √2)²`, so one embedding does not suffice.

- For an integer `q ≥ 2`, `q⁻¹ ∈ ℚ` is a Weil `q`-number of weight `−2` and is not integral over `ℤ`: purity and integrality are separate predicates.

- A root of unity is a Weil `q`-number of weight `0` for every `q > 1`; `0` is a Weil `q`-number of no weight.

*Needs:* [minpoly.algHom_eq](#input-b1), [IsAlgClosed.lift](#input-b2).

(Sources: [WII](#ref-wii), §1.2, Définition (1.2.1), p. 153; [WI](#ref-wi), §1, Lemme (1.7), p. 276; [Yu](#ref-yu), §1 pp. 2–3; §7.1 p. 64.)

<a id="target-0-2"></a>

### 0.2. Products, inverses, conjugation and integrality of Weil `q`-numbers

Let `q > 1`, and let `α`, `β ∈ K` be Weil `q`-numbers of weights `n` and `m`. (i) `αβ` is a Weil `q`-number of weight `n + m`, `α⁻¹` one of weight `−n`, and `α^k` one of weight `kn` for `k ∈ ℤ`. (ii) If `q` is rational, `q^k` is a Weil `q`-number of weight `2k` for `k ∈ ℤ`. (iii) If `q` is rational, then for every field homomorphism `σ : K → ℂ` the complex conjugate of `σ(α)` is `q^n/σ(α)`. In particular `α + q^n α⁻¹` is a totally real algebraic number. (iv) If `α` is integral over `ℤ`, then `n ≥ 0`, and if moreover `n = 0` then `α` is a root of unity. A sum of Weil `q`-numbers is not a Weil `q`-number in general.

Products use embeddings of the common field `ℚ(α,β)`. The reciprocal-conjugation formula uses rational `q`. The root-of-unity and nonnegative-weight conclusions require integrality.

*Needs:* [0.1](#target-0-1), [IsAlgClosed.lift](#input-b2), [NumberField.Embeddings.pow_eq_one_of_norm_eq_one](#input-b3).

(Sources: [WII](#ref-wii), §1.2, Définition (1.2.12), p. 156; [WII](#ref-wii), §1.2, Remarque (1.2.14), p. 156.)

<a id="target-0-3"></a>

### 0.3. Weil numbers under powers: change of `q` to `q^r`

Let `q > 1`, `n ∈ ℤ` and `r ≥ 1`. An element `α` of `K` is a Weil `q`-number of weight `n` if and only if `α^r` is a Weil `q^r`-number of weight `n`.

Require `r≥1`; algebraicity of `α` follows from that of `α^r`. Constant-field extension replaces `(q,F)` by `(q^r,F^r)`.

*Needs:* [0.1](#target-0-1), [IsAlgClosed.lift](#input-b2).

(Sources: [WI](#ref-wi), §1, (1.5.1), p. 275; [WII](#ref-wii), §1.1, (1.1.13), p. 152.)

<a id="target-0-4"></a>

### 0.4. `ι`-weights of nonzero elements of a coefficient field

Let `E` be a field, `ι : E → ℂ` a field homomorphism (not assumed continuous; Deligne takes an isomorphism `ι : ℚ̄_ℓ ≅ ℂ`), and `q > 1` real. For `α ∈ E^×`, the `ι`-weight of `α` relative to `q` is `w_{ι,q}(α) = 2 log_q |ι(α)| ∈ ℝ`, so that `|ι(α)| = q^{w/2}`. `α` is `ι`-pure of weight `β ∈ ℝ` if `w_{ι,q}(α) = β`. The `ι`-weight is a group homomorphism `E^× → ℝ: w(αβ) = w(α) + w(β)` and `w(α⁻¹) = −w(α)`. Moreover `w_{ι,q}(q) = 2` when `q ∈ ℚ`, `w_{ι,q^r}(α^r) = w_{ι,q}(α)` for `r ≥ 1`, and `w_{ι∘τ,q}(α) = w_{ι,q}(τ(α))` for a field homomorphism `τ`. A Weil `q`-number of weight `n` is `ι`-pure of weight `n` for every `ι`. An element of integer `ι`-weight need not be algebraic or a Weil `q`-number.

Its API includes:
- The real number `2 log(|ια|)/log(q)`, with `q>1` and `α≠0`.

- Nonvanishing and the specified real `ι`-weight.

- The `ι`-weight of a product of nonzero scalars is the sum of their weights.

- The `ι`-weight of an inverse is the negative of the weight.

- Raising `α` and `q` to the same positive integer power preserves the `ι`-weight.

- Composition of field embeddings transports the `ι`-weight.

- For `q>1` and `α≠0`, the modulus is `q` raised to half the `ι`-weight.

- A Weil number is `ι`-pure of its integer weight for every complex embedding.

#### Checks
- For `q ∈ ℚ` with `q > 1` and every `ι: w_{ι,q}(q) = 2` and `w_{ι,q}(q⁻¹) = −2`. So `ℚ_ℓ(1)`, on which geometric Frobenius acts by `q⁻¹`, has weight `−2`.

- For `E = ℚ(√2)` and `q = 2`, `α = 1 + √2` has `ι`-weight `2 log₂(1 + √2)` at one real embedding and `−2 log₂(1 + √2)` at the other: the `ι`-weight depends on `ι`.

- For `E=ℚ(t)`, choose a transcendental complex number `z` of modulus `√2` and send `t` to `z`. Then the `ι`-weight of `t` relative to `2` is `1`, an integer, although `t` is not algebraic. The numeric test accepts the supplied transcendence and modulus conditions; no Lindemann–Weierstrass theorem is assumed.

- `w_{ι,q}(ζ) = 0` for every root of unity `ζ ∈ E` and every `ι`.

*Needs:* [0.1](#target-0-1).

(Sources: [WII](#ref-wii), §1.2, (1.2.6), p. 154; [WII](#ref-wii), §1.2, Remarque (1.2.8), p. 155.)

<a id="target-0-5"></a>

### 0.5. Embeddings into `ℂ` extending a given embedding, and isomorphisms `ℚ̄_ℓ ≅ ℂ`

(i) Let `E` be a field of characteristic `0` with `#E ≤ 𝔠`, `k ⊆ E` a countable subfield, and `σ : k → ℂ` a field homomorphism. Then `σ` extends to a field homomorphism `E → ℂ`. (ii) If moreover `E` is algebraically closed with `#E = 𝔠`, then `σ` extends to a field isomorphism `E ≅ ℂ`. (iii) For every prime `ℓ`, `#ℚ_ℓ = #ℚ̄_ℓ = 𝔠`. So field isomorphisms `ι : ℚ̄_ℓ ≅ ℂ` exist, and every embedding into `ℂ` of a number field `K ⊂ ℚ̄_ℓ` extends to one. (iv) If `α ∈ E` is transcendental over `ℚ`, then for every transcendental `z ∈ ℂ` there is a field homomorphism `ι : E → ℂ` with `ι(α) = z`, which is an isomorphism in case (ii).

The extension fixes the specified base embedding. It uses a transcendence basis and choice. The isomorphism assertion requires cardinality exactly `𝔠`; a countable algebraically closed field is insufficient.

*Needs:* [IsAlgClosed.cardinal_eq_cardinal_transcendence_basis_of_aleph0_lt](#input-b4), [Cardinal.mk_complex](#input-b5), [IsAlgClosed.lift](#input-b2), [IsAlgClosed.equivOfTranscendenceBasis](#input-b6), [IsAlgClosed.ringEquiv_of_equiv_of_charZero](#input-b7), [Algebra.IsAlgebraic.cardinalMk_le_max](#input-b8).

(Sources: [WII](#ref-wii), §1.2, Remarque (1.2.11), p. 156.)

<a id="target-0-6"></a>

### 0.6. Algebraicity and Weil purity from `ι`-purity at every `ι`

Let `E` be a field of characteristic `0` with `#E ≤ 𝔠` (for instance a finite extension of `ℚ_ℓ`, or `ℚ̄_ℓ`), `q > 1` and `n ∈ ℤ`. For `α ∈ E` the following are equivalent: (a) `α` is a Weil `q`-number of weight `n`; (b) `|ι(α)| = q^{n/2}` for every field homomorphism `ι : E → ℂ`. If `E` is algebraically closed with `#E = 𝔠`, (b) may be restricted to field isomorphisms `ι : E ≅ ℂ`. In particular, an endomorphism that is `ι`-pure of weight `n` for every `ι` is pure of weight `n`.

Retain the cardinality bound and quantify over every embedding. One embedding does not force algebraicity or Weil purity.

*Needs:* [0.1](#target-0-1), [0.4](#target-0-4), [0.5](#target-0-5).

(Sources: [WII](#ref-wii), §1.2, (1.2.6), p. 154.)

<a id="target-0-7"></a>

### 0.7. Eigenvalues, Weil purity and `ι`-weights of an invertible endomorphism

Let `E` be a field of characteristic `0` with algebraic closure `Ē`, `V` a finite-dimensional `E`-vector space and `F` an invertible `E`-linear endomorphism of `V`. The eigenvalues of `F` are the roots of its characteristic polynomial `det(T − F)` in `Ē`, counted with multiplicity. The multiplicity of `α` equals the `Ē`-dimension of the maximal generalized eigenspace of `F ⊗ Ē` at `α`. `(V, F)` is pure of weight `n` relative to `q` if every eigenvalue is a Weil `q`-number of weight `n`. For a field homomorphism `ι : Ē → ℂ`, `(V, F)` is `ι`-pure of weight `β ∈ ℝ` if every eigenvalue has `ι`-weight `β`, and the `ι`-weights of `(V, F)` are the `ι`-weights of its eigenvalues, a finite subset of `ℝ`. The multiset of eigenvalues is stable under `Aut(Ē/E)`, so none of these notions depends on the choice of `Ē` or of a splitting field inside `Ē`. `V = 0` is pure of every weight and has no weights.

Its API includes:
- The characteristic-root multiset in an algebraic closure, of cardinality `dim V`.

- `IsPure`: Every characteristic root is a Weil number of the specified integer weight.

- Every characteristic root has the specified real `ι`-weight.

- The finite set of real `ι`-weights of characteristic roots.

- Root multiplicity is the dimension of its maximal generalized eigenspace after scalar extension.

- The characteristic-root multiset is invariant under every automorphism of the algebraic closure over the coefficient field.

- Purity is preserved and reflected under coefficient field extension; the `ι`-variant uses compatible closure embeddings.

- Integer purity implies real `ι`-purity for every `ι`.

#### Checks
- `F = [[q, 1], [0, q]]` on `E²` is pure of weight `2` relative to `q` and is not semisimple: purity does not see Jordan blocks.

- `F = [[0, −q], [1, 0]]` on `ℚ²` has characteristic polynomial `T² + q`, no eigenvalue in `ℚ`, `eigenvalues ±i√q` in `ℚ̄`, and is pure of weight `1`.

- `F = diag(1, q)` is not pure; its weights are `{0, 2}`.

- On `V = 0`, `F` is pure of every weight and has no weights.

- On a one-dimensional zero endomorphism `F=0`, the total `log`-based numeric `iotaWeights` core yields `{0}`. Multiplication by `b=2` leaves `F=0`, so shifting by `w₂(2)=2` would falsely give `{2}`. Every assertion that a scalar twist translates the weight set therefore requires invertible `F`; purity itself rejects the zero eigenvalue.

*Needs:* [0.1](#target-0-1), [0.4](#target-0-4), [LinearMap.charpoly_baseChange](#input-b9), [Module.End.hasEigenvalue_iff_isRoot_charpoly](#input-b10), [LinearMap.finrank_maxGenEigenspace_eq](#input-b11), [Module.End.iSup_maxGenEigenspace_eq_top](#input-b12), [Module.End.independent_maxGenEigenspace](#input-b13).

(Sources: [WI](#ref-wi), §2, (2.6), p. 281; [WII](#ref-wii), §1.2, Variante (1.2.4), p. 154; [WII](#ref-wii), §1.2, (1.2.6), p. 154.)

<a id="target-0-8"></a>

### 0.8. Multiplicativity of the characteristic polynomial along an invariant subspace

Let `V` be a finite-dimensional `E`-vector space, `F ∈ End_E(V)`, and `W ⊆ V` an `F`-stable subspace, with induced endomorphisms `F_W` of `W` and `F_{V/W}` of `V/W`. Then `det(T − F) = det(T − F_W)·det(T − F_{V/W})`. Consequently `det(1 − tF) = det(1 − tF_W)·det(1 − tF_{V/W})` and `det F = det F_W · det F_{V/W}`, and the eigenvalue multiset of `F` is the sum of those of `F_W` and `F_{V/W}`.

The chosen vector-space complement need not be `F`-stable; characteristic-polynomial factorization requires only stability of `W`.

*Needs:* [Matrix.charpoly_fromBlocks_zero₂₁](#input-b14), [LinearMap.charpoly_prodMap](#input-b15).

(Sources: [WI](#ref-wi), §1, (1.5.3), p. 275.)

<a id="target-0-9"></a>

### 0.9. Purity and weights under subobjects, quotients, extensions and direct sums

Let `F` be an invertible endomorphism of `V` and `W ⊆ V` an `F`-stable subspace. (i) `(V, F)` is pure of weight `n` if and only if `(W, F_W)` and `(V/W, F_{V/W})` are both pure of weight `n`; the same holds for `ι`-purity of weight `β`. (ii) The `ι`-weights of `V` are the union of those of `W` and of `V/W`, and likewise for a direct sum. (iii) So the pairs `(V, F)` that are pure of weight `n` form a class closed under subobjects, quotients and extensions.

Subobject and quotient actions are invertible by finite dimensionality. An extension of two pure modules of the same weight need not split.

*Needs:* [0.7](#target-0-7), [0.8](#target-0-8).

(Sources: [WII](#ref-wii), §1.2, Stabilités (1.2.5)(i), p. 154.)

<a id="target-0-10"></a>

### 0.10. The characteristic power series `det(1 − tF)` and traces of powers

Let `F` be an endomorphism of a finite-dimensional vector space `V` over a field `E`. (i) `det(1 − tF) ∈ E[t]` is the reverse of `det(T − F): det(1 − tF) = t^{dim V} det(t⁻¹ − F)`, and over `Ē` it is `∏(1 − αt)` over the `eigenvalues α`. (ii) Writing `D(t)=det(1−tF)`, in `E[[t]]` one has `−tD′(t)/D(t)=Σ_{n≥1}Tr(F^n)t^n` in every characteristic. When `E` has characteristic `0` this is `t(d/dt)log D(t)⁻¹`. (iii) If `E` has characteristic `0`, the traces `Tr(F^n)` for `1 ≤ n ≤ dim V` determine `det(1 − tF)`, hence the eigenvalue multiset.

Recovering characteristic polynomials from all traces and taking a formal logarithm require characteristic zero. The logarithmic derivative is defined whenever the constant term is `1`.

*Needs:* [0.8](#target-0-8), [Matrix.reverse_charpoly](#input-b16), [Matrix.trace_eq_sum_roots_charpoly](#input-b17).

(Sources: [WI](#ref-wi), §1, (1.5.3), p. 275.)

<a id="target-0-11"></a>

### 0.11. Eigenvalues of `P(F)`, `F^r` and `F⁻¹`, with multiplicities

Let `F` be an endomorphism of a finite-dimensional `E`-vector space `V` with eigenvalue multiset `{α₁, …, α_d} ⊂ Ē`, and let `P ∈ E[T]`. Then the eigenvalue multiset of `P(F)` is `{P(α₁), …, P(α_d)}`, with multiplicities. In particular `F^r` has `eigenvalues α_i^r (r ≥ 1)`, and if `F` is invertible, `F⁻¹` has `eigenvalues α_i⁻¹`. The maximal generalized eigenspace of `F` at `α` is contained in that of `P(F)` at `P(α)`.

*Needs:* [0.7](#target-0-7), [LinearMap.charpoly_baseChange](#input-b9), [Module.End.iSup_maxGenEigenspace_eq_top](#input-b12), [Module.End.independent_maxGenEigenspace](#input-b13), [LinearMap.charpoly_prodMap](#input-b15), [LinearMap.finrank_maxGenEigenspace_eq](#input-b11), [Matrix.charpoly_inv](#input-b18).

(Sources: [WI](#ref-wi), §1, (1.5.1), p. 275.)

<a id="target-0-12"></a>

### 0.12. Weights under a finite extension of the finite base field

Let `F` be an invertible endomorphism of `V`, `q > 1` and `r ≥ 1`. `(V, F)` is pure of weight `n` relative to `q` if and only if `(V, F^r)` is pure of weight `n` relative to `q^r`. For every `ι`, the `ι`-weights of `F` relative to `q` equal the `ι`-weights of `F^r` relative to `q^r`, with multiplicities. In the finite-field situation, passing from `k₀ = 𝔽_q` to its extension of degree `r` replaces the geometric Frobenius `F` by `F^r` and `q` by `q^r`, so the weights do not change. At a closed point `x`, `F_x = F^{deg x}` acts with base `q_x = q^{deg x}`.

Purity is reflected even if taking rth powers merges distinct eigenvalues.

*Needs:* [0.3](#target-0-3), [0.4](#target-0-4), [0.11](#target-0-11).

(Sources: [WII](#ref-wii), §1.1, (1.1.13), p. 152.)

<a id="target-0-13"></a>

### 0.13. Eigenvalues of tensor products, contragredients and `Hom` spaces

Let `F` and `G` be invertible endomorphisms of finite-dimensional `E`-spaces `V` and `W`, with eigenvalue multisets `{α_i}` and `{β_j}`. (i) `F ⊗ G` on `V ⊗_E W` has eigenvalue multiset `{α_i β_j}`. (ii) The transpose `F^*` on `V^*` has the eigenvalues of `F`. The contragredient `F^∨ = (F⁻¹)^*` has `eigenvalues {α_i⁻¹}`. (iii) On `Hom_E(V, W)`, the endomorphism `u ↦ G ∘ u ∘ F⁻¹` has `eigenvalues {β_j α_i⁻¹}`. (iv) `F^{⊗k}` on `V^{⊗k}` has as eigenvalues the products of `k eigenvalues`, and `det F = ∏ α_i`. Consequently, if `V` is pure of weight `n` and `W` of weight `m`, then `V ⊗ W` is pure of weight `n + m`, `V^∨` of weight `−n`, `Hom(V, W)` of weight `m − n`, and `V^{⊗k}` of weight `kn`. The `ι`-weights behave in the same way.

*Needs:* [0.7](#target-0-7), [0.11](#target-0-11), [0.2](#target-0-2), [Matrix.det_kronecker](#input-b19), [LinearMap.trace_tensorProduct'](#input-b20), [LinearMap.det_dualMap](#input-b21).

(Sources: [WII](#ref-wii), §1.2, Stabilités (1.2.5)(ii), p. 154.)

<a id="target-0-14"></a>

### 0.14. Eigenvalues of exterior powers

Let `F` be an endomorphism of a `d`-dimensional `E`-space `V`, with `eigenvalues α₁`,`…`,`α_d` in an algebraic closure, listed with algebraic multiplicity. The eigenvalue multiset of `∧^k F` consists of `∏_{i∈I}α_i` for all `k`-element subsets `I⊆{1,…,d}`, once per subset of positions. In particular `∧^0 F` has sole eigenvalue `1`, `∧^d F` has sole eigenvalue `det F`, and `∧^k V=0` for `k>d`. If `F` is invertible and pure of weight `n`, `∧^k F` is pure of weight `kn`; real `ι`-weights are sums over those positions.

*Needs:* [0.7](#target-0-7), [0.2](#target-0-2), [0.4](#target-0-4), [exteriorPower.map](#input-b28), [Module.Basis.exteriorPower](#input-b29), [LinearMap.charpoly_baseChange](#input-b9).

(Sources: [AV](#ref-av), Chapter II, Corollary 1.5 and Remark 1.6(a), p. 78; [WII](#ref-wii), §1.5, proof (1.5.3), pp. 164–165.)

<a id="target-0-15"></a>

### 0.15. Twists `V^{(b)}` and Tate twists `V(r)`

For `b ∈ E^×` and an `E`-space `V` with invertible `F`, the twist is `V^{(b)} = (V, bF) = V ⊗ E^{(b)}`, where `E^{(b)}` is the rank-one space on which `F` acts by `b` (Weil II (1.2.7)). Its eigenvalues are the `bα_i`, and its `ι`-weights are those of `V` shifted by `w_{ι,q}(b)`. With the geometric Frobenius convention, `ℚ_ℓ(1) = E^{(q⁻¹)}`, and the Tate `twist V(r) = V ⊗ ℚ_ℓ(1)^{⊗r} = V^{(q^{−r})} (r ∈ ℤ)` shifts weights by `−2r`. When `E` contains a square root `q^{1/2}`, the half `twist V^{(q^{−1/2})}` shifts weights by `−1`. It depends on the choice of `q^{1/2}`: the two choices differ by the twist by `−1`, of weight `0`. Twisting is functorial and exact, satisfies `V^{(b)} ⊗ W^{(c)} = (V ⊗ W)^{(bc)}`, and dualizes as `(V^{(b)})^∨ = (V^∨)^{(b⁻¹)}`.

An arbitrary scalar gives a Weil line. Étale descent requires the separate unit/continuity criterion; a nonintegral real weight is not an integer Tate twist.

Its API includes:
- Multiply the invertible Frobenius endomorphism by a nonzero scalar `b`.

- The integer twist multiplies geometric Frobenius by `q^(−r)`.

- Multiplication by `b` multiplies every characteristic root by `b`.

- For an invertible endomorphism `F`, a nonzero scalar twist translates the weight set by the scalar’s `ι`-weight. The total numeric logarithm at zero does not satisfy this translation rule.

- For a positive integral `q`, an integer Tate twist shifts a pure weight `n` to `n−2r`.

- Scalar twists of tensor factors multiply their scalars.

- Two successive scalar twists equal the twist by the product.

#### Checks
- `ℚ_ℓ(1) = E^{(q⁻¹)}` is pure of weight `−2`, and `ℚ_ℓ(r)` of weight `−2r`.

- `twist_one`: `twist 1 F = F`, and `V(0) = V`.

- The half twist depends on the square root: for `V = E` and `F = 1`, the choices `q^{1/2}` and `−q^{1/2}` give `eigenvalues q^{−1/2}` and `−q^{−1/2}`, non-isomorphic Frobenius modules, both of weight `−1`.

- For `b` with `w_{ι,q}(b) = 1/2`, for instance `b` transcendental with `|ι(b)| = q^{1/4}`, `E^{(b)}` is `ι`-pure of the non-integral weight `1/2` and is not pure in the sense of Weil numbers.

*Needs:* [0.4](#target-0-4), [0.2](#target-0-2), [0.13](#target-0-13), [EtaleCohomologyFoundations §§F.0–F.4 (constructible derived coefficients, base change and finiteness)](#input-e12), [EtaleCohomologyFoundations §§F.0.3, F.10.1–F.10.2b (Tate twists and Frobenius)](#input-e14).

(Sources: [WII](#ref-wii), §1.2, (1.2.7), p. 154; [WII](#ref-wii), §1.2, Stabilités (1.2.5)(iv), p. 154.)

<a id="target-0-16"></a>

### 0.16. Eigenvalues under a Frobenius-equivariant perfect pairing

Let `V` and `V′` be `E`-spaces of finite dimension `d` with invertible endomorphisms `F` and `F′`, and `⟨ , ⟩ : V × V′ → E` a perfect bilinear pairing with `⟨Fx, F′y⟩ = c⟨x, y⟩` for some `c ∈ E^×`. Then: (i) under the isomorphism `V′ ≅ V^*` given by the pairing, `F′` corresponds to `c·(F⁻¹)^*`; (ii) the eigenvalue multiset of `F′` is `{c/α_i}`, and `det(T − F′) = (−T)^d det(c/T − F) / det F`; (iii) over `Ē`, the maximal generalized eigenspaces satisfy `⟨V_α, V′_β⟩ = 0` unless `αβ = c`, and the pairing restricts to a perfect pairing `V_α × V′_{c/α} → Ē`; (iv) if `V` is pure of weight `n` and `c` is a Weil `q`-number of weight `w`, then `V′` is pure of weight `w − n`, and likewise for `ι`-weights. If `V′=V` and `F′=F`, the eigenvalue multiset of `F` is stable under `α↦c/α`.

The pairing is perfect and its target line has Frobenius scalar `c`. Generalized eigenspaces are used; self-pairing multiplicity parity and functional-equation signs are outside this roadmap.

Check: for `V=V′=ℚ`, `B(x,y)=xy`, `F=2`, `F′=3` and `c=6`, the pairing identity holds and the two spectra are `{2}` and `{3}`. The first spectrum is not invariant under `α↦6/α`: equality of the spaces alone does not give self-pairing symmetry.

*Needs:* [0.7](#target-0-7), [0.11](#target-0-11), [0.2](#target-0-2), [Matrix.charpoly_inv](#input-b18).

(Sources: [WI](#ref-wi), §2, (2.5), p. 281; [Yu](#ref-yu), §1 pp. 2–3; §7.1 p. 64.)

<a id="target-0-17"></a>

### 0.17. Disjoint spectra: no nonzero Frobenius-equivariant maps between different weights

Let `F` and `G` be endomorphisms of finite-dimensional `E`-spaces `V` and `W` whose characteristic polynomials have no common root in `Ē`, equivalently are coprime in `E[T]`. Then every `E`-linear `u : V → W` with `u ∘ F = G ∘ u` is zero. In particular: (i) if `V` is pure of weight `n` and `W` pure of weight `m ≠ n`, relative to `q > 1`, or `ι`-pure of weights `β ≠ γ`, then there is no nonzero equivariant map `V → W`; (ii) if `W ⊆ V` is `F`-stable, with `W` pure of weight `n` and `V/W` pure of weight `m ≠ n`, then `W` has a unique `F`-stable complement.

Require `q>1` to separate weights. Equal weights permit both nonzero maps and nonsplit extensions.

*Needs:* [0.7](#target-0-7), [0.1](#target-0-1), [0.4](#target-0-4), [Polynomial.isCoprime_iff_aeval_ne_zero_of_isAlgClosed](#input-b22), [LinearMap.aeval_self_charpoly](#input-b23), [Polynomial.sup_ker_aeval_eq_ker_aeval_mul_of_coprime](#input-b24).

(Sources: [WI](#ref-wi), §1, preuve de (1.7) ⇒ (1.6), p. 277.)

Polynomial evaluation respects intertwiners: from `uF=Gu` one obtains `uP(F)=P(G)u`
for every `P∈E[T]`. Use this identity and Cayley–Hamilton for the coprime-spectrum
argument. It requires no semisimplicity or chosen eigenbasis (Weil I, proof of `(1.7) ⇒ (1.6)`,
`p`. `277`; Mathlib `LinearMap.aeval_self_charpoly`).

<a id="target-0-18"></a>

### 0.18. Decomposition of a Frobenius module by weights

Let `F` be an invertible endomorphism of a finite-dimensional `E`-space `V`, and `q > 1`. (i) If every eigenvalue of `F` is a Weil `q`-number, then `V = ⊕_n V_n`, a finite sum over `n ∈ ℤ`. Here `V_n = ker P_n(F)`, and `P_n ∈ E[T]` is the monic polynomial whose roots are the eigenvalues of weight `n`, with their multiplicities. Each `V_n` is `F`-stable and pure of weight `n`, and `det(T − F) = ∏ P_n`. (ii) For `ι : Ē → ℂ` the same holds over `Ē` with real weights: `V ⊗ Ē = ⊕_β (V ⊗ Ē)_β`. (iii) The decompositions are functorial: an equivariant map `V → W` maps `V_n` into `W_n`.

Integer-weight factors descend to the perfect coefficient field `E`. Fixed-`ι` real-weight summands may exist only after coefficient extension. Each summand may be nonsemisimple.

*Needs:* [0.7](#target-0-7), [0.17](#target-0-17), [0.1](#target-0-1), [Polynomial.sup_ker_aeval_eq_ker_aeval_mul_of_coprime](#input-b24), [LinearMap.aeval_self_charpoly](#input-b23), [LinearMap.finrank_maxGenEigenspace_eq](#input-b11).

(Sources: [WI](#ref-wi), §1, preuve de (1.7) ⇒ (1.6), p. 277.)

<a id="target-0-19"></a>

### 0.19. Scalar and Weil–Deligne purity comparisons

Let `E` be a characteristic-zero field, `V` a finite-dimensional `E`-space,
`q : ℕ` with `2≤q`, and `w : ℤ`. The scalar comparison is
`IsWeilNumber (q : ℝ) w α ↔ WeilDeligneRep.IsWeilNumber q w α`
for `α` in any characteristic-zero coefficient field, including an algebraic
closure of `E`. The right side has no `q>1` clause; the hypothesis `2≤q` supplies
that clause on the left. The comparison retains algebraicity and every complex
conjugate in its scalar condition.

For an invertible `F` on `V`, prove
`WeilDeligneRep.IsPureEnd q w F 0 ↔ IsPure (q : ℝ) w F`.
For nilpotent `N` with `NF=qFN`, use the supplier's filtration `M` centered at zero
and its `F`-stability. Write `F_a` for
the endomorphism induced by `F` on `grᴹ_a=M_a/M_(a−1)`. Prove
`WeilDeligneRep.IsPureEnd q w F N ↔ ∀ a : ℤ, IsPure (q : ℝ) (w+a) F_a`.
For `WeilDeligneRep.IsPure r N q w F`, apply this comparison to `r(F)` at a
geometric lift with the same nilpotence and commutation hypotheses. The case
`N=0` uses `M_(−1)=0` and `M_0=V`; the other graded pieces vanish. No
semisimplicity hypothesis is needed in either comparison.

Express ordinary purity by every nonzero eigenvector over the algebraic closure,
and express purity on `W/U` for `F`-stable `U⊆W` by
representatives `v∈W_Ē` with `v∉U_Ē` and `(F−α)v∈U_Ē`. Apply the latter with
`W=M_a` and `U=M_(a−1)`. As part of this comparison, identify
`Ē⊗_E(W/U)` with `W_Ē/U_Ē`, compatibly with the induced `F` action; field
extension is flat. These are the steps of the supplied monodromy filtration.
Ordinary purity and monodromy-graded purity remain
different predicates for general `N`.

#### Checks

- For `q=2`, `F=[[2,1],[0,2]]` and `N=0`, both purity predicates hold at weight `2`,
  although `F` is not semisimple. The only monodromy grade is zero.
- On the Tate line `F=q⁻¹`, `N=0`, both predicates have weight `−2`. In particular,
  geometric Frobenius gives the negative Tate shift.
- For `Sp(2)`, take `F=diag(1,q⁻¹)`, `Ne₀=e₁` and `Ne₁=0`. Then `NF=qFN`,
  `M_(−2)=0`, `M_(−1)=M_0=Ee₁` and `M_1=V`. The grades `−1` and `1` have ordinary
  weights `−2` and `0`, respectively, so the pair is Weil–Deligne-pure of weight
  `−1`. Its underlying Frobenius module has weights `{0,−2}` and is pure of no
  weight. Check the two induced operators at `q=2`.
- At `q=1`, `α=1` satisfies the supplier's scalar predicate at every integer
  weight, while `IsWeilNumber 1 w (1 : ℚ)` is false. Thus the scalar
  comparison requires its base-size hypothesis.

*Needs:* [0.1](#target-0-1), [0.7](#target-0-7), [0.8](#target-0-8),
[ArithmeticGaloisRepresentations §2.6](#input-agr-purity), Mathlib submodule
restriction, quotient maps and flat field extension.

(Sources: [WII](#ref-wii), §1.2, (1.2.1), (1.2.3)–(1.2.4), pp. 153–154;
§1.6, Proposition (1.6.1), p. 165; ArithmeticGaloisRepresentations §2.6,
the monodromy filtration and weights-and-purity definitions.)

### Examples

For `F=diag(1,2)` over `ℚ` and `q=2` the weights are `{0,2}`; the tensor square has weights `{0,2,2,4}`, and `∧²F` has its single weight `2`. Squaring both `F` and `q` leaves the original weights `{0,2}`. On `[[2,1],[0,2]]` the two roots both have weight `2` although the operator is not semisimple (§§0.7, `0.12`–`0.14`).

### Dependencies

Mathlib fields, minimal polynomials, algebraic closures, characteristic polynomials, generalized eigenspaces, tensor and exterior powers, valuations and direct sums, as named in the supplier contracts; ArithmeticGaloisRepresentations §2.6 for §0.19's numerical comparison.

## Layer DWP.1: The initial Weil estimate through Rosati positivity

Apply the imported Rosati involution and positivity to the `q`-Frobenius endomorphism. Its Tate realization gives the initial estimate without relying on either later purity theorem. The curve comparison uses the Jacobian `H¹` interface with the correct Frobenius normalization.

<a id="target-1-1"></a>

### 1.1. The abelian-variety Frobenius adapter

For an abelian variety `A` of dimension `g` over `𝔽_q`, view the supplied `q`-power scheme
Frobenius as the group endomorphism `AbelianVariety.frobenius A`. Naturality for multiplication
and the identity section gives its group-homomorphism property. Its degree is the supplied
finite-flat rank `q^g`, and its prime-to-characteristic Tate action is arithmetic Frobenius.
Its pullback on `H¹` is geometric Frobenius, via AbelianSchemesAndArithmeticModuli
§A4.4 / exteriorCohomology and the scheme/descent Frobenius comparison.
The intended signature is an element of `End(A)`, retaining its underlying over-`𝔽_q` scheme map.
The API identifies that map with the supplied qPowerFrobenius, its zero-section and
multiplication squares, its action on the Tate module, and degree `q^g`. Degree-`m` constant
extension has Frobenius `π_A^m`, with its relative-base-change identification.

#### Checks

- For an elliptic curve over `𝔽_q` the degree is `q`, even when there are fewer than `q` geometric
  points in its inseparable kernel; the rank is scheme-theoretic.
- For the zero-dimensional abelian variety `Spec 𝔽_q` the map is identity and its degree is `1=q^0`.
- For `A×B` of dimensions `g`,`h` the group map is the product and its degree is `q^(g+h)`.
- For `q=p²` the underlying map is the second `p`-Frobenius iterate; substituting a single
  `p`-Frobenius loses the `𝔽_q`-linear structure.

*Needs:* SchemeAndStackFoundations §0.29 (qPowerFrobenius and smooth finite-flat rank);
AbelianSchemesAndArithmeticModuli §§A3.1, A4.1, A4.4 / exteriorCohomology, A6.1; ArithmeticGaloisRepresentations §6.1;
EtaleCohomologyFoundations §§F.10.2–F.10.2b (scheme/descent Frobenius comparison).

(Source: [AV](#ref-av), Chapter II, §1, pp. 75–76.)

<a id="target-1-2"></a>

### 1.2. The Rosati–Frobenius identity through the adapter

For `A/𝔽_q` and a polarization `λ` defined over `𝔽_q`, import `π_A^†π_A=q` in `End⁰(A)`
from AbelianSchemesAndArithmeticModuli §A6.21 / frobeniusSemisimple. Identify
its `π_A` with §1.1's `q`-power Frobenius adapter, and its Rosati involution with
that of `λ`. This gives `π_A^∨λπ_A=qλ` in the adapter's notation.

*Needs:* [1.1](#target-1-1), AbelianSchemesAndArithmeticModuli §A6.21 / frobeniusSemisimple, [AbelianSchemesAndArithmeticModuli §A3.9 (Polarization.rosati)](#input-e2), [AbelianSchemesAndArithmeticModuli §A2.5 (Polarization)](#input-e1).

(Sources: [AV](#ref-av), Chapter II, Lemma 1.2, p. 76.)

<a id="target-1-3"></a>

### 1.3. Milne II.1.3: `α†α = r` forces `|a|² = r` for the roots of `P_α`

Let `A` be an abelian variety over a field `k` with a polarization and Rosati involution `†`, and `α ∈ End⁰(A)` with `α†α = r ∈ ℤ_{>0}`. Then `ℚ[α]` is a product of fields, stable under `†`, and `†` acts on each real factor of `ℚ[α] ⊗ ℝ` as the identity and on each complex factor as complex conjugation. Every root a of `P_α` in `ℂ` satisfies `|a|² = r`.

Use Rosati positivity on the commutative algebra `ℚ[α]`, independently of Tate isogeny or cohomological purity.

*Needs:* [AbelianSchemesAndArithmeticModuli §A6.14 (rosatiPositivity)](#input-e6), [AbelianSchemesAndArithmeticModuli §A6.12 (trace and degree through a subfield)](#input-e7), [AbelianSchemesAndArithmeticModuli §A3.9 (Polarization.rosati)](#input-e2), [AbelianSchemesAndArithmeticModuli §A6.10 (exists_charpoly, End.trace)](#input-e3).

(Sources: [AV](#ref-av), Chapter II, Lemma 1.3, p. 77.)

<a id="target-1-4"></a>

### 1.4. The Weil estimate for abelian varieties over `𝔽_q`

Let `A` be an abelian variety of dimension `g` over `𝔽_q`. Every root of the characteristic polynomial `P_{π_A} ∈ ℤ[X]` is a Weil `q`-number of weight `1`: all its complex conjugates have absolute value `q^{1/2}`. Equivalently, for every `ℓ ∤ q`, the geometric Frobenius on `H¹(A_{𝔽̄_q}, ℚ_ℓ)` is pure of weight `1`, and the geometric Frobenius on `V_ℓA` is pure of weight `−1`. The same holds for `π_A^m` relative to `q^m`.

Arithmetic Frobenius on `V_ℓA` is `π_A`, so geometric Frobenius there is `π_A⁻¹`. Geometric Frobenius on `H¹` is the ordinary transpose dual of `π_A`. The Rosati proof precedes DWP.4.

*Needs:* AbelianSchemesAndArithmeticModuli §A4.4 / exteriorCohomology, AbelianSchemesAndArithmeticModuli §A6.21 / frobeniusSemisimple, [1.2](#target-1-2) (adapter identification), [1.3](#target-1-3), [AbelianSchemesAndArithmeticModuli §A6.11 (charpolyTate)](#input-e4), [0.1](#target-0-1), [0.3](#target-0-3), [ArithmeticGaloisRepresentations §§1.1–1.6, 6.1–6.2 (finite coefficient models, lattices and Tate realizations)](#input-e11).

(Sources: [AV](#ref-av), Chapter II, Theorem 1.1(b), p. 75; [AV](#ref-av), Chapter II, Remark 1.4, p. 78.)

<a id="target-1-5"></a>

### 1.5. Point counts of abelian varieties over `𝔽_{q^m}`, and their bounds

Let `A` be an abelian variety of dimension `g` over `𝔽_q` with `P_{π_A}(X) = ∏_{i=1}^{2g}(X − a_i)`. Then for all `m ≥ 1`, `N_m = #A(𝔽_{q^m}) = deg(1 − π^m) = P_{π^m}(1) = ∏_i(1 − a_i^m)`, and `|N_m − q^{mg}| ≤ 2g·q^{m(g−1/2)} + (2^{2g} − 2g − 1)·q^{m(g−1)}`. The zeta function is `Z(A, t) = ∏_{r=0}^{2g} P_r(t)^{(−1)^{r+1}}`, where `P_r(t) = ∏(1 − a_{i_1}⋯a_{i_r}t)` over `1 ≤ i_1 < … < i_r ≤ 2g`, so `P_r(t)=det(1−t·∧^rπ | ∧^rV_ℓA)`, the reverse of the ordinary
characteristic polynomial `det(T−∧^rπ)`.

The differential of `1−π^m` is the identity, giving separability and the kernel count. The exact leading product is `q^g`. Milne II Remark `1.6(a)` calls `P_r` the
characteristic polynomial using the reversed convention; here ordinary
characteristic polynomials use `det(T−F)`.

**Checks.**

- For `r=0`, `P_0(t)=1−t`, while the ordinary characteristic polynomial is `T−1`.
- For an elliptic curve, `P_2(t)=1−qt`, while its ordinary polynomial is `T−q`.
- For `A=Spec 𝔽_q`, `Z(A,t)=(1−t)⁻¹`; the zeroth exterior power still contributes a line.

*Needs:* [1.4](#target-1-4), [1.1](#target-1-1), [AbelianSchemesAndArithmeticModuli §A6.1 (Hom.deg)](#input-e5), [AbelianSchemesAndArithmeticModuli §A6.10 (exists_charpoly, End.trace)](#input-e3), [0.11](#target-0-11), [0.13](#target-0-13), [0.14](#target-0-14).

(Sources: [AV](#ref-av), Chapter II, Theorem 1.1(a), p. 75; [AV](#ref-av), Chapter II, proof of Theorem 1.1, p. 76; [AV](#ref-av), Chapter II, Corollary 1.5 and Remark 1.6(a), p. 78.)

<a id="target-1-6"></a>

### 1.6. The Weil estimate for curves, through the Jacobian

Let `C` be a smooth projective geometrically connected curve of genus `g` over `𝔽_q`, `J` its Jacobian, and `P_{π_J}(X) = ∏(X − a_i)`. Then `#C(𝔽_{q^m}) = 1 − Σ_i a_i^m + q^m` for all `m ≥ 1`, the `a_i` are Weil `q`-numbers of weight `1`, `|#C(𝔽_{q^m}) − q^m − 1| ≤ 2g·q^{m/2}`, and `Z(C, t) = P_{π_J}^{rev}(t)/((1 − t)(1 − qt))` with `P^{rev}(t) = ∏(1 − a_i t)`.

Geometric connectedness is essential: conjugate components change counts. Use the imported curve/Jacobian fixed-point trace comparison.

*Needs:* [1.4](#target-1-4), [EtaleCohomologyFoundations §§F.0–F.4, F.10.1–F.10.5 and InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4 (finite cohomology, base change and geometric trace formulas)](#input-e49), [JacobianChallenge, Layer F (Abel–Jacobi), SchemeAndStackFoundations §3.6 (Picard torsors), and InverseGaloisAndArithmeticFundamentalGroups §IG.0.T1 (curve/Jacobian trace comparison)](#input-e61), [0.12](#target-0-12).

(Sources: [AV](#ref-av), Chapter III, Theorem 11.1, p. 118; [AV](#ref-av), Chapter III, Corollary 11.4, p. 119.)

<a id="target-1-7"></a>

### 1.7. The weights of `H⁰`, `H¹` and `H²` of a curve over `𝔽_q`

Let `C` be a smooth projective geometrically connected curve of genus `g` over `𝔽_q`, and `ℓ ∤ q`. Then `H⁰(C_{𝔽̄_q}, ℚ_ℓ) = ℚ_ℓ` is pure of weight `0`, `H²(C_{𝔽̄_q}, ℚ_ℓ) ≅ ℚ_ℓ(−1)` is pure of weight `2`, and `H¹(C_{𝔽̄_q}, ℚ_ℓ) ≅ H¹(J_{𝔽̄_q}, ℚ_ℓ) ≅ (V_ℓJ)^∨` is pure of weight `1`, with the geometric Frobenius having characteristic polynomial `P_{π_J}`. The same holds after any finite extension of `𝔽_q`.

The Abel–Jacobi `H¹` comparison is Frobenius-equivariant without assuming a rational base point. Permuted components give a nontrivial weight-zero `H⁰` permutation action.

*Needs:* AbelianSchemesAndArithmeticModuli §A4.4 / exteriorCohomology, [1.4](#target-1-4), [0.15](#target-0-15), [ArithmeticGaloisRepresentations §§1.1–1.6, 6.1–6.2 (finite coefficient models, lattices and Tate realizations)](#input-e11), [JacobianChallenge, Layer F (Abel–Jacobi), SchemeAndStackFoundations §3.6 (Picard torsors), and InverseGaloisAndArithmeticFundamentalGroups §IG.0.T1 (curve/Jacobian trace comparison)](#input-e61), [0.12](#target-0-12), [EtaleCohomologyFoundations §§F.3, F.5–F.6 (extreme-degree curve cohomology)](#input-e19).

(Sources: [AV](#ref-av), Chapter III, Remark 11.5, p. 119; [Yu](#ref-yu), §1 pp. 2–3; §7.1 p. 64.)

<a id="target-1-8"></a>

### 1.8. Compatibility with the Hasse bound for elliptic curves

For an elliptic curve `E` over `𝔽_q` with `a = q + 1 − #E(𝔽_q)` (the trace of Frobenius of Tau Ceti EllipticCurves Layer `3`), `P_{π_E}(X) = X² − aX + q`, and the Weil estimate for abelian varieties `(g = 1)` gives `|a| ≤ 2√q`. This is the Hasse bound that Tau Ceti EllipticCurves Layer `3` proves independently. Import this polynomial identity and its Tate realization from
AbelianSchemesAndArithmeticModuli §§A6.10–A6.11 / `charpoly_frobenius_elliptic`,
charpolyTate. Using that supplied identity, compare §1.4's root-modulus estimate
with the independent Hasse theorem of EllipticCurves Layer `3`.

*Needs:* [1.4](#target-1-4), [1.5](#target-1-5), AbelianSchemesAndArithmeticModuli §§A6.10–A6.11 / `charpoly_frobenius_elliptic`, charpolyTate, [EllipticCurves, Layer 3 (Hasse bound)](#input-e60).

(Sources: [AV](#ref-av), Chapter III, Theorem 11.1, p. 118.)

<a id="target-1-9"></a>

### 1.9. Compatibility of the Weil estimate with finite base extension

For `A` (resp. `C`) over `𝔽_q` and `m ≥ 1`, the Frobenius of `A ⊗ 𝔽_{q^m}` over `𝔽_{q^m}` is `π_A^m`, `P_{π^m}(X) = ∏(X − a_i^m)`, and the Weil estimate over `𝔽_{q^m}` (weight `1` relative to `q^m`) is equivalent to that over `𝔽_q` (weight `1` relative to `q`). The same holds for the weights of `H⁰`, `H¹` and `H²` of curves.

*Needs:* [1.1](#target-1-1), [0.12](#target-0-12), [0.3](#target-0-3).

(Sources: [AV](#ref-av), Chapter II, proof of Theorem 1.1, p. 76.)

<a id="target-1-10"></a>

### 1.10. Rational finite-field zeta functions

**Zeta rationality** (`finiteFieldZetaRationality`). For a separated finite-type scheme `X₀/𝔽_q` define
`Z(X₀,t)=∏_(x∈|X₀|)(1−t^(deg x))⁻¹` in `ℤ[[t]]`. Its logarithm is
`Σ_(n≥1)#X₀(𝔽_(qⁿ))tⁿ/n`. The supplied trace formula identifies it with the
finite product `∏_i det(1−tF,Hⁱ_c(X,ℚ_ℓ))^((−1)^(i+1))`. It is the Taylor
series of a rational function in `ℚ(t)`, with value `1` at zero. Prove descent of
rationality from `ℚ_ℓ` to `ℚ` by the finite-rank Hankel criterion on its rational
coefficients. This argument uses finiteness and trace, without purity. For a
constructible finite-model coefficient sheaf, the same determinant formula
provides rationality over its coefficient field; descent to `ℚ` requires its
Euler-series coefficients to lie in `ℚ`.

Suggested.lean defines `finiteFieldPointCount` using morphisms of schemes over
the finite ground field and `finiteFieldZeta` by the displayed exponential
series, with a chosen degree-`n` extension in each positive degree. Its statement
`finiteFieldZetaRationality` gives normalized rational numerator and denominator
polynomials for every separated finite-type scheme, without a smoothness or
properness hypothesis.

*Needs:* §0.10; EtaleCohomologyFoundations §§F.0–F.4, F.10.1–F.10.5 (coefficient
Euler product, Frobenius and finiteness); InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T3–IG.0.T4
(rational constructible trace and constant-sheaf point count for every finite extension); Mathlib power series and
finite-dimensional linear algebra.
(Source: [WI](#ref-wi), (1.1.1)–(1.1.2), (1.5.4) and proof of (1.7) ⇒ (1.6),
pp. 274–277.)

**Checks.**

- `Spec 𝔽_q` has `Z=(1−t)⁻¹`, whereas `Spec 𝔽_(q²)` viewed over `𝔽_q` has
  `Z=(1−t²)⁻¹` and no rational points in odd extension degrees.
- For `𝔾_m`, `#𝔾_m(𝔽_(qⁿ))=qⁿ−1` and `Z=(1−t)/(1−qt)`; the numerator
  and denominator reflect compact cohomology in degrees one and two.
- The empty scheme has `Z=1`. A Weil line on a point with transcendental
  scalar `b` has coefficient Euler series `(1−bt)⁻¹` over its coefficient field,
  and does not have rationality over `ℚ`.

### Examples

For `E:y²=x³−x` over `𝔽₃` there are three affine points and the point at infinity. Thus `a=3+1−4=0`, `P_π(T)=T²+3`, and its roots `±i√3` have weight `1`. In degree-two constant extension `π²` has both roots `−3` and `#E(𝔽₉)=(1+3)²=16` (§§1.4–1.9).

### Dependencies

DWP.0; SchemeAndStackFoundations §0.29; AbelianSchemesAndArithmeticModuli §§A2.5, A3.9, A4.1, A4.4, A6.1, A6.10–A6.14, A6.21; ArithmeticGaloisRepresentations §§6.1–6.2; JacobianChallenge Layer `F`; SchemeAndStackFoundations §3.6; InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1, IG.0.T3–IG.0.T4; EllipticCurves Layer `3`.

## Layer DWP.2: The symplectic tensor-power estimate

Use an open symplectic geometric image and its even-tensor coinvariants. Rational local factors make the tensor-power traces nonnegative; the nearest-pole argument bounds their eigenvalues. Letting the tensor degree grow removes the error term. The pairing supplies the reciprocal lower bound.

<a id="target-2-1"></a>

### 2.1. The Weil I curve coefficient interface

On an open `U₀⊂ℙ¹` over `𝔽_q`, specialize DWP.5’s common punctual purity predicate to a lisse `ℚ_ℓ`-sheaf `ℱ₀`: integer weight `β` means each closed-point stalk is pure `β` relative to `q^(deg x)`. The local determinant and Euler product are the EtaleCohomologyFoundations §§F.0–F.4, F.10.1–F.10.2b coefficient data and InverseGaloisAndArithmeticFundamentalGroups §IG.0.T3 rational constructible trace formula for the coefficient `L`-function, assembled in §1.10, with local variable `t^(deg x)`. Changing geometric stalk conjugates Frobenius and leaves its determinant unchanged; tensor weights add, dual weights negate, and the Tate line `ℚ_ℓ(r)` has weight `−2r`. This comparison fixes the inputs of Weil I §3 without defining a second purity predicate or `L`-function.

Keep the fixed `ℚ_ℓ` model; `ℚ̄_ℓ` is used for characteristic roots. This is the DWP.5 predicate specialized to open subsets of `ℙ¹`.

*Needs:* [5.3](#target-5-3), [0.7](#target-0-7), [0.15](#target-0-15), [1.10](#target-1-10), [EtaleCohomologyFoundations §§F.0–F.4, F.10.1–F.10.5 and InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4 (finite cohomology, base change and geometric trace formulas)](#input-e49).

(Sources: [WI](#ref-wi), §3, (3.1), p. 283.)

<a id="target-2-2"></a>

### 2.2. Open subgroups of `Sp(V)(ℚ_ℓ)` are Zariski-dense

Let `V` be a finite-dimensional `ℚ_ℓ`-vector space with a nondegenerate alternating form `ψ`, and `H ⊆ Sp(V, ψ)(ℚ_ℓ)` a subgroup open for the `ℓ`-adic topology. Then `H` is Zariski-dense in the algebraic group `Sp(V, ψ)`. Consequently, for every algebraic representation `W` of `Sp(V, ψ)`, such as `⊗^m V`, the `H`-invariants and `H`-coinvariants of `W` are the `Sp(V, ψ)`-invariants and `Sp(V, ψ)`-coinvariants.

The open subgroup uses the `ℓ`-adic topology. Connectedness of `Sp` is essential; an open subgroup of a disconnected orthogonal group need not be Zariski-dense in every component.

*Needs:* [ReductiveGroups, Layer 3 (subgroups, quotients and components)](#input-e65), [ReductiveGroups, Layer 2 (Lie algebras), and ReductiveGroupsPartII §RG2.0.2 (analytic charts)](#input-e64).

(Sources: [WI](#ref-wi), §3, (3.7), p. 285.)

<a id="target-2-3"></a>

### 2.3. Coinvariants of `⊗^{2k}V` under the symplectic group, over `ℚ_ℓ`

Let `V` be a `ℚ_ℓ`-vector space of dimension `2r ≥ 2` with a nondegenerate alternating form `ψ : V ⊗ V → L`, where `L` is one-dimensional `(L = ℚ_ℓ(−β))`. For a partition `P` of `{1, …, 2k}` into pairs `{a_i, b_i}` with `a_i < b_i`, let `ψ_P : ⊗^{2k}V → L^{⊗k}`, `v₁ ⊗ … ⊗ v_{2k} ↦ ∏_i ψ(v_{a_i}, v_{b_i})`. The `ψ_P` span the `Sp(V, ψ)`-invariant maps `⊗^{2k}V → L^{⊗k}`. For a suitable subset `𝒫′` of the pair partitions, depending on `dim V` and `k`, the `ψ_P` with `P ∈ 𝒫′` induce an isomorphism `(⊗^{2k}V)_{Sp(V, ψ)} ≅ (L^{⊗k})^N` with `N = #𝒫′ ≥ 1`. The isomorphism is compatible with every automorphism of `V` that multiplies `ψ` by a scalar, acting on `L` by that scalar.

Transfer the algebraic invariant theory from `ℚ` to `ℚ_ℓ` by flat base change. In the stable range `dim V≥2k` all pair partitions are independent; below it choose an independent subset.

*Needs:* [RepresentationTheory/SchurWeyl, Layer 9 (symplectic pair contractions)](#input-e69).

(Sources: [WI](#ref-wi), §3, (3.7), p. 285.)

<a id="target-2-4"></a>

### 2.4. Compact cohomology and the `L`-function of `⊗^{2k}F`

Under the hypotheses of Theorem `3.2`, with `U` affine and `F₀ ≠ 0: H⁰_c(U, ⊗^{2k}F) = 0`, `H²_c(U, ⊗^{2k}F) ≅ ℚ_ℓ(−kβ − 1)^N` with `N ≥ 1` as Frobenius modules, and `Z(U₀, ⊗^{2k}F₀, t) = det(1 − F^*t, H¹_c(U, ⊗^{2k}F)) / (1 − q^{kβ+1}t)^N`. So `Z(U₀, ⊗^{2k}F₀, t)` is the Taylor expansion of a rational function whose only poles are at `t = q^{−kβ−1}`.

Take `U` affine and `F₀≠0`. Import the curve coinvariant description of `H²_c` and the coefficient trace formula.

*Needs:* [2.1](#target-2-1), [2.2](#target-2-2), [2.3](#target-2-3), [EtaleCohomologyFoundations §§F.0–F.4, F.10.1–F.10.5 and InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4 (finite cohomology, base change and geometric trace formulas)](#input-e49), [EtaleCohomologyFoundations §§F.3, F.5–F.6 (extreme-degree curve cohomology)](#input-e19).

(Sources: [WI](#ref-wi), §3, (3.7), p. 285; [WI](#ref-wi), §2, Scholie (2.10), p. 282.)

<a id="target-2-5"></a>

### 2.5. Lemma `3.3`: nonnegative rational `log`-derivatives of even tensor powers

Under hypothesis (iii) of Theorem `3.2`, for every even integer `2k` and every `x ∈ |U₀|`, the power series `t (d/dt) log det(1 − F_x t, ⊗^{2k}F₀)⁻¹` has nonnegative rational coefficients.

*Needs:* [0.10](#target-0-10), [LinearMap.trace_tensorProduct'](#input-b20).

(Sources: [WI](#ref-wi), §3, Lemme (3.3), p. 284.)

<a id="target-2-6"></a>

### 2.6. Lemma `3.4`: local factors of even tensor powers have nonnegative coefficients

Under hypothesis (iii) of Theorem `3.2`, for every even `2k` and `x ∈ |U₀|`, the local factor `det(1 − F_x t^{deg x}, ⊗^{2k}F₀)⁻¹ ∈ ℚ[[t]]` has constant term `1` and nonnegative coefficients.

*Needs:* [2.5](#target-2-5).

(Sources: [WI](#ref-wi), §3, Lemme (3.4), p. 284.)

<a id="target-2-7"></a>

### 2.7. Lemma `3.5`: factors of a product of positive power series converge at least as far

Let `(f_i)` be a countable family of power series `f_i = Σ_n a_{i,n} t^n` with constant term `1` and nonnegative real coefficients, such that `ord(f_i − 1) → ∞`, and let `f = ∏_i f_i = Σ_n a_n t^n`. Then `a_{i,n} ≤ a_n` for all `i` and `n`. Hence the radius of absolute convergence of each `f_i` is at least that of `f`.

*Needs:* elementary power-series comparison.

(Sources: [WI](#ref-wi), §3, Lemme (3.5), p. 284.)

<a id="target-2-8"></a>

### 2.8. Lemma `3.6`: poles of the factors lie no closer than the poles of the product

Under the hypotheses of Lemma `3.5`, if `f` and all the `f_i` are Taylor expansions at `0` of meromorphic functions on `ℂ`, then `inf`{`|z| : f_i` has a pole at `z`} `≥ inf`{`|z| : f` has a pole at `z`}.

*Needs:* [2.7](#target-2-7).

(Sources: [WI](#ref-wi), §3, Lemme (3.6), p. 284.)

<a id="target-2-9"></a>

### 2.9. Weil `I`, Theorem `3.2`: the fundamental estimate

Let `U₀ ⊆ ℙ¹` over `𝔽_q` be open, `F₀` a lisse `ℚ_ℓ`-sheaf on `U₀`, and `β ∈ ℤ`. Assume (i) `F₀` carries a nondegenerate alternating pairing `ψ : F₀ ⊗ F₀ → ℚ_ℓ(−β)`; (ii) the image of the geometric fundamental group `π₁(U, ū)` in `GL(F_ū)` is an open subgroup of `Sp(F_ū, ψ)`; (iii) for every `x ∈ |U₀|`, `det(1 − F_x t, F₀)` has rational coefficients. Then `F₀` has weight `β`: every eigenvalue of every `F_x` is an algebraic number all of whose complex conjugates have absolute value `q_x^{β/2}`.

Use openness in `Sp`, rational local factors of the fixed `ℚ_ℓ` sheaf, and the specified pairing; the proof proceeds without a cohomological purity input.

*Needs:* [2.1](#target-2-1), [2.4](#target-2-4), [2.6](#target-2-6), [2.8](#target-2-8), [0.16](#target-0-16), [0.13](#target-0-13), [0.1](#target-0-1).

(Sources: [WI](#ref-wi), §3, Théorème (3.2), p. 284; [WI](#ref-wi), §3, proof of (3.2), p. 285.)

<a id="target-2-10"></a>

### 2.10. Corollary `3.8`: the coarse bound on `H¹_c(U, F)`

Under the hypotheses of Theorem `3.2`, with `U` affine, every eigenvalue `α` of `F^*` on `H¹_c(U, F)` is an algebraic number, and every complex conjugate of `α` satisfies `|α| ≤ q^{β/2 + 1}`.

*Needs:* [2.9](#target-2-9), [2.1](#target-2-1), [2.2](#target-2-2), [EtaleCohomologyFoundations §§F.0–F.4, F.10.1–F.10.5 and InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4 (finite cohomology, base change and geometric trace formulas)](#input-e49), [EtaleCohomologyFoundations §§F.3, F.5–F.6 (extreme-degree curve cohomology)](#input-e19).

(Sources: [WI](#ref-wi), §3, Corollaire (3.8), p. 286.)

<a id="target-2-11"></a>

### 2.11. Corollary `3.9`: the two-sided coarse bound on `H¹(ℙ¹, j_*F)`

Let `j : U → ℙ¹` be the inclusion. Under the hypotheses of Theorem `3.2`, every eigenvalue `α` of `F^*` on `H¹(ℙ¹, j_*F)` is an algebraic number, and every complex conjugate of `α` satisfies `q^{β/2} ≤ |α| ≤ q^{β/2 + 1}`; in Deligne's notation `q^{(β+1)/2 − 1/2} ≤ |α| ≤ q^{(β+1)/2 + 1/2}`.

Use the imported duality pairing for `H¹(ℙ¹,j_*F)`.

*Needs:* [2.10](#target-2-10), [0.16](#target-0-16), [EtaleCohomologyFoundations §§F.5–F.6, 0.11 (curve duality)](#input-e17).

(Sources: [WI](#ref-wi), §3, Corollaire (3.9), p. 286; [WI](#ref-wi), §3, Corollaire (3.9), p. 287.)

### Examples

In tensor degree two the pairing contraction gives one symplectic coinvariant line with scalar `q^β`; the curve top compact cohomology twists by `(−1)`, so its scalar is `q^(β+1)`. This fixes the denominator `1−q^(β+1)t`. For `F=0` the nonzero-system hypotheses cannot be inferred from positivity of a trace (§§2.3–2.5).

### Dependencies

DWP.0 and the coefficient definitions of §§5.1–5.3; EtaleCohomologyFoundations §§F.0–F.7, F.10.1–F.10.5; InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T3–IG.0.T4 (rational constructible trace and constant-sheaf point count for every finite extension); ReductiveGroups Layers `2`–`3`; ReductiveGroupsPartII §RG2.0.2; RepresentationTheory/SchurWeyl Layer `9`; §1.10 here.

## Layer DWP.3: Rational local factors of a Lefschetz pencil

Descend the vanishing-system radical and pairing to the finite field, and isolate its local factors from the zeta functions of the pencil fibres. Open arithmetic monodromy and a Haar-null exceptional locus feed the function-field density argument. Rationality is the output needed by the fundamental estimate, rather than an assumed coefficient property of the vanishing quotient. Throughout DWP.3, `d` denotes the odd pencil fibre dimension.

<a id="target-3-1"></a>

### 3.1. Arithmetic descent of the pencil radical quotient

For a finite-field Lefschetz pencil on a geometrically connected smooth projective even-dimensional variety, the LPV.`4` vanishing system `ℰ` and its radical quotient `ℱ=ℰ/(ℰ∩ℰ⊥)` descend to lisse `ℚ_ℓ`-sheaves `ℰ₀` and `ℱ₀` over the smooth-parameter open `U₀`. The supplied perfect alternating pairing on `ℱ₀` has values in `ℚ_ℓ(−d)`, with `d` odd the fixed fibre dimension, so a local geometric Frobenius of degree `e` acts by a symplectic similitude with multiplier `q^(de)`. The zero quotient is permitted. LPV.`4` owns the construction and perfection of the quotient; this target supplies its finite-field descent and arithmetic normalization.

*Needs:* [LefschetzPencilsAndVanishingCycles §§3.4–3.5 (existence and finite-field descent of pencils)](#input-e35), [LefschetzPencilsAndVanishingCycles §4.4 (radical quotient and pairing)](#input-e38), [EtaleCohomologyFoundations §§F.6, F.10.2–F.10.2b (equivariant pairings and traces)](#input-e20), [EtaleCohomologyFoundations §§F.0.A1–F.0.A2 and InverseGaloisAndArithmeticFundamentalGroups §§IG.1.2–IG.1.3 (arithmetic exact sequence, covers and specialization)](#input-e27).

(Sources: [WI](#ref-wi), §6, (6.1), pp. 294–295.)

<a id="target-3-2"></a>

### 3.2. Weil I Lemma `6.4`: geometrically constant lisse sheaves come from `𝔽_q`

Let `U₀` be geometrically connected over `𝔽_q` and let `𝒢₀` be a lisse `ℚ_ℓ`-sheaf on `U₀` whose pullback `𝒢` to `U` is constant. Then there are `ℓ`-adic units `α_i ∈ ℚ̄_ℓ` with `det(1 − F_x t^{deg x}, 𝒢₀) = ∏_i(1 − α_i^{deg x} t^{deg x})` for every `x ∈ |U₀|`. In fact `𝒢₀` is the pullback of its direct image to `Spec 𝔽_q`, a representation `G₀` of `Gal(𝔽̄_q/𝔽_q)`, and `∏(1 − α_i t) = det(1 − F t, G₀)`.

Compact arithmetic image makes the `α_i ℓ`-adic units. Apply to the constant cohomological pieces and radical of the pencil.

*Needs:* [LefschetzPencilsAndVanishingCycles §§4.1–4.5 (global vanishing cycles)](#input-e36), [0.12](#target-0-12), [EtaleCohomologyFoundations §§F.0.A1–F.0.A2 and InverseGaloisAndArithmeticFundamentalGroups §§IG.1.2–IG.1.3 (arithmetic exact sequence, covers and specialization)](#input-e27).

(Sources: [WI](#ref-wi), §6, Lemme (6.4), p. 295; [WI](#ref-wi), §6, proof of (6.4), p. 296.)

<a id="target-3-3"></a>

### 3.3. The zeta functions of the fibres, split into a constant part and the `ℱ₀` part

In the setting of [3.1](#target-3-1), there are `ℓ`-adic units `α_1`, `…`, `α_N` and `β_1`, `…`, `β_M` in `ℚ̄_ℓ`, with `α_i ≠ β_j` for all `i` and `j`, such that for every `x ∈ |U₀|`, `Z(X_x, t) = [∏_i(1 − α_i^{deg x} t) / ∏_j(1 − β_j^{deg x} t)] · det(1 − F_x t, ℱ₀)^{(−1)^{d+1}}`, where `t` is the variable for the residue field `k(x)`. In particular the right-hand side lies in `ℚ(t)`.

Cancel common `α_i` and `β_j` first. Rationality of the fibre zeta functions is an input, while their purity is not.

*Needs:* [3.1](#target-3-1), [3.2](#target-3-2), [0.8](#target-0-8), [1.10](#target-1-10), [EtaleCohomologyFoundations §§F.0–F.4, F.10.1–F.10.5 and InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4 (finite cohomology, base change and geometric trace formulas)](#input-e49).

(Sources: [WI](#ref-wi), §6, (6.4), p. 296; [WI](#ref-wi), §1, (1.5.4), p. 276.)

<a id="target-3-4"></a>

### 3.4. Weil I Lemma `6.7`: a family is determined by its `n`-th powers for enough `n`

Let `K` be a finite set of nonnegative integers different from `1`, and `(δ_j)_{j ≤ Q}`, `(ε_j)_{j ≤ Q}` two families of elements of a field. If, for all sufficiently large `n` divisible by no element of `K`, the families `(δ_j^n)` and `(ε_j^n)` agree up to order, then `(δ_j)` and `(ε_j)` agree up to order.

The finite families retain multiplicities and the excluded divisor set does not contain `1`.

*Needs:* finite multisets and powers in a field.

(Sources: [WI](#ref-wi), §6, proof of (6.7), p. 297.)

<a id="target-3-5"></a>

### 3.5. Weil I Lemma `6.11`: the arithmetic monodromy of `ℱ₀` is open in `H`

Let `d` be the fixed odd pencil fibre dimension and `ℱ₀≠0` its supplied radical quotient with pairing into `ℚ_ℓ(−d)`. Use the arithmetic coordinate `a∈ℤ̂`, where geometric Frobenius of a degree-`e` point has `a=−e`. In a fixed finite `ℓ`-adic coefficient model define `H={(a,g)∈ℤ̂×GSp(ℱ,ψ): μ(g)=q^(−da)}`. Then (arithmetic degree,`ρ`)`:π₁(U₀)→H` has open image `H₁`, compact because `π₁(U₀)` is profinite. Its degree-zero image is open in `Sp` for the `ℓ`-adic topology.

*Needs:* [3.1](#target-3-1), [LefschetzPencilsAndVanishingCycles §§5.7–5.8 (compact symplectic groups and Kazhdan–Margulis)](#input-e42), [EtaleCohomologyFoundations §§F.0.A1–F.0.A2 and InverseGaloisAndArithmeticFundamentalGroups §§IG.1.2–IG.1.3 (arithmetic exact sequence, covers and specialization)](#input-e27).

(Sources: [WI](#ref-wi), §6, (6.10), p. 297; Lemme (6.11), p. 298.)

<a id="target-3-6"></a>

### 3.6. Weil I Lemma `6.12`: the eigenvalue-`δ^a` locus is closed and Haar-null

For an `ℓ`-adic unit `δ` in the fixed finite coefficient field, the locus `Z_δ={(a,g)∈H₁: δ^a is an eigenvalue of g}` is closed and null in each arithmetic-degree fibre, hence Haar-null in `H₁`. For a bad geometric eigenvalue `δ₀^e` the arithmetic-degree locus uses `δ=δ₀⁻¹`, since `a(F_x)=−e`.

The unit condition defines `δ^a` for `a∈ℤ̂`. A zero quotient has empty eigenvalue locus.

*Needs:* [3.5](#target-3-5), [RepresentationTheory/CompactGroups, Layers 0, 6 and the SU(2) engine case (Haar probability, characters and SU(2))](#input-e68).

(Sources: [WI](#ref-wi), §6, Lemme (6.12), p. 298; [WI](#ref-wi), §6, proof of (6.12), p. 298.)

Prove `symplecticCoset_polynomial_zeroSet_null`: over a finite extension `E` of `ℚ_ℓ`,
let `V≠0` have a perfect alternating form and let `gSp(V)` be a coset of its symplectic
point group. A polynomial function that is not identically zero on that algebraic
coset has zero set of Haar measure zero on every open subset, with Haar transported
from `Sp(V)(E)`. First prove this for a nonzero polynomial on `E^m` using finite root
sets and Fubini, then use smooth analytic charts and Zariski density. In the
characteristic-polynomial condition above the polynomial is nonzero on the coset;
retain the nonzero `V` hypothesis. For the zero quotient there are no characteristic
roots and `Z_δ` is empty. *Needs:* ReductiveGroupsPartII §RG2.0.2 (analytic charts and
Haar Jacobians); RepresentationTheory/CompactGroups, Layer `0` (Haar); §2.2.
(Source: [WI](#ref-wi), Lemma 6.12 and proof, p. 298.)

<a id="target-3-7"></a>

### 3.7. The Frobenius elements landing in a Haar-null set have density zero

Let `δ_1`, `…`, `δ_Q` be `ℓ`-adic units. The set `L` of `x ∈ |U₀|` such that some `δ_j^{deg x}` is an eigenvalue of `F_x` on `ℱ₀` has Dirichlet density `0`. More precisely, the proportion of the closed points of degree `n` that lie in `L` tends to `0` as `n → ∞`. In particular, for every sufficiently large `n` there are closed points of degree `n` outside `L`.

Use finite-quotient Chebotarev with constant-field congruences, then approximate the closed null locus by open neighbourhoods of arbitrarily small Haar measure.

*Needs:* [3.6](#target-3-6), [3.5](#target-3-5), [ArithmeticGaloisRepresentations §5.13 (finite function-field Chebotarev), with the degree refinements of §3.7 here](#input-e25), [RepresentationTheory/CompactGroups, Layers 0, 6 and the SU(2) engine case (Haar probability, characters and SU(2))](#input-e68).

(Sources: [WI](#ref-wi), §6, (6.13), p. 298.)

The degree refinement is a target `finiteCover_degreeChebotarev`. For a finite
étale connected Galois cover of smooth geometrically connected curves over `𝔽_q`,
let `H` be its arithmetic deck group, `H_geo` the geometric subgroup, and
`H/H_geo` the cyclic constant-field quotient. For a conjugation-stable set `A⊂H`,
in degree `n` its proportion tends to `|A∩H_n|/|H_geo|`, where `H_n` is the arithmetic
Frobenius coset prescribed by `n` in the constant-field quotient. The number of
points in degree `n` is asymptotic to `q^n/n`. Convert to geometric Frobenius by
inverting the coset and the classes. Prove this from the curve Weil estimate and
finite-cover fixed-point counts, independently of DWP.10.
*Needs:* §1.6; ArithmeticGaloisRepresentations §5.13; EtaleCohomologyFoundations §F.10.1. (Sources: [WI](#ref-wi), §6 (6.13), p. 298; [WII](#ref-wii), §§1.11, 2.2,
pp. 184–186, 195–196.)

Prove `uniform_null_fibre_mass`. Let `H` be a compact group, `π:H→A` a continuous
surjective homomorphism to a compact group, and `K=ker π`. For clopen `U⊂H` put
`h_U(a)=∫_K 1_U(gk) dμ_K` for any `g` with `π(g)=a`, using Haar probability on `K`.
The value is independent of `g`, is continuous in `a`, and its integral against
Haar probability on `A` is `μ_H(U)`. If `U_j` is a decreasing sequence of clopen
neighbourhoods of a closed `Z`, with intersection `Z` and every fibre having `K`-Haar
measure zero, then `sup_a h_(U_j)(a)→0`. Here use second countable profinite `H` so
such a sequence exists; Dini's theorem supplies the uniform limit. Applying
`finiteCover_degreeChebotarev` to finite quotient images of `U_j` gives the degreewise
density-zero assertion of §3.7, with constant-field congruences kept throughout.
*Needs:* RepresentationTheory/CompactGroups, Layer 0; Mathlib compactness and
integration; `finiteCover_degreeChebotarev`. (Source: [WI](#ref-wi), proof of (6.13),
p. 298, with compact-quotient Haar integration and the Dini argument.)

<a id="target-3-8"></a>

### 3.8. Weil I Proposition `6.6`: the denominator of (6.6.1) away from `K` and `L`

Let `(γ_i)_{i ≤ P}` and `(δ_j)_{j ≤ Q}` be families of `ℓ`-adic units with `γ_i ≠ δ_j`. There are a finite set `K` of nonnegative integers different from `1` and a density-zero set `L ⊂ |U₀|` such that, for `x ∉ L` with `deg x` divisible by no element of `K`, the rational function `det(1 − F_x t, ℱ₀)·∏_i(1 − γ_i^{deg x} t) / ∏_j(1 − δ_j^{deg x} t)`, written in lowest terms, has denominator `∏_j(1 − δ_j^{deg x} t)`.

Exclude both collisions between constant factors and collisions with the quotient spectrum.

*Needs:* [3.7](#target-3-7), [3.4](#target-3-4).

(Sources: [WI](#ref-wi), §6, Proposition (6.6), p. 296; [WI](#ref-wi), §6, (6.13), p. 298.)

<a id="target-3-9"></a>

### 3.9. Weil I Proposition `6.8`: an intrinsic characterisation of the `γ`-polynomial

Let `(γ_i)_{i ≤ P}` and `(δ_j)_{j ≤ Q}` be families of `ℓ`-adic units, `R(t) = ∏(1 − γ_i t)` and `S(t) = ∏(1 − δ_j t)`. If, for every `x ∈ |U₀|`, `∏_j(1 − δ_j^{deg x} t)` divides `∏_i(1 − γ_i^{deg x} t)·det(1 − F_x t, ℱ₀)`, then `S(t)` divides `R(t)`. Consequently `R(t)` is the least common multiple of the `S(t)` satisfying this hypothesis, which characterises the `γ`-family intrinsically from the polynomials `∏(1 − γ_i^{deg x}t)·det(1 − F_x t, ℱ₀)`.

*Needs:* [3.8](#target-3-8).

(Sources: [WI](#ref-wi), §6, Proposition (6.8), p. 297.)

<a id="target-3-10"></a>

### 3.10. Weil I Theorem `6.2`: the local factors of the radical quotient have rational coefficients

In the setting of [3.1](#target-3-1), for every `x ∈ |U₀|`, `det(1 − F_x t, ℱ₀) ∈ ℚ[t]`.

The zero quotient has factor `1`; the nonzero case uses rational zeta functions, open monodromy and Chebotarev.

*Needs:* [3.3](#target-3-3), [3.8](#target-3-8), [3.9](#target-3-9), [3.4](#target-3-4), [3.7](#target-3-7).

(Sources: [WI](#ref-wi), §6, Théorème (6.2), p. 295; [WI](#ref-wi), §6, (6.9), p. 297.)

<a id="target-3-11"></a>

### 3.11. Weil I Corollary `6.3`: the coarse bound on `H¹(D, j_*ℱ)`

Let `d` be the odd pencil fibre dimension and `j : U → D` the inclusion. Every eigenvalue `α` of `F^*` on `H¹(D, j_*ℱ)` is an algebraic number, and every complex conjugate satisfies `q^{(d+1)/2 − 1/2} ≤ |α| ≤ q^{(d+1)/2 + 1/2}`.

Use `2.9` with `β` equal to the odd pencil fibre dimension, combining the supplied pairing and open image with `3.10`.

*Needs:* [3.10](#target-3-10), [3.1](#target-3-1), [2.9](#target-2-9), [2.11](#target-2-11), [LefschetzPencilsAndVanishingCycles §§5.7–5.8 (compact symplectic groups and Kazhdan–Margulis)](#input-e42).

(Sources: [WI](#ref-wi), §6, Corollaire (6.3), p. 295.)

### Examples

A zero radical quotient has local factor `1`. Squaring the multiset `{2,−2}` gives `{4,4}`, so one exponent does not determine a family; §3.4 requires every sufficiently large allowed exponent. On `H=C₂×C₂` projecting to the first factor, a singleton over zero has conditional mass `1/2` there and `0` over one, fixing the fibre rather than total Haar normalization (§§3.4, `3.7`).

### Dependencies

DWP.0–DWP.2; LefschetzPencilsAndVanishingCycles §§3.1–3.5, `4.1`–`4.4`, `5.2`–`5.8`; EtaleCohomologyFoundations §§F.10.1–F.10.5; InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T3–IG.0.T4 (rational constructible trace and constant-sheaf point count for every finite extension); EtaleCohomologyFoundations §§F.0.A1–F.0.A2 and InverseGaloisAndArithmeticFundamentalGroups §§IG.1.2–IG.1.3; ArithmeticGaloisRepresentations §5.13; ReductiveGroupsPartII §RG2.0.2; RepresentationTheory/CompactGroups Layer `0`; §1.10 here.

## Layer DWP.4: Smooth projective purity by induction and Cartesian powers

The first reduction gives a half-unit error in even middle dimension. Large even Cartesian powers divide that error by the power, and duality removes the remaining lower discrepancy. Weak Lefschetz and the pencil Leray sequence then recover all degrees.

<a id="target-4-1"></a>

### 4.1. The half-unit bound in even dimension

Let `X₀` be smooth projective of pure even dimension `d` over `𝔽_q`, `ℓ ≠` char `𝔽_q`. Every eigenvalue `α` of geometric Frobenius on `Hᵈ(X,ℚ_ℓ)` is algebraic; every complex conjugate satisfies `q^(d/2−1/2) ≤ |α| ≤ q^(d/2+1/2)`. No semisimplicity or degeneration of Leray is required. The induction retains `E∩E⊥` and covers zero vanishing cycles, a zero radical quotient, and a nonzero quotient.

*Needs:* [3.11](#target-3-11), [3.2](#target-3-2), [0.12](#target-0-12), [LefschetzPencilsAndVanishingCycles §4.1 (direct images of a pencil)](#input-e37), [LefschetzPencilsAndVanishingCycles §§3.4–3.5 (existence and finite-field descent of pencils)](#input-e35), [EtaleCohomologyFoundations §F.7 (blow-ups and weak Lefschetz)](#input-e23), [EtaleCohomologyFoundations §§F.0–F.4, F.10.1–F.10.5 and InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4 (finite cohomology, base change and geometric trace formulas)](#input-e49).

(Sources: [WI](#ref-wi), Weil I §7, Lemme (7.1) and (7.1.1)–(7.1.5), pp. 298–300.)

<a id="target-4-2"></a>

### 4.2. Purity in the middle degree

For smooth projective `X₀` of any pure dimension `d` over `𝔽_q`, every geometric-Frobenius eigenvalue on `Hᵈ(X,ℚ_ℓ)` is a Weil `q`-number of weight `d`.

*Needs:* [4.1](#target-4-1), [0.13](#target-0-13), [EtaleCohomologyFoundations §§F.0–F.4, F.10.1–F.10.5 and InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4 (finite cohomology, base change and geometric trace formulas)](#input-e49).

(Sources: [WI](#ref-wi), Weil I §7, Lemme (7.2), pp. 300–301; proof (7.3), p. 301.)

<a id="target-4-3"></a>

### 4.3. The Weil theorem for smooth projective varieties

For every smooth projective `X₀` over `𝔽_q` and every `i≥0`, each eigenvalue of geometric Frobenius on `Hⁱ(X,ℚ_ℓ)` is a Weil `q`-number of weight `i`. This is Weil I Lemma `1.7`; integral cohomological factors and their `ℓ`-independence follow by §4.4 here.

*Needs:* [4.2](#target-4-2), [0.9](#target-0-9), [0.12](#target-0-12), [EtaleCohomologyFoundations §F.7 (blow-ups and weak Lefschetz)](#input-e23), [EtaleCohomologyFoundations §§F.4–F.6 (rational adic Poincaré duality)](#input-e18).

(Sources: [WI](#ref-wi), Weil I §1, Lemme (1.7), p. 276; §7, Lemme (7.2) and proof (7.3), pp. 300–301.)

<a id="target-4-4"></a>

### 4.4. Extracting integral degree factors from distinct weights

**Degree-factor extraction** (`degreeFactorExtraction`). Fix `q>1` an integer and a rational function `R(t)∈ℚ(t)`
regular at zero with `R(0)=1`. Suppose, for each prime `ℓ` in a specified nonempty
set, there is a finite family of invertible finite-dimensional `ℚ_ℓ`-Frobenius
modules `V_(i,ℓ)`, indexed by nonnegative degrees `i`, with each `V_(i,ℓ)` pure of
weight `i` and `R(t)=∏_i det(1−tF,V_(i,ℓ))^((−1)^(i+1))`. Then there are unique
polynomials `Π_i(t)∈ℚ[t]` with `Π_i(0)=1`, independent of `ℓ`, realizing these degree
factors. Their reciprocal roots are exactly the weight-`i eigenvalues`, with
multiplicity. Distinct weights prevent cancellation, and the intrinsic weight
partition is stable under algebraic conjugacy. If every eigenvalue is integral
over `ℤ`, then `Π_i∈ℤ[t]`. Alternatively, when `R∈ℤ[[t]]`, prove the normalized
integral numerator/denominator theorem for rational series and apply Gauss's
lemma to obtain the same conclusion. Rationality and purity alone do not force
integrality for arbitrary coefficient realizations.

Apply this to smooth projective constant coefficients using §§1.10, `4.3`, and
to smooth proper or rational-homology-manifold constant coefficients using
§7.15's purity and §7.10's integrality. The abstract extraction theorem
precedes those applications. The statement `degreeFactorExtraction` in
Suggested.lean allows any nonempty family of characteristic-zero coefficient
fields, including these `ℚ_ℓ` realizations. It uses `IsWeilNumber` and `IsPure`
to retain the algebraicity and all-conjugates conditions on characteristic
roots, and includes both integrality hypotheses above.

*Needs:* §§0.1, 0.7, 0.10, 0.17 and 1.10; Mathlib polynomial factorization,
algebraic integrality and Gauss's lemma. The geometric applications also use
§4.3 or §7.15`(i)`,(iii), and §7.10.
(Sources: [WI](#ref-wi), proof of (1.7) ⇒ (1.6), pp. 276–277;
[WII](#ref-wii), (3.3.9), p. 207.)

**Checks.**

- For `ℙ¹`, `R=((1−t)(1−qt))⁻¹` gives `Π_0=1−t`, `Π_2=1−qt` and `Π_1=1`.
- Two weight-zero lines placed in opposite parities can cancel completely;
  `R=1` then cannot recover their factors. Distinct degree weights are essential.
- For `ℓ≠5` a weight-zero line with scalar `b=(3+4i)/5`, viewed through its
  two-dimensional rational model, has factor `1−(6/5)t+t²`. It is rational and
  pure but not integral; the integral-root or integral-series hypothesis is needed.

### Examples

For `ℙ²`, middle cohomology is the line `ℚ_ℓ(−1)`, with Frobenius `q` and weight `2`. Its mth external tensor power in `(ℙ²)^m` has Frobenius `q^m` and weight `2m`. The half-unit error becomes `1/(2m)` on one factor and tends to zero; the zero cohomology group contributes no eigenvalues (§§4.1–4.3).

### Dependencies

DWP.0–DWP.3; EtaleCohomologyFoundations §§F.2, `F`.`6`–`F`.`7`; LefschetzPencilsAndVanishingCycles §§3.4–3.5, `4.1`–`4.5`. Its rational/integral-factor consequence is §4.4 here.

## Layer DWP.5: Weil coefficients, local monodromy and analytic bounds

Define Weil coefficients and pointwise mixedness before applying them to curve systems. Develop determinantal weights, generalized majoration, local weight–monodromy, nonarchimedean bounds and specialization. The compact-form and character-decay branch supplies distribution theorems and uses the exact compact-group and reductive comparison interfaces specified below.

<a id="target-5-1"></a>

### 5.1. The Weil group of a finite-field scheme

For connected `X₀/𝔽_q` with geometric point `x`, let `W(X₀,x)=π₁(X₀,x)×_{Gal(𝔽̄_q/𝔽_q)}ℤ`, where `1∈ℤ` maps to geometric Frobenius. Its topology makes the geometric kernel open with its profinite topology and the degree quotient discrete. For geometrically connected `X₀` the sequence `1→π₁(X,x)→W(X₀,x)→ℤ→0` is exact. A closed-point geometric Frobenius has degree `+deg(x)`. This degree is the negative of the arithmetic coordinate in Weil I §6.

Its API includes:
- The topological pullback group with its projection to `π₁` and its geometric-degree homomorphism to `ℤ`.

- The integer degree of a Weil element.

- The degree-zero subgroup is the geometric fundamental group for geometrically connected `X₀`.

- The local geometric Frobenius has degree `deg(x)`.

- If the geometric and arithmetic constant-field
  maps satisfy `geo(z)=arith(z⁻¹)` and arith is injective, a pullback element `(g,e)`
  with arithmetic coordinate a has geometric degree `e` and `a=−e`. The supporting
  integer inversion identity is Mathlib's `Multiplicative.toAdd_inv`.

- For `a ≥ 1`, over `𝔽_(qᵃ)` the Weil group is the subgroup of degrees divisible by `a`, with the new degree divided by `a`; the signature carries `0 < a`.

#### Checks
- For `Spec 𝔽_q`, `W=ℤ` with degree the identity and trivial geometric kernel.

- At `a = 1`, the base-extension subgroup is the graph `{(w, deg w)}`, isomorphic to `W(X₀,x)` by its first projection.

- A pullback element `w=(g,e)`, using the specified geometric/arithmetic quotient maps, has Weil II degree `e` and Weil I arithmetic coordinate `−e`; in particular degree-one geometric Frobenius has coordinates `1` and `−1`.

- For `Spec 𝔽_(q²)` over `𝔽_q`, arithmetic degrees lie in `2ℤ`; degree-one relative Frobenius maps to degree `2`.

*Needs:* [EtaleCohomologyFoundations §§F.0.A1–F.0.A2 and InverseGaloisAndArithmeticFundamentalGroups §§IG.1.2–IG.1.3 (arithmetic exact sequence, covers and specialization)](#input-e27), [MonoidHom.eqLocus](#input-b27).

(Sources: [WII](#ref-wii), §1.1 (1.1.7)–(1.1.13.1), pp. 150–153.)

<a id="target-5-2"></a>

### 5.2. Weil sheaves and étale descent

A constructible Weil sheaf on `X₀/𝔽_q` is a constructible `ℚ̄_ℓ`-sheaf on `X=X₀×𝔽̄_q` together with compatible Weil descent isomorphisms; equivalently an isomorphism `F*ℱ≅ℱ` for the chosen geometric-Frobenius descent action. For connected `X` the profinite-`π₁` Weil-group description applies to the full subcategory whose underlying geometric lisse sheaf admits a global lisse integral lattice over a finite coefficient field; this includes every lisse sheaf when `X` is normal. In this subcategory the description is a continuous finite-model representation of `W(X₀,x)`, and étale descent is equivalent to extension to continuous `π₁(X₀,x)`. General lisse objects retain the geometric-sheaf-and-Frobenius-descent definition; a Frobenius isomorphism alone does not ensure étale descent. On a point a rank-one Weil action with scalar `b` descends étale exactly when `b` is an `ℓ`-adic unit.

Its API includes:
- `WeilSheaf`: A geometric constructible sheaf with Weil descent data.

- `WeilSheaf.frobenius`: The invertible action on every closed-point stalk, up to conjugacy.

- `WeilSheaf.ofEtale`: Restrict an étale sheaf to Weil descent.

- `WeilSheaf.etaleDescent_iff`: For a lisse Weil sheaf whose underlying geometric sheaf admits a global lisse integral lattice over a finite coefficient field, étale descent means extension to a continuous arithmetic fundamental-group representation. General lisse and constructible objects use sheaf descent data.

- `WeilSheaf.pullback`: Pull back descent along an `𝔽_q`-morphism, preserving identity and composition.

#### Checks
- `weilSheaf_nonunit`: On `Spec 𝔽_q` the scalar `ℓ` defines a Weil line which has no étale descent.

- `weilSheaf_constant`: The constant line with Frobenius `1` descends étale.

- `weilSheaf_tate`: For `ℓ≠p` the Tate line has geometric scalar `q⁻¹` and agrees with EtaleCohomologyFoundations §§F.0, `F`.`4`, hence descends étale.

- On the split rational nodal curve `ℙ¹/(0∼∞)/𝔽_q`, the rational line with loop multiplier `ℓ` admits Frobenius descent but no global geometric lisse lattice. The loop multiplies each lattice `ℓᵃ𝒪_E` by `ℓ` and cannot preserve it. This Weil object is outside the profinite-`π₁` subcategory (EtaleCohomologyFoundations §F.4 / rationalAdicRealization).

*Needs:* [5.1](#target-5-1), [EtaleCohomologyFoundations §§F.0–F.4, F.10.1–F.10.5 and InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4 (finite cohomology, base change and geometric trace formulas)](#input-e49), [EtaleCohomologyFoundations §§F.0, F.4 (constructible coefficients and adic realization)](#input-e13), [ArithmeticGaloisRepresentations §§1.1–1.6, 6.1–6.2 (finite coefficient models, lattices and Tate realizations)](#input-e11).

(Sources: [WII](#ref-wii), §1.1 (1.1.6), (1.1.10)–(1.1.14), pp. 150–153.)

<a id="target-5-3"></a>

### 5.3. Punctual purity and finite mixed filtrations

Let `ℓ` be prime and `X` be of finite type over `ℤ[1/ℓ]`; use constructible `ℚ̄_ℓ`-sheaves, or Weil sheaves when `X` is over a finite field. Punctual purity of integer weight `n` requires every geometric-Frobenius eigenvalue at each closed point `x` to be a Weil `N(x)`-number of weight `n`. Fixed-`ι` punctual purity of real weight `β` uses `|ια|=N(x)^(β/2)`. Mixedness, respectively `ι`-mixedness, means existence of a finite filtration by subsheaves with pure, respectively `ι`-pure, successive quotients. Actual weights are the weights of nonzero quotients; the zero sheaf has no actual weights. Bounds `≤b` or `≥b` apply to these actual weights. Weight classes modulo `ℤ` are real weights in `ℝ/ℤ`; the canonical decomposition into those classes belongs to DWP.8.

Its API includes:
- Integer purity at all closed stalks.

- Real purity at all closed stalks for a specified coefficient isomorphism `ι`.

- `IsMixed`: Existence of a finite integer-pure subsheaf filtration.

- `IsIotaMixed`: Existence of a finite real-`ι`-pure subsheaf filtration.

- `punctualWeights`: The finite set of actual weights of nonzero graded pieces.

- The zero sheaf is pure of every weight and has empty actual weight set.

- Subsheaves and quotient sheaves of a pure sheaf are pure of the same weight.

- `mixed_extension`: An extension of mixed sheaves is mixed; actual weights form the union.

- Tensor products add weights; lisse duals negate them.

- Twisting by `r∈ℤ` subtracts `2r`.

- `pure_pullback_finitePushforward`: Pullback and finite direct image preserve purity, with residue-degree powers of Frobenius included.

- `mixed_iff_finite_filtration`: Mixedness is precisely a finite subsheaf filtration with pure quotients, with no strictness or canonical splitting built into the predicate.

#### Checks
- `ℚ̄_ℓ(1)` is pure of weight `−2`.

- The zero sheaf is pure of every weight, mixed, and has empty actual weight set.

- `ℚ̄_ℓ⊕ℚ̄_ℓ(−1)` on `Spec 𝔽_q` is mixed with actual weights `{0,2}`, and is not pure of any weight.

- The rank-two unipotent Jordan Frobenius on a point is pure of weight `0` although arithmetic Frobenius is not semisimple.

- A one-point Weil line with nonzero transcendental scalar `b` and `|ιb|=2^(1/4)` is punctually `ι`-pure of real weight `1/2` and is integer-pure of no weight. Use a finite coefficient model containing `b` and a compatible embedding on its algebraic closure.

- A family of zero stalks is punctually `ι`-pure of every real weight, for every fixed embedding.

- The one-point action `diag(1,2)`, with residue cardinality `2`, is punctually `ι`-pure of no single real weight, for every coefficient embedding.

*Needs:* [5.2](#target-5-2), [0.7](#target-0-7), [0.9](#target-0-9), [0.13](#target-0-13), [EtaleCohomologyFoundations §§F.0, F.4 (constructible coefficients and adic realization)](#input-e13).

(Sources: [WII](#ref-wii), §1.2 (1.2.2)–(1.2.8), pp. 153–155.)

<a id="target-5-4"></a>

### 5.4. Totally real and `ι`-real sheaves

A lisse sheaf is totally real when every closed-point local characteristic polynomial has algebraic totally real coefficients; it is `ι`-real when those coefficients map into `ℝ` under the fixed `ι`. These are coefficient conditions, not assertions that every eigenvalue is real. A punctually pure lisse sheaf of integer weight `n` is a direct summand of the totally real sheaf `ℱ⊕ℱ∨(−n)`; for real `ι`-weight `β` use a rank-one Weil twist of weight `2β` in place of the integer Tate normalization.

Its API includes:
- All local polynomial coefficients are algebraic and totally real.

- All local polynomial coefficients become real under `ι`.

- Total reality implies `ι`-reality for every `ι`.

- The reciprocal-normalized dual direct sum of a punctually pure lisse sheaf is real and contains the original as a direct summand.

#### Checks
- A point module with polynomial `T²−T+2` is totally real, although its roots are nonreal.

- The zero object has local polynomial `1` and is totally real.

- A pure weight-zero line with scalar `(3+4i)/5` has real envelope polynomial `T²−(6/5)T+1`.

- The point line with scalar `√2` has polynomial `T−√2`, whose coefficients are totally real but not all rational.

- The point line with scalar `∛2` is real for the usual complex embedding, but not totally real: `T³−2` has two nonreal conjugates.

- The point line with scalar `i` is not real for the usual embedding.

*Needs:* [5.3](#target-5-3), [0.15](#target-0-15), [0.16](#target-0-16).

(Sources: [WII](#ref-wii), §1.2 (1.2.12)–(1.2.14), pp. 155–156.)

<a id="target-5-5"></a>

### 5.5. Finite geometric monodromy and rank-one normalization

For normal geometrically connected `X₀/𝔽_q`, the image of `π₁(X)` in the abelianization of `W(X₀)` is an extension of a finite prime-to-`p` group by a pro-`p` group. Consequently every rank-one `ℓ`-adic Weil representation (`ℓ≠p`, finite coefficient model) has finite geometric image and is a constant Weil character times a finite-order character; it is punctually `ι`-pure. An irreducible rank-`r` system becomes finite-determinant after a rank-one Weil twist. Choosing a twist of arbitrary real weight uses Weil lines and does not assert that it is a motivic Tate twist.

*Needs:* [5.1](#target-5-1), [5.2](#target-5-2), [0.15](#target-0-15), [ArithmeticGaloisDuality §R02.3.2 (function-field ideles, local units and reciprocity)](#input-e24), [EtaleCohomologyFoundations §§F.0.A1–F.0.A2 and InverseGaloisAndArithmeticFundamentalGroups §§IG.1.2–IG.1.3 (arithmetic exact sequence, covers and specialization)](#input-e27), [LefschetzPencilsAndVanishingCycles §§3.6, 5.1 and §5.15 here (curve reduction and monodromy specialization)](#input-e40), [5.15](#target-5-15) (full prime-to-p abelian specialization and curve surjection).

(Sources: [WII](#ref-wii), §1.3 (1.3.1), (1.3.4), (1.3.6), pp. 156–158; §1.11 (1.11.4), pp. 185–186.)

<a id="target-5-6"></a>

### 5.6. Determinantal weights of irreducible constituents

For a lisse Weil sheaf on normal connected `X₀`, an irreducible constituent `ℱ` of rank `r` has determinantal `ι`-weight `β` when `det ℱ` is punctually `ι`-pure of weight `rβ`. The determinantal-weight multiset of any lisse sheaf lists these `β` with constituent multiplicities. It is independent of a Jordan–Hölder filtration. It is not the multiset of all stalk weights until purity of constituents has been proved.

Its API includes:
- `determinantalWeight`: For an irreducible of rank `r>0`, the determinant weight divided by `r`.

- `determinantalWeights`: The multiset of determinantal weights of irreducible constituents.

- `determinantalWeight_det`: The determinant is pure of weight `r` times the determinantal weight.

- `determinantalWeights_exact`: The multiset for an extension is the sum of those of its subobject and quotient.

- `determinantalWeights_twist`: A rank-one twist of weight `c` adds `c` to every determinantal weight.

- `determinantalWeight_pure`: For an irreducible punctually pure sheaf of weight `β`, its determinantal weight is `β`.

#### Checks
- `detWeight_tate`: The Tate line `ℚ̄_ℓ(r)` has determinantal weight `−2r`.

- `detWeight_zero`: The zero sheaf has empty determinantal-weight multiset.

- `detWeight_rank_divisor`: A rank-two irreducible pure system of weight `1` has determinant weight `2` and determinantal weight `1`, not `2`.

- For an irreducible of determinantal weight `β`, twisting by a rank-one Weil line
  of weight `c` gives determinantal weight `β+c`, since its rank-`r` determinant shifts by `rc`.

- A rank-two irreducible of determinantal weight `1` has multiset `{1}`; a sum of
  two rank-one weight-one systems has `{1,1}`. Equal total rank, determinant
  weight and sole occurring weight do not identify constituent multiplicities.

- On a point, `ℚ̄_ℓ⊕ℚ̄_ℓ(−1)` has determinantal-weight multiset `{0,2}`, not a
  singleton containing its average weight `1` or its determinant weight `2`.

The scalar definition is tested by the Tate, rank-divisor and twist checks;
the multiset definition is tested by the zero, constituent-multiplicity and
two-distinct-weight checks.

*Needs:* [5.5](#target-5-5), [5.3](#target-5-3), [0.13](#target-0-13), [0.14](#target-0-14), [0.12](#target-0-12).

(Sources: [WII](#ref-wii), §1.3 Définition (1.3.5), p. 158; Corollaire (1.3.12) and Proposition (1.3.13), p. 161.)

<a id="target-5-7"></a>

### 5.7. Unipotent radical and central degree in Weil monodromy

**Central-degree comparison** (`centralDegreeComparison`). Let `G` be an
algebraic-by-`ℤ` group over an algebraically closed characteristic-zero field,
with algebraic degree-zero kernel `H` and reductive `H`°. If `G` has a
finite-dimensional representation with finite kernel on `H`, prove that its
conjugation action on the connected center of `H`° has finite image, that `Z(G)`
has finite-index degree image, and that `G/Z(G)` is algebraic of finite type.
Construct the comparison using automorphisms preserving a pinning and the finite outer action
trivial on that connected center. When `H`° is semisimple, the kernel of degree
on `Z(G)` is finite. Apply this to the monodromy group in §5.7.

*Needs:* ReductiveGroups Layers 3, 6–7, 9 (components, quotients, centers,
semisimple groups and pinnings); §5.5 for the monodromy application.
(Source: [WII](#ref-wii), (1.3.7), Lemma (1.3.10) and Corollary (1.3.11),
pp. 158–160.)

**Checks.**

- For `H=1` and `G=ℤ`, central degree is the identity and `G/Z(G)=1`.
- For `G=SL₂×ℤ`, central degree has kernel `μ₂` and full image; its quotient
  by the center is `PGL₂`.
- For `SL₃⋊ℤ` with degree one acting by transpose-inverse, central degrees are
  `2ℤ`. The image need not be all of `ℤ`. For `𝔾_m×ℤ` the kernel is infinite,
  so the finite-kernel conclusion needs the semisimple hypothesis.

**Compact normalizers over local fields** (`compactNormalizer`). For a connected
semisimple group `H` over a finite extension `E/ℚ_ℓ` and a compact
Zariski-dense subgroup `K⊂H(E)`, its normalizer is compact. Construct local matrix
logarithms in a faithful representation and extend them to compact elements by
powers. Construct the invariant lattice in `Lie H` from these logarithms of `K`;
density spans `Lie H`, and the
proper adjoint map with finite kernel transfers compactness of lattice
stabilizers to `H(E)`. Extend the argument to finite component groups when used
in §5.7's étale-descent comparison.

*Needs:* ReductiveGroups Layers 2, 3, 6; ReductiveGroupsPartII §RG2.0.2
(local charts); Mathlib `ℓ`-adic power-series convergence;
ArithmeticGaloisRepresentations §§1.1–1.6
(§1.5 finite coefficient descent; §1.6 realizing the compact-image stable lattices of EtaleCohomologyFoundations §F.4.0).
(Source: [WII](#ref-wii), Lemma (1.3.15) and proof, pp. 161–162.)

**Checks.**

- `SL₂(ℤ_ℓ)` in `SL₂(ℚ_ℓ)` has compact normalizer.
- For `K=1` in `SL₂(ℚ_ℓ)`, the normalizer is the whole noncompact group;
  compactness of `K` alone is insufficient.
- For `H=𝔾_m` and `K=𝒪_E^×`, `K` is compact and Zariski dense but its normalizer
  `E^×` is noncompact; semisimplicity is essential.

For a lisse finite-model Weil system on normal geometrically connected `X₀`, let `G_geom` be the Zariski closure of geometric monodromy and `G` the algebraic-by-discrete extension `G_geom⋊ℤ` induced by a degree-one lift. The radical of `G_geom`° is unipotent. If the system is semisimple as a Weil representation, its geometric restriction is semisimple and `G_geom`° is semisimple. Then degree on `Z(G)` has finite kernel and image of finite index in `ℤ`. For a central `g` of degree `m≠0`, the spectrum on the determinantal-weight-`β` constituent has `|ια|=q^(mβ/2)`. Every irreducible Weil system becomes an étale system after a rank-one Weil twist.

*Needs:* centralDegreeComparison and compactNormalizer above, [5.5](#target-5-5), [5.6](#target-5-6), [ReductiveGroups, Layer 6 (reductive and semisimple groups)](#input-e66), [ArithmeticGaloisRepresentations §§1.1–1.6, 6.1–6.2 (finite coefficient models, lattices and Tate realizations)](#input-e11).

(Sources: [WII](#ref-wii), §1.3 (1.3.7)–(1.3.15), pp. 158–162.)

<a id="target-5-8"></a>

### 5.8. Functoriality of determinantal weights

For a dominant morphism `f:X′₀→X₀` of normal connected finite-type schemes over `𝔽_q`, a lisse Weil sheaf has only determinantal `ι`-weight `β` if and only if its pullback does. Tensor products of sheaves having only determinantal weights `β` and `γ` have only weight `β+γ`. If `n(β)` is the sum of ranks of constituents of weight `β`, the determinantal weights occurring in `∧^aℱ` are exactly `Σ_β a(β)β` with `Σ a(β)=a` and `0≤a(β)≤n(β)`, as a set of occurring weights (not constituent multiplicities).

Use a common finite coefficient model. Exterior degree above total rank has no weights; exterior degree zero has weight `0`.

*Needs:* [5.6](#target-5-6), [5.7](#target-5-7), [0.14](#target-0-14), [0.13](#target-0-13), [EtaleCohomologyFoundations §§F.0.A1–F.0.A2 and InverseGaloisAndArithmeticFundamentalGroups §§IG.1.2–IG.1.3 (arithmetic exact sequence, covers and specialization)](#input-e27).

(Sources: [WII](#ref-wii), §1.3, Corollaire (1.3.12) and Proposition (1.3.13)(i)–(iii), p. 161.)

Prove `dominantMap_finiteIndexMonodromy`: for a dominant finite-type morphism
`f:X′→X` of normal connected finite-type schemes over a field, the image of
`π₁(X′)→π₁(X)` is an open subgroup. Use normalization in the finite algebraic
part of the extension of function fields, followed by the connected-finite-cover
criterion; pure inseparability does not change the étale category. For a dense
open immersion the image is the whole group. Apply the statement componentwise
after compatible geometric field extensions for §5.8 and §10.6.
*Needs:* SchemeAndStackFoundations §§0.9, 0.11, 0.20–0.21 (finite-type geometry and
normalization); EtaleCohomologyFoundations §F.0 (finite étale Galois category);
InverseGaloisAndArithmeticFundamentalGroups §IG.5.7 (finite-cover criterion).
(Source: [WII](#ref-wii), proof of (1.3.13), p. 161.)

**Fixed-`ι` even-tensor positivity** (`iotaReal_evenTensor_nonneg`). For a lisse
`ι`-real Weil sheaf with a finite coefficient model over a finite-field scheme,
applying `ι` to each local Euler factor of every even tensor power gives a series
in `ℝ[[t]]` with constant term `1` and nonnegative coefficients. Indeed the traces
of all local Frobenius powers are real, their even powers are nonnegative,
and the formal exponential of the resulting logarithmic series has
nonnegative real coefficients. Prove nonnegativity of the formal exponential
coefficients over an ordered field, including `ℚ` and `ℝ`. Use §§2.7–2.8 on
these real series; the rational refinement of §2.6 retains §2.9(iii).

*Needs:* §0.10 (traces), §0.13 (tensor spectra), §5.4 (ι-reality),
the ordered-field exponential nonnegativity statement specified here;
§§2.7–2.8 (real-series comparison).
(Source: [WII](#ref-wii), (1.5.2)(a), p. 164.)

**Checks.**

- A constant Weil line with transcendental scalar `b` and `ι(b)>0` has even-tensor
  factors `(1−ι(b)^(2k deg x)t^(deg x))⁻¹`. For `k>0` these have nonnegative real
  coefficients that are not rational.
- For a point system with `eigenvalues i` and `−i`, the tensor square has Euler
  factor `(1−t²)⁻²`, with nonnegative coefficients although some tensor-square
  eigenvalues are `−1`.
- A single point line with scalar `i` is not `ι`-real; its tensor-square factor
  `(1+t)⁻¹` has coefficient `−1` at `t`. The reality hypothesis is essential.

<a id="target-5-9"></a>

### 5.9. Deligne’s generalized majoration theorem

For a normal connected `X₀` of finite type over `𝔽_q`, the irreducible constituents of a lisse `ι`-real sheaf are punctually `ι`-pure. More precisely, on a smooth curve let `r` be its maximal determinantal weight; every stalk eigenvalue has `ι`-weight `≤r`, and each irreducible constituent of determinantal weight `β` is punctually pure of weight `β`. No open symplectic-image or rational-coefficient hypothesis is imposed.

*Needs:* [5.4](#target-5-4), [5.6](#target-5-6), [5.7](#target-5-7), iotaReal_evenTensor_nonneg above, [2.7](#target-2-7), [2.8](#target-2-8), [0.13](#target-0-13), [LefschetzPencilsAndVanishingCycles §§3.6, 5.1 and §5.15 here (curve reduction and monodromy specialization)](#input-e40), [0.14](#target-0-14), [5.8](#target-5-8), [EtaleCohomologyFoundations §§F.3, F.5–F.6 (extreme-degree curve cohomology)](#input-e19), [EtaleCohomologyFoundations §§F.0–F.4, F.10.1–F.10.5 and InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4 (finite cohomology, base change and geometric trace formulas)](#input-e49).

(Sources: [WII](#ref-wii), §1.5 Théorème (1.5.1), Lemme (1.5.2), proof (1.5.3), pp. 164–165.)

<a id="target-5-10"></a>

### 5.10. Initial cohomological and boundary weight bounds

For `j:U₀→C₀` with `C₀` smooth projective over `𝔽_q` and `ℱ` lisse punctually `ι`-pure of real weight `β`, boundary eigenvalues of `j_*ℱ` have `ι`-weight `≤β`, and those on `H¹_c(U,ℱ)` have weight `≤β+2`. These initial non-strict bounds precede the strict analytic bound and the sharp curve theorem.

*Needs:* [5.3](#target-5-3), [5.4](#target-5-4), [5.9](#target-5-9), [2.7](#target-2-7), [EtaleCohomologyFoundations §§F.0–F.4, F.10.1–F.10.5 and InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4 (finite cohomology, base change and geometric trace formulas)](#input-e49), [EtaleCohomologyFoundations §§F.3, F.5–F.6 (extreme-degree curve cohomology)](#input-e19).

(Sources: [WII](#ref-wii), §1.8 Lemme (1.8.1) and Remarque (1.8.2), p. 175.)

<a id="target-5-11"></a>

### 5.11. The local weight–monodromy theorem on a curve

Let `U₀` be a smooth curve over `𝔽_q` and `ℱ` lisse punctually `ι`-pure of real weight `β`. At a missing point of its smooth completion take the local Weil representation `V` and the monodromy filtration `M` centered at zero after the quasi-unipotent inertia reduction. Then `GrᵢᴹV` is pure of weight `β+i` relative to the residue cardinality. With `N:V→V(−1)`, geometric `F` satisfies FNF`⁻¹=q_x⁻¹N` in untwisted coordinates. The inertia invariants have only weights `≤β`. This is an equal-characteristic curve theorem.

*Needs:* [5.10](#target-5-10), [0.15](#target-0-15), [LefschetzPencilsAndVanishingCycles §§1.1–1.6 (inertia, monodromy and relative filtrations)](#input-e31), [EtaleCohomologyFoundations §F.3a and LefschetzPencilsAndVanishingCycles §§0.2–0.8 (boundary traits and nearby cycles)](#input-e28).

(Sources: [WII](#ref-wii), §1.7 (1.7.1)–(1.7.12), pp. 170–174; §1.8 Théorème (1.8.4), pp. 175–176.)

<a id="target-5-12"></a>

### 5.12. Boundary mixedness and extension of purity

For an `ι`-mixed local system on a smooth curve, the relative monodromy filtration exists and agrees with the local weight filtration on pure graded pieces. Along a smooth divisor, the relative construction is lisse and compatible with transverse curves and fibres under the tame hypotheses of (1.8.6)–(1.8.7). For an open immersion of finite-type `𝔽_q` schemes, underived `j_*` takes `ι`-mixed sheaves with weights `≤β` to `ι`-mixed sheaves with weights `≤β`. A lisse sheaf pure on a dense open is pure everywhere; on normal `X` a lisse `ι`-mixed sheaf has a finite filtration by lisse pure sheaves. On connected `X` an `ι`-mixed lisse sheaf pure of weight `β` at one closed point is pure of weight `β` everywhere.

*Needs:* [5.11](#target-5-11), [5.3](#target-5-3), [LefschetzPencilsAndVanishingCycles §§1.1–1.6 (inertia, monodromy and relative filtrations)](#input-e31), [EtaleCohomologyFoundations §§F.0–F.4 (constructible derived coefficients, base change and finiteness)](#input-e12), [EtaleCohomologyFoundations §§F.0–F.4, F.10.1–F.10.5 and InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4 (finite cohomology, base change and geometric trace formulas)](#input-e49), [EtaleCohomologyFoundations §§F.0.3, F.10.1–F.10.2b (Tate twists and Frobenius)](#input-e14).

(Sources: [WII](#ref-wii), §1.8 Corollaires (1.8.5)–(1.8.12), pp. 176–179.)

<a id="target-5-13"></a>

### 5.13. Newton polygons of Frobenius stalks

Fix a rational-valued additive nonarchimedean valuation `v` on the coefficient algebraic closure normalized by `v(p)=1`. For a rank-`r` closed stalk at `x` with geometric Frobenius `eigenvalues α₁`,`…`,`αᵣ`, let `s₁≤…≤sᵣ` be `v(αᵢ)/v(N(x))`, counted with multiplicity. Its Newton polygon has vertices `(k,Σ_{i≤k}sᵢ)`, `k=0`,`…`,`r`, and linear interpolation. Equivalently the kth ordinate is the minimum normalized valuation of products of `k` distinct eigenvalue positions, the spectrum of the kth exterior power. This is the stalk specialization of the general Newton-polygon convention, not a new `p`-adic cohomology theory.

Its API includes:
- The finite vertex presentation normalized by `v(N(x))`.

- `stalkNewtonPolygon_toPolygon`: Put the sorted normalized slopes into
  NewtonPolygons §0.6's `ConvexPolygon.FiniteSlopeData ℚ`, with start and initial
  height zero and length `r`. Its height at `k≤r` is the kth ordinate of
  `stalkNewtonPolygon`; it is `∞` for `k>r`. Embed the slope data into `ℝ` and
  use the supplied `toPolygon` as the common public polygon carrier. Prove
  equality of these heights and compatibility with §0.7's polygon order and
  canonical interpolation. The finite list presents the heights of this common
  polygon carrier.

- The origin is `(0,0)`; rank zero has the single origin.

- The endpoint is `(r,v(det F_x)/v(N(x)))`.

- The kth ordinate is the minimum normalized valuation of kth exterior eigenvalues.

- Finite residue-field extension leaves the polygon unchanged.

- Twisting by a adds `−a` to every normalized slope.

#### Checks
- The point module `diag(1,q)` has vertices `(0,0)`,`(1,0)`,`(2,1)`.

- `newton_empty`: Rank zero has only `(0,0)`.

- A rank-zero stalk gives a singleton finite domain `{0}`, with height zero at
  zero and `∞` elsewhere; it is distinct from the all-`∞` empty polygon. Repeated
  slopes give collinear vertices representing the same height function after compression.

- Replacing `diag(1,q)` by `diag(1,q²)` over `𝔽_(q²)` retains slopes `0`,`1`, not `0`,`2`.

*Needs:* [0.13](#target-0-13), [AddValuation](#input-b25), [Multiset.sort](#input-b26), [0.14](#target-0-14), [NewtonPolygons §§0.6–0.7 (slope data and the common polygon carrier)](#input-newton).

(Sources: [WII](#ref-wii), §1.10 (1.10.6), p. 183.)

<a id="target-5-14"></a>

### 5.14. Nonarchimedean bounds at the boundary

Fix an embedding `ι` of the coefficient field into an algebraically closed nonarchimedean valued field of characteristic zero. For a lisse Weil sheaf on a smooth curve, a normalized nonarchimedean bound `b^(deg x)≤|ια|≤c^(deg x)` at closed points extends to every eigenvalue of its local boundary Weil representations. Generic `ℓ′`-adic units remain units at the boundary. For valuations with `v(p)>0`, if almost all stalk Newton polygons agree, the boundary polygon lies on or above that polygon with the same endpoint. If local normalized slopes lie in `[β,γ]`, `N^(⌊γ−β⌋+1)=0`.

*Needs:* [5.13](#target-5-13), [5.11](#target-5-11), [5.5](#target-5-5), [0.13](#target-0-13), [0.14](#target-0-14).

(Sources: [WII](#ref-wii), §1.10 (1.10.1)–(1.10.9), pp. 182–184.)

<a id="target-5-15"></a>

### 5.15. Specialization of geometric monodromy

For an integral finite-type arithmetic base and a smooth geometrically connected
relative curve with section, consume
`LefschetzPencil.arithmeticGlobalMonodromy` from
LefschetzPencilsAndVanishingCycles §3.6. It identifies the full compact geometric
images of a selected finite collection of integral systems over one base open,
uniformly over their congruence powers, preserving pairings, twists and boundary
inertia including its finite wild part.

**General-base monodromy specialization** (`geometricMonodromySpecialization`).
Let `f:X→S` be smooth of finite presentation with geometrically connected curve
fibres, `S` reduced irreducible with generic point `η` and `ℓ` invertible, and
`g:S→X` a section. For a selected lisse finite free `O_E`-adic system `ℱ`,
`E/ℚ_ℓ` finite, after shrinking `S` there are compatible finite locally constant
subgroup sheaves of `Aut(g*ℱ/𝔪_Eⁿ)` whose geometric stalks are the geometric
fibre images, simultaneously for all `n`. Their inverse limit is the full compact
image. Retain specified morphisms, pairings and twists. After shrinking so that
the initial residual trivializing cover has a smooth proper compactification
with finite étale boundary, the congruence tower and its boundary stabilizers
specialize, including finite wild inertia in the initial cover. If these
compactifications are already supplied, no additional shrinking for this step
is needed. A compactification of `X` alone does not assert constancy of arbitrary
wild residual covers.

Prove the finite-type-family extension (1.11.5) under the same base, coefficient
and section hypotheses for `f` of finite type, with the images of the geometric
fibre component containing the section. Use localization, Mayer–Vietoris,
flat normal-fibre reduction and a relative Bertini curve. Compare the resulting
image sheaves, their inverse limits and boundary stabilizers with §3.6 on its
arithmetic smooth-curve domain: both are the same subgroups of the selected
coefficient automorphism groups, up to the specified path conjugations.

(Source: [WII](#ref-wii), (1.11.1)–(1.11.3), (1.11.5), pp. 184–186.)

**Checks.**

- A constant integral system has identity geometric image at every level and in
  the inverse limit, on both sides of the arithmetic comparison.
- Over an arithmetic base in characteristic two, the cover `y²−y=1/t` of
  `𝔾_m`, realized at an odd coefficient prime, has image `ℤ/2` and wild inertia
  at zero. Its finite residual cover is retained by §3.6 and by the extension.
- The product `𝔾_m×ℙ¹→S` with a section and a system pulled back from `𝔾_m`
  has the same image as its relative curve `𝔾_m×{a}`; the finite-type-family
  reduction retains the full congruence tower, not just one finite quotient.

*Needs:* [ArithmeticGaloisRepresentations §§1.1–1.6, 6.1–6.2 (finite coefficient models, lattices and Tate realizations)](#input-e11), [EtaleCohomologyFoundations §§F.0.A1–F.0.A2 and InverseGaloisAndArithmeticFundamentalGroups §§IG.1.2–IG.1.3 (arithmetic exact sequence, covers and specialization)](#input-e27), [EtaleCohomologyFoundations §§F.0–F.4, F.10.1–F.10.5 and InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4 (finite cohomology, base change and geometric trace formulas)](#input-e49), [LefschetzPencilsAndVanishingCycles §§3.6, 5.1 and §5.15 here (curve reduction and monodromy specialization)](#input-e40).

(Sources: [WII](#ref-wii), §1.11 (1.11.1)–(1.11.5), pp. 184–186.)

Prove `curveReduction_preservesMonodromy` for a specified finite-dimensional
continuous geometric `ℓ`-adic representation on a normal geometrically connected
finite-type `X₀/𝔽_q`, with a finite `E/ℚ_ℓ` model and stable lattice. After finite
constant extension choose a smooth geometrically connected curve mapping into a
dense smooth quasiprojective open of `X₀` whose geometric representation image is
the full image on `X`; include the finite initial quotient and its pro-`ℓ` Frattini
quotient in the construction. Apply Bertini to that particular finite cover,
then use the Frattini criterion to recover the full compact image. Spread the
curve and the specified finite model in a smooth relative curve family, and use
the specialization theorem of §5.15 above to retain this image on a dense base
open. The assertion concerns the chosen representation; it does not claim a
single curve surjects onto every geometric cover at once. Section `5.5`'s
assertion about the entire geometric abelianization uses the separate
prime-to-`p` construction below. *Needs:* SchemeAndStackFoundations
§§0.9, `0.21`; LefschetzPencilsAndVanishingCycles §5.1; ArithmeticGaloisRepresentations
§§1.1–1.6 (finite coefficient descent; compact-image stable lattices from EtaleCohomologyFoundations §F.4.0); ProfiniteProPGroups, Layer `3` (Frattini detection of closed images);
§5.15's specialization statement. (Source: [WII](#ref-wii),
§1.11 (1.11.4)–(1.11.5), pp. `185`–`186`.)

**Full prime-to-`p` abelian curve reduction** (`primeToPAbelianCurveReduction`). For normal geometrically connected
finite-type `X₀/𝔽_q` of characteristic `p`, construct, after a finite constant
extension of degree `a`, a smooth geometrically connected curve `C₀` mapping to `X₀`
and a surjection `H₁(C,ℤ^(p′))→H₁(X,ℤ^(p′))`, compatible with the new arithmetic
Frobenius, which acts on `X` as the a-th power of the original Frobenius.
Here `H₁` means the maximal prime-to-`p` quotient of the topological abelianization
of the geometric fundamental group; `ℤ^(p′)=∏_(r≠p)ℤ_r`.

Build specialization of this full quotient, simultaneously at every prime `r≠p`,
for a smooth proper relative curve with finite étale boundary over a connected
base in characteristic `p`. Use tame specialization of all prime-to-`p` abelian
covers, including the boundary inertia, rather than one chosen lattice.
A generic Bertini curve in a dense smooth quasiprojective open surjects on the
geometric fundamental group, hence on this quotient; specialize to a
sufficiently general finite-field section without changing its prime-to-`p`
abelian quotient. Dimension zero uses any smooth geometrically connected curve
mapping to the point. Combine the resulting surjection on Frobenius coinvariants
with the curve idèle-class theorem to prove §5.5's first assertion. The remaining
`p`-primary part is pro-`p`.

*Needs:* SchemeAndStackFoundations §§0.9, 0.21; LefschetzPencilsAndVanishingCycles
§5.1 (generic Bertini); EtaleCohomologyFoundations §§F.0.A1–F.0.A2 and InverseGaloisAndArithmeticFundamentalGroups §§IG.1.2–IG.1.3
(tame specialization); ProfiniteProPGroups Layers `0`–`3` (closed quotients and
prime decompositions); ArithmeticGaloisDuality §R02.3.2 (curve coinvariants).
(Source: [WII](#ref-wii), (1.11.4), pp. 185–186, using SGA 1 XIII §§4–5.)

**Checks.**

- For `X₀=Spec 𝔽_q` the geometric quotient is zero, and any such curve induces
  the required surjection to zero.
- For `𝔾_m²` the curve `t↦(t,1)` preserves a representation through the first
  coordinate but misses the second `ℤ^(p′)(1)` summand of `H₁`. It fails this target.
- The curve `ℙ¹−{0,1,∞}→𝔾_m²`, `t↦(t,t−1)`, maps its two boundary generators
  onto both summands of `H₁`. A degree-a constant extension replaces Frobenius
  by its a-th power on both sides of this surjection.

<a id="target-5-16"></a>

### 5.16. The abstract Hadamard–de la Vallée-Poussin theorem

Let `G` be a locally compact extension of `Γ=ℤ` or `ℝ` by a compact group `G⁰`; in the `ℤ` case the center maps onto a finite-index subgroup of `Γ`, and in the `ℝ` case the extension is a product. Fix the norm character `ω₁`, a countable family of conjugacy classes with norms `N_v>1`, and absolute convergence of the trivial Euler product for real part `>1`. Regard `L` as a function on the representation Riemann surfaces `r=ρ⊗ω_s`. If it continues meromorphically to real part `≥1` and is holomorphic there except a simple pole at `r=ω₁`, then it has no zeros on real part `1` except possibly at one representation `r=ω₁ε` with `ε` a one-dimensional order-two character. The curve application excludes this exception by the connected double-cover zeta comparison. The norm-character translation is part of the statement, so imaginary twists are not incorrectly assigned separate pole conditions.

*Needs:* [1.6](#target-1-6), [ArithmeticDirichletSeries, Layer 8 (Landau positivity)](#input-e59), [RepresentationTheory/CompactGroups, Layer 5 (Peter–Weyl)](#input-e67), [RepresentationTheory/CompactGroups, Layers 0, 6 and the SU(2) engine case (Haar probability, characters and SU(2))](#input-e68), [ArithmeticGaloisRepresentations §5.13 (finite function-field Chebotarev), with the degree refinements of §3.7 here](#input-e25).

(Sources: [WII](#ref-wii), §2.1 (2.1.1)–(2.1.9), pp. 187–191; §2.2 Corollaire (2.2.9), pp. 195–196.)

<a id="target-5-17"></a>

### 5.17. The compact form of Weil monodromy

**Complex compact-form comparison** (`complexCompactFormComparison`). For
`G_ℂ` algebraic-by-`ℤ` with semisimple identity component of its algebraic kernel,
import connected reductive compact real forms, their complexification and the
continuous/holomorphic representation equivalence from RepresentationTheory/LieGroups
Layer `7`. Compare that complexification with the identity component of the
algebraic quotient `G_ℂ/Z(G_ℂ)`. Prove algebraicity of the relevant holomorphic
semisimple-group representations and extend the compact-form and representation
comparisons across finite components, cyclic central quotients and the Weil-degree
action. In the finite-type quotient `G_ℂ/Z(G_ℂ)`, every compact subgroup is
contained in a maximal compact and maximal compacts are conjugate.
The inverse image `G_R` of a chosen maximal compact has compact degree-zero kernel
and discrete degree. Restriction identifies algebraic finite-dimensional
representations of `G_ℂ` with continuous finite-dimensional complex representations
of `G_R`, respecting tensor products and duals. Establish the comparison first on
compact quotients by a cyclic central subgroup of nonzero degree, then retain
the arbitrary central degree action. Characters on these quotients show that
elements of `G_R` conjugate in `G_ℂ` are already conjugate in `G_R`.

*Needs:* §5.7's centralDegreeComparison; ReductiveGroups Layers 3, 6–7;
RepresentationTheory/LieGroups Layer `7` / Complexification;
RepresentationTheory/CompactGroups Layers `5`–`6` and the `SU(2)` engine case (Peter–Weyl and character separation).
(Source: [WII](#ref-wii), (2.2.1)–(2.2.3) and proof of (2.2.6), pp. 192–194.)

**Checks.**

- For `SL₂(ℂ)×ℤ`, the quotient compact is PSU`(2)` and its inverse image is
  `SU(2)×ℤ`; restriction retains the `μ₂` central kernel.
- For `G_ℂ=ℤ` the compact quotient is trivial and `G_R=ℤ`. A degree-one
  scalar of modulus different from `1` remains permitted in a continuous representation.
- The unipotent Jordan matrix `[[1,1],[0,1]]` cannot lie in a compact subgroup
  of `GL₂(ℂ)`. For `G_ℂ=G_R=ℤ` acting by this matrix in degree one, every
  degree lies in `G_R`, whose quotient by its centre is trivial. Containment in
  this Weil form therefore makes no assertion of matrix compactness or unitarity.

Let `X₀` be a normal geometrically connected scheme over `𝔽_q` and `G` an algebraic-by-`ℤ` group satisfying Weil II (2.2.4): (a) its algebraic degree-zero kernel `G⁰` is an extension of a finite group by a semisimple group; (b) a finite coefficient field `E/ℚ_ℓ` models `G⁰` and the geometric Weil-group homomorphism is continuous and Zariski dense; (c) an algebraic representation gives an `ι`-mixed Weil sheaf and its restriction to `G⁰` has finite kernel. Fix `ι`. Write `Z_c` for the center and choose a maximal compact subgroup `U` of the complex algebraic quotient `G/Z_c`. Define `G_R` as its inverse image in `G_ℂ`, with discrete degree; its degree-zero kernel is compact. Every local `ιF_x` has semisimple part conjugate to an element of `G_R`, uniquely up to `G_R` conjugacy. Restriction gives an equivalence between algebraic finite-dimensional representations of `G` and continuous finite-dimensional complex representations of `G_R`. For an irreducible representation `r`, use the source’s convention `ω₁(g)=q^(−deg g)` and `|r(z)|=ω₁(z)^Re(r)` for positive-degree central `z`. Its associated sheaf is `ι`-pure of weight `−2Re(r)`, correcting the printed sign in (2.2.8)`(i)` and (3.5.1). Thus the scalar `q^(τ deg)` has `Re(r)=−τ` and weight `2τ`.

Use the group-relative Jordan decomposition of Weil II (2.2.3): an element is
semisimple when its image in `G_ℂ/Z_c` is semisimple, and is unipotent when it
lies in the algebraic degree-zero kernel and is unipotent there. The commuting
decomposition `g=g_s g_u` is unique and `deg g_s=deg g`, since `deg g_u=0`.
An algebraic representation of this algebraic-by-`ℤ` group need not take this
decomposition to the usual matrix Jordan decomposition: its central degree
action may have Jordan blocks.

Its API includes:
- `compactWeilForm`: The inverse image of the chosen maximal compact subgroup of the quotient by the central scalars.

- `compactWeilForm.geometricKernel`: The compact degree-zero subgroup and its normalized Haar probability.

- `compactWeilForm.degree`: The geometric-degree map to `ℤ` with central weight action retained.

- `compactWeilForm.frobeniusClass`: The `G_R`-conjugacy class of the group-relative
  semisimple Frobenius part in its original degree fibre.

- `compactWeilForm.conjugacy_iff`: Two elements of `G_R` conjugate in `G_ℂ` are conjugate in `G_R`.

- `compactWeilForm.representationEquivalence`: Algebraic representations of `G` correspond to continuous finite-dimensional representations of `G_R`, respecting tensor and dual operations.

- `compactWeilForm.normExponent_weight`: With `ω₁=q^(−deg)` as in (2.1.1), an irreducible norm exponent `Re(r)` gives sheaf weight `−2Re(r)`. In particular `ω₁` is the Tate line of weight `−2`.

#### Checks
- `compact_constant_weight`: For a constant pure line of weight `β`, degree `n` acts by `q^(nβ/2)` times a unit complex scalar; the degree-zero kernel is trivial.

- `compact_elliptic`: For full `SL₂` geometric monodromy of `H¹` of a nonisotrivial elliptic family, `G_R` is `SU(2)×ℤ` and `(g,n)` acts by `q^(n/2)g`.

- `compact_jordan_part`: For the constant rank-two weight-zero system with
  degree-one matrix `J=[[1,1],[0,1]]`, geometric monodromy is trivial and
  `G_ℂ=G_R=ℤ`. Degree-`e` Frobenius has matrix `J^e` with matrix semisimple part
  `I`, but its Weil-form class is the degree-`e` element, or `(1,e)` in split
  notation. Its group-relative unipotent part is the degree-zero identity.

- `compact_normCharacter_sign`: The norm character `ω₁=q^(−deg)` has `Re(ω₁)=1` but the associated Tate line has weight `−2`, excluding the printed `+2Re` formula.

*Needs:* complexCompactFormComparison above, [5.7](#target-5-7) (central-degree comparison), [5.9](#target-5-9), [5.3](#target-5-3), [RepresentationTheory/CompactGroups, Layers 0, 6 and the SU(2) engine case (Haar probability, characters and SU(2))](#input-e68), [ReductiveGroups, Layer 6 (reductive and semisimple groups)](#input-e66).

(Sources: [WII](#ref-wii), §2.2 (2.2.1)–(2.2.8), pp. 192–195; corrected sign in (2.2.8)(i), p. 195.)

<a id="target-5-18"></a>

### 5.18. The strict initial `H¹` bound

For a smooth curve `U₀/𝔽_q` and a lisse sheaf punctually `ι`-pure of real weight `β`, every eigenvalue on `H¹_c(U,ℱ)` has `ι`-weight strictly less than `β+2`. This bound does not assert `β+1`; it is the analytic input to the square-improvement argument.

*Needs:* [5.10](#target-5-10), [5.16](#target-5-16), [5.17](#target-5-17), [1.7](#target-1-7), [EtaleCohomologyFoundations §§F.0–F.4, F.10.1–F.10.5 and InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4 (finite cohomology, base change and geometric trace formulas)](#input-e49), [EtaleCohomologyFoundations §§F.3, F.5–F.6 (extreme-degree curve cohomology)](#input-e19).

(Sources: [WII](#ref-wii), §2.2 Corollaire (2.2.9), pp. 195–196; Corollaire (2.2.10), p. 196.)

<a id="target-5-19"></a>

### 5.19. Character decay and degree-fibre equidistribution

In the abstract compact-by-`ℤ` setting, add hypotheses `(C)` of (2.1.10): all irreducible Euler products are nonvanishing and holomorphic on `Re(s)≥1` except the simple trivial norm-character pole; and `(D)`: norms are powers of `q`. Fix a positive-degree central element `z` of degree `d`. The translated, normalized prime-power Dirac measures on degree `nd+i` conjugacy fibres converge weakly to the pushforward of normalized Haar on the corresponding degree-`i` fibre. The measures count powers with their degree weights; replacing them with rational-point Frobenius classes requires the actual identity (3.5.2.1).

*Needs:* [5.16](#target-5-16), [RepresentationTheory/CompactGroups, Layers 0, 6 and the SU(2) engine case (Haar probability, characters and SU(2))](#input-e68).

(Sources: [WII](#ref-wii), §2.1 (2.1.10)–(2.1.13), pp. 191–192.)

### Examples

At `q=2`, `diag(1,2)` has Newton vertices `(0,0)`,`(1,0)`,`(2,1)`; passing to `q=4` and `diag(1,4)` gives the same vertices. A weight-zero Jordan Frobenius on a point is pure and geometrically semisimple, with semisimple compact class `1`; its unipotent part is retained by the representation. The norm character `q^(−deg)` has weight `−2` (§§5.3, `5.13`, `5.17`).

### Dependencies

DWP.0–DWP.4, with §§5.1–5.3 preceding DWP.2 and the geometric part of §5.15 preceding §§5.5, `5.9`; EtaleCohomologyFoundations §§F.0–F.7, `F`.`3a`, F.10.1–F.10.5; LefschetzPencilsAndVanishingCycles §§0.2–0.8, `1.1`–`1.6`, `5.1`; InverseGaloisAndArithmeticFundamentalGroups §IG.0.T3 (rational constructible trace formula for all powers); EtaleCohomologyFoundations §§F.0.A1–F.0.A2; InverseGaloisAndArithmeticFundamentalGroups §§IG.0.3, IG.1.2–IG.1.3; ArithmeticGaloisDuality §R02.3.2; ArithmeticGaloisRepresentations §§1.1–1.6, `5.13`; ReductiveGroups Layers `2`–`3`, `6`–`7`, `9`; ReductiveGroupsPartII §RG2.0.2; RepresentationTheory/CompactGroups Layers `0`, `5`–`6` and the `SU(2)` engine case; RepresentationTheory/LieGroups Layer `7`; ArithmeticDirichletSeries Layer `8`.

## Layer DWP.6: Sharp curve purity by square improvement

The external square on `C × C`, with coefficient-specific vanishing cycles and a pencil, improves a coarse error `δ` to `δ/2`. Iterate, then use curve duality. Finite-cover reduction and trace splitting preserve the original coefficient object; the proof must not replace it by an unrelated unipotent system.

<a id="target-6-1"></a>

### 6.1. Vanishing cycles with unipotent boundary coefficients

Let `S₀` be a smooth projective surface, `D₀` a strict normal-crossings divisor, `V₀=S₀−D₀`, and `ℱ₀` a lisse sheaf on `V₀` with unipotent local monodromy along `D₀`. Choose a pencil satisfying Weil II (3.1.1)`(A)`–`(D)`, with each exceptional fibre having just one of the three indicated singularities. For `j_!ℱ` on the blown-up pencil, `Φ^a` vanishes for a`≠1`. At an ordinary node outside `D`, `Φ¹=ℱ_x(−1)⊗ε(B)`, where `ε(B)` is the sign line on the two branches. At a tangency with `D`, or a transverse intersection of two branches of `D`, a locally constant graded boundary filtration gives `Gr Φ¹=Gr ℱ_x⊗ε(B)`, with no Tate twist in these two cases.

*Needs:* [LefschetzPencilsAndVanishingCycles §§2.4–2.8 (quadratic singularities and branch orientation)](#input-e32), [LefschetzPencilsAndVanishingCycles §§3.1–3.5 (Lefschetz pencils)](#input-e33), [LefschetzPencilsAndVanishingCycles §§4.1–4.5 (global vanishing cycles)](#input-e36), [EtaleCohomologyFoundations §F.7 (blow-ups and weak Lefschetz)](#input-e23), [5.11](#target-5-11).

(Sources: [WII](#ref-wii), §3.1 (3.1.1)–(3.1.5), pp. 197–200.)

Construct `boundaryAdaptedPencil` for the smooth projective surface `S₀` and strict
normal-crossings divisor `D₀` of §6.1: after a finite constant-field extension and
a sufficiently high Veronese embedding, choose an axis meeting the smooth locus
transversely and avoiding the crossings, with each exceptional fibre having
exactly one of the ordinary node, simple boundary tangency, or transverse
boundary-crossing cases of Weil II (3.1.1)`(A)`–`(D)`. The construction retains the
branch orientation and the characteristic-two local models, rather than
requiring odd characteristic. Its intended carrier is the supplied pencil
scheme, together with its divisor-incidence conditions and finite exceptional
set. Its API gives the open locus of valid axes, finite-field descent, blow-up
identification, smooth-parameter open, exceptional-type classification and
compatibility with finite constant extension.
*Needs:* LefschetzPencilsAndVanishingCycles §§2.4–2.8, 3.1–3.5; the incidence
geometry and blow-up API of its §3.3. (Source: [WII](#ref-wii),
§3.1 (3.1.1)–(3.1.2), pp. `197`–`198`.)

**Checks.**

- An ordinary node outside `D` contributes `ℱ_x(−1)⊗ε(B)`, while a boundary tangency
  contributes `Gr ℱ_x⊗ε(B)`; the different Tate twist detects the exceptional type.
- At a crossing of two boundary branches the orientation changes sign when the
  branches are interchanged; omitting `ε(B)` fails this comparison.
- For `D` empty the two boundary cases are absent and the valid-axis construction
  is the ordinary surface-pencil construction; a pencil through a boundary
  crossing does not satisfy the axis-avoidance condition.

<a id="target-6-2"></a>

### 6.2. Reality of curve cohomological factors

If `U₀` is a smooth finite-field curve and `ℱ₀` is lisse, punctually `ι`-pure of real weight `β` and `ι`-real, then each polynomial `ι det(1−tF,Hⁱ_c(U,ℱ))` has real coefficients. Geometric connectedness is unnecessary after component and finite-extension descent.

*Needs:* [5.18](#target-5-18), [5.4](#target-5-4), [1.7](#target-1-7), [EtaleCohomologyFoundations §§F.0–F.4, F.10.1–F.10.5 and InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4 (finite cohomology, base change and geometric trace formulas)](#input-e49), [EtaleCohomologyFoundations §§F.3, F.5–F.6 (extreme-degree curve cohomology)](#input-e19), [EtaleCohomologyFoundations §§F.4–F.6 (rational adic Poincaré duality)](#input-e18).

(Sources: [WII](#ref-wii), §3.2 Proposition (3.2.1), Remarque (3.2.2), p. 200.)

<a id="target-6-3"></a>

### 6.3. Square improvement on the product of a curve

For a smooth finite-field curve `U₀` and lisse punctually `ι`-pure weight-zero `ℱ₀`, every eigenvalue `α` of `H¹_c(U,ℱ)` satisfies `w_ι(α)≤1+2^(−k)`, for every integer `k≥0`. The step `k→k+1` is proved on a pencil in the compactified surface `U₀×U₀` and uses the three coefficient-specific vanishing-cycle cases; it is not a direct application of the general direct-image theorem.

*Needs:* [6.1](#target-6-1), [6.2](#target-6-2), [5.9](#target-5-9), [5.11](#target-5-11), [5.18](#target-5-18), [0.13](#target-0-13), [0.12](#target-0-12), [LefschetzPencilsAndVanishingCycles §§3.1–3.5 (Lefschetz pencils)](#input-e33), [EtaleCohomologyFoundations §§F.0–F.4, F.10.1–F.10.5 and InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4 (finite cohomology, base change and geometric trace formulas)](#input-e49), [EtaleCohomologyFoundations §F.7 (blow-ups and weak Lefschetz)](#input-e23), [EtaleCohomologyFoundations §§F.3, F.5–F.6 (extreme-degree curve cohomology)](#input-e19), [EtaleCohomologyFoundations §§F.5–F.6, 0.11 (curve duality)](#input-e17).

(Sources: [WII](#ref-wii), §3.2 (3.2.4)–(3.2.14), pp. 201–204.)

<a id="target-6-4"></a>

### 6.4. Purity of parabolic curve cohomology

Let `C₀` be a smooth projective finite-field curve, `j:U₀→C₀` a dense open, and `ℱ₀` lisse and punctually `ι`-pure of real weight `β`. For `i=0`,`1`,`2`, every eigenvalue on `Hⁱ(C,j_*ℱ)` has `ι`-weight exactly `β+i`. In degree one this group is the image of `H¹_c(U,ℱ)→H¹(U,ℱ)`. If `ℱ` is integer-pure for every embedding, the eigenvalues are algebraic Weil `q`-numbers of weight `β+i`.

*Needs:* [6.3](#target-6-3), [5.11](#target-5-11), [5.3](#target-5-3), [EtaleCohomologyFoundations §§F.5–F.6, 0.11 (curve duality)](#input-e17), [0.5](#target-0-5), [0.6](#target-0-6).

(Sources: [WII](#ref-wii), §3.2 Théorème (3.2.3), (3.2.5), (3.2.15), pp. 200–204; [Yu](#ref-yu), Proposition 6.1.1 and proof, pp. 42–43.)

<a id="target-6-5"></a>

### 6.5. Compact-support bounds for pure curve coefficients

For a smooth finite-field curve `U₀` and lisse punctually `ι`-pure real-weight-`β ℱ₀`, `Hⁱ_c(U,ℱ)` has only `ι`-weights `≤β+i`, for `i=0`,`1`,`2`. For integer purity, these are algebraic integer-weight bounds for every complex conjugate. The parabolic image in degree one is pure `β+1`, while the extra boundary contribution has weights `≤β`.

*Needs:* [6.4](#target-6-4), [5.12](#target-5-12), [EtaleCohomologyFoundations §§F.3, F.5–F.6 (extreme-degree curve cohomology)](#input-e19), [0.9](#target-0-9).

(Sources: [WII](#ref-wii), §3.2 (3.2.3); §3.3 proof of (3.3.1), pp. 200, 204–205.)

### Examples

For `j:𝔾_m→ℙ¹` and constant coefficients of weight zero, parabolic `H¹` is zero. Compact `H¹` is a weight-zero boundary line, while compact `H²=ℚ_ℓ(−1)` has weight `2`. Thus the extra degree-one contribution is bounded by the coefficient weight and the zero parabolic image is pure vacuously (§§6.4–6.5).

### Dependencies

DWP.0–DWP.5; LefschetzPencilsAndVanishingCycles §§2.4–2.8, `3.1`–`3.5`, `4.1`–`4.4`; EtaleCohomologyFoundations §§F.2, `F`.`5`–`F`.`7`, F.10.1–F.10.5; InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T3–IG.0.T4 (rational constructible trace and constant-sheaf point count for every finite extension). Its boundary-adapted surface calculation is §6.1 here; its weights precede the general direct-image theorem.

## Layer DWP.7: General direct images, integrality and valuation bounds

Reduce general compact-support direct images to a tame relative curve, retaining both source and target dévissage steps. Apply DWP.6 on closed fibres and the local boundary bounds. Integrality is a separate theorem; combine it with archimedean purity and duality to obtain the lower weights and valuation triangles.

Geometric schemes here are separated and noetherian, with `ℓ` invertible. The finite-type base and the additional smoothness, normality or properness assumptions are those specified in each item.

<a id="target-7-1"></a>

### 7.1. Weil II §1.2 weight conventions for DWP.7–DWP.9, imported from DWP.5

Use DWP.5’s predicates on separated schemes of finite type over `ℤ[1/ℓ]`, with constructible `ℚ̄_ℓ` coefficients and, over finite fields, Weil descent. At a closed point `x` use its geometric Frobenius and `N(x)`. Integer purity means all eigenvalues are Weil `N(x)`-numbers of one integer weight; fixed-`ι` purity uses one real modulus weight. Mixedness is a finite subsheaf filtration with pure quotients, with actual weights from nonzero pieces. Subquotients, extensions, arbitrary pullback and finite direct image preserve mixedness; pure tensor weights add, lisse dual weights negate and Tate twist `r` subtracts `2r`. Fibre restriction uses the same closed-point residue fields. Integer mixedness implies `ι`-mixedness for every `ι`. This item applies the common definitions without constructing a second set of predicates.

*Needs:* [5.3](#target-5-3), [5.2](#target-5-2), [0.15](#target-0-15), [0.1](#target-0-1), [0.4](#target-0-4), [0.6](#target-0-6), [EtaleCohomologyFoundations §§F.0–F.4 (constructible derived coefficients, base change and finiteness)](#input-e12).

(Sources: [WII](#ref-wii), §1.2, Définition (1.2.2), p. 153; [WII](#ref-wii), §1.2, Stabilités (1.2.5), p. 154; [WII](#ref-wii), §1.2, (1.2.6), p. 154; [WII](#ref-wii), Notations et conventions, (0.1), p. 144.)

<a id="target-7-2"></a>

### 7.2. Integral sheaves

Let `X` be a scheme of finite type over `ℤ[1/ℓ]`. A sheaf `ℱ` on `X` is integral (entier) when, for every closed point `x ∈ |X|`, every eigenvalue of the geometric Frobenius `F_x` on the stalk `ℱ_x̄` is integral over `ℤ`. For a finite-dimensional `ℚ̄_ℓ`-space `V` with an endomorphism `F` the analogous predicate is: `(V, F)` is integral when every root of `det(T − F)` in `ℚ̄_ℓ` is integral over `ℤ`; a sheaf on `Spec 𝔽_q` is integral exactly when its geometric-Frobenius module is. Integrality is a condition separate from purity: `ℚ̄_ℓ(1)` is pure of weight `−2` and not integral.

Integrality is over `ℤ`. It is stronger than the automatic `ℤ_ℓ`-integrality of an étale stalk eigenvalue.

Its API includes:
- `IsIntegralEnd (F : V →ₗ[E] V)` : `Prop := ∀ α ∈ eigenvalues F`, `IsIntegral ℤ α`, for `E` any field and `V` finite-dimensional (the sheaf-theoretic use has `E = ℚ̄_ℓ`), with `eigenvalues F` the DWP.0 multiset of roots of the characteristic polynomial in an algebraic closure.

- `IsIntegralSheaf`: `IsIntegralSheaf ℱ : Prop := ∀ x ∈ |X|`, `IsIntegralEnd` (`F_x` acting on `ℱ_x̄`).

- `IsIntegralEnd F ↔` every root of `det(T − F)` in an algebraic closure is integral over `ℤ`; when `det(T − F)` has rational coefficients this holds iff it has integer coefficients.

- For an `F`-stable subspace `W ⊆ V: IsIntegralEnd F ↔ IsIntegralEnd (F|W) ∧ IsIntegralEnd` (`F` on `V/W`).

- `IsIntegralEnd F → IsIntegralEnd (F ^ r)` for `r ≥ 1`, and conversely: an algebraic number with an integral power is integral.

- `IsIntegralEnd F → IsIntegralEnd G → IsIntegralEnd (F ⊗ G)`.

- `IsIntegralSheaf.comap`: Pullback along any morphism of schemes of finite type over `ℤ[1/ℓ]` preserves integrality.

- `IsIntegralSheaf.finite_pushforward`: Direct image along a finite morphism preserves integrality.

- `IsIntegralSheaf.twist_neg`: `ℱ` integral and `m ≥ 0 ⇒ ℱ(−m)` integral; the converse fails for `m > 0`.

- `IsIntegralSheaf.weights_nonneg`: An integral mixed sheaf has all punctual weights `≥ 0` (Weil II 3.3.2): the norm of an integral Weil `q`-number of weight `n` and degree `d` is a nonzero integer of absolute value `q^{nd/2}` (DWP.0/weil-number-arithmetic (iv)).

- `IsIntegralSheaf.constant`: The constant sheaf `ℚ̄_ℓ` is integral; so is every sheaf `ℱ` whose Frobenius traces at all closed points of all finite extensions are algebraic integers.

#### Checks
- On `Spec 𝔽_q`, `ℚ̄_ℓ(−1)` (`F` acts by `q`) is integral: `q` is an algebraic integer.

- On `Spec 𝔽_q`, `ℚ̄_ℓ(1)` (`F` acts by `q⁻¹`) is not integral although it is punctually pure of weight `−2`: purity does not imply integrality.

- For `ℓ ≠ 5`, the rank-one Weil sheaf on `Spec 𝔽_q` on which `F` acts by `b = (3 + 4i)/5` is punctually pure of weight `0` (every complex conjugate of `b` has absolute value `1`) but not integral: `b` is not an algebraic integer. A definition '`integral = weights ≥ 0`' fails this test.

- The zero sheaf, and the zero Frobenius module, are integral.

- Over `E = 𝔽_p(t)`, the identity on `E` is integral over `ℤ`, while multiplication by `t` is not: integrality here is equivalent to algebraicity over `𝔽_p`, so the predicate also distinguishes eigenvalues in positive characteristic.

- The Frobenius module `(ℚ̄_ℓ², [[q, 1], [0, q]])` is integral: integrality reads the characteristic polynomial `(T − q)²`, not a diagonal form.

*Needs:* [0.7](#target-0-7), [0.9](#target-0-9), [0.11](#target-0-11), [0.13](#target-0-13), [0.2](#target-0-2), [7.1](#target-7-1).

(Sources: [WII](#ref-wii), §3.3, (3.3.2), p. 205.)

<a id="target-7-3"></a>

### 7.3. Dévissages (a), (b), (f) of the direct-image theorem

Let `f : X → Y` be a separated morphism of schemes of finite type over `ℤ[1/ℓ]` and `n ∈ ℤ`. Say that a sheaf `ℱ` on `X` satisfies `P_n(f)` when `R^i f_!ℱ` is mixed of weights `≤ n + i` for every `i`. (a) For an exact sequence `0 → ℱ′ → ℱ → ℱ″ → 0: P_n(f)` for `ℱ′` and `ℱ″` implies `P_n(f)` for `ℱ`; `P_n(f)` for `ℱ` and `ℱ″` implies `P_n(f)` for `ℱ′`; if the sequence splits, `P_n(f)` for `ℱ` implies `P_n(f)` for `ℱ′`. (b) If `j : U → X` is open with closed complement `i : S → X`, then `P_n(f∘j)` for `j*ℱ` and `P_n(f∘i)` for `i*ℱ` imply `P_n(f)` for `ℱ`. (f) If `f` is quasi-finite and `ℱ` is punctually pure of weight `m`, then `f_!ℱ = R⁰f_!ℱ` is punctually pure of weight `m` and `R^i f_!ℱ = 0` for `i ≠ 0`; hence, by (a), every mixed `ℱ` of weights `≤ n` satisfies `P_n(f)` when `f` is quasi-finite. The same statements hold with 'mixed of weights `≤ n + i`' replaced by '`ι`-mixed of `ι`-weights `≤ β + i`' `(β ∈ ℝ)` and, for `X` over `𝔽_q`, for Weil sheaves.

*Needs:* [7.1](#target-7-1), [EtaleCohomologyFoundations §§F.0–F.4 (constructible derived coefficients, base change and finiteness)](#input-e12), [EtaleCohomologyFoundations §§F.0–F.4, F.10.1–F.10.5 and InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4 (finite cohomology, base change and geometric trace formulas)](#input-e49), [0.3](#target-0-3), [0.4](#target-0-4).

(Sources: [WII](#ref-wii), §3, (3.3.1) a), b), f), p. 204; [WII](#ref-wii), §3, (3.3.1) f), p. 204.)

<a id="target-7-4"></a>

### 7.4. Dévissages (c), (d), (e) of the direct-image theorem

Keep the notation `P_n(f)` of DWP.7/devissage-in-the-sheaf-and-the-source. (c) Let `j : V → Y` be open with closed complement `i : T → Y`, and `f_V`, `f_T` the base changes of `f`. Then `ℱ` satisfies `P_n(f)` iff `ℱ|X_V` satisfies `P_n(f_V)` and `ℱ|X_T` satisfies `P_n(f_T)`. More generally, a sheaf `𝒢` on `Y` is mixed of weights `≤ m` iff `𝒢|V` and `𝒢|T` are. (d) If `f = g ∘ h` with `h : X → Z` and `g : Z → Y` separated of finite type, and `R^p g_! R^q h_!ℱ` is mixed of weights `≤ n + p + q` for all `p`, `q`, then `ℱ` satisfies `P_n(f)`; in particular `P_n(h)` for `ℱ` together with `P_{n+q}(g)` for every `R^q h_!ℱ` implies `P_n(f)`. (e) If `g : Y′ → Y` is a universal homeomorphism (integral, radicial, surjective), `f′ : X′ → Y′` the base change and `ℱ′` the pullback of `ℱ`, then `ℱ` satisfies `P_n(f)` iff `ℱ′` satisfies `P_n(f′)`; examples: `Y′ = Y_red`, and for `Y` normal integral, the normalisation of `Y` in a purely inseparable extension of its function field. The same statements hold for `ι`-mixed sheaves with real weights.

*Needs:* [7.3](#target-7-3), [7.1](#target-7-1), [EtaleCohomologyFoundations §§F.0–F.4 (constructible derived coefficients, base change and finiteness)](#input-e12), [EtaleCohomologyFoundations §§F.0–F.4, F.10.1–F.10.5 and InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4 (finite cohomology, base change and geometric trace formulas)](#input-e49).

(Sources: [WII](#ref-wii), §3, (3.3.1) c), d), e), p. 204; [WII](#ref-wii), §3, (3.3.1) e), p. 204.)

<a id="target-7-5"></a>

### 7.5. Generic smoothness and tame covers of a lisse sheaf on a curve (Weil II `(α)`, `(β)`)

Let `K` be a field in which `ℓ` is invertible, `C` a separated `K`-scheme of finite type of dimension `1`, and `ℱ` a lisse `ℚ̄_ℓ`-sheaf on `C`. After replacing `K` by a finite purely inseparable extension (none is needed if `K` is perfect): `(α)` there is a finite set `Σ` of closed points of `C_red` such that `C′ = C_red − Σ` is smooth over `K`; `(β)` there are a smooth projective curve `D̄` over `K`, a reduced divisor `E ⊂ D̄` étale over `K`, and a finite étale surjective morphism `u : D = D̄ − E → C′` such that `u*ℱ` is tamely ramified along `E`, and `ℱ|C′` is a direct summand of `u_*u*ℱ = Ru_*u*ℱ`.

Trace followed by adjunction multiplies by the cover degree on each component, which is invertible in `ℚ̄_ℓ`.

*Needs:* [EtaleCohomologyFoundations §§F.0–F.4 (constructible derived coefficients, base change and finiteness)](#input-e12), [AlgebraicCurves, Layer 12 (function-field/curve dictionary)](#input-e58), [EtaleCohomologyFoundations §§F.0–F.4, F.10.1–F.10.5 and InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4 (finite cohomology, base change and geometric trace formulas)](#input-e49), [LefschetzPencilsAndVanishingCycles §§1.1–1.6 (inertia, monodromy and relative filtrations)](#input-e31).

(Sources: [WII](#ref-wii), §3, proof of (3.3.1), p. 205.)

<a id="target-7-6"></a>

### 7.6. Reduction of the direct-image theorem to a tame smooth projective relative curve

Assume Theorem 3.3.1 holds for every quadruple `(f̄, D, ℱ, Y)` of the following kind: `Y` is an integral regular scheme of finite type over `ℤ[1/ℓ]` (the source's '`Y_red` lisse'); `f̄ : X̄ → Y` is projective and smooth of pure relative dimension `1`; `D ⊂ X̄` is a divisor finite étale over `Y`; `X = X̄ − D` with `f = f̄|X`; and `ℱ` is a lisse sheaf on `X`, punctually pure of weight `n` and tamely ramified along `D`. Then Theorem 3.3.1 holds for every separated morphism of schemes of finite type over `ℤ[1/ℓ]` and every sheaf mixed of weights `≤ n`. The same reduction holds for `ι`-mixed sheaves with real weights.

*Needs:* [7.3](#target-7-3), [7.4](#target-7-4), [7.5](#target-7-5), [ModularCurves §0E and SchemeAndStackFoundations §0.9 (spreading out)](#input-e62), [SchemeAndStackFoundations §0.9 and LefschetzPencilsAndVanishingCycles §§7b.3, 7b.7 (Noetherian approximation and arithmetic models)](#input-e8), [EtaleCohomologyFoundations §§F.0–F.4, F.10.1–F.10.5 and InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4 (finite cohomology, base change and geometric trace formulas)](#input-e49).

(Sources: [WII](#ref-wii), §3, proof of (3.3.1), p. 205.)

<a id="target-7-7"></a>

### 7.7. The direct-image theorem for a tame smooth projective relative curve

In the reduced situation of DWP.7/spreading-out-to-a-tame-relative-curve (`f̄ : X̄ → Y` projective and smooth of pure relative dimension `1` over an integral regular `Y` of finite type over `ℤ[1/ℓ]`, `j : X = X̄ − D → X̄` with `i : D → X̄` the inclusion of a divisor finite étale over `Y`, and `ℱ` lisse on `X`, punctually pure of weight `n` and tamely ramified along `D`), `R^i f_!ℱ` is mixed of weights `≤ n + i` for every `i`. More precisely `Rf_!ℱ = Rf̄_*(j_!ℱ)`; `R^i f̄_*(j_*ℱ)` is punctually pure of weight `n + i`; and `i*j_*ℱ` carries the filtration induced by the local monodromy filtration `M` along `D`, with `Gr^M_k(i*j_*ℱ)` zero for `k > 0` and punctually pure of weight `n + k` on `D` for `k ≤ 0`. The `ι`-version holds with `n` replaced by `β ∈ ℝ`.

*Needs:* [7.6](#target-7-6), [7.3](#target-7-3), [6.4](#target-6-4), [5.11](#target-5-11), [5.12](#target-5-12), [EtaleCohomologyFoundations §§F.0–F.4 (constructible derived coefficients, base change and finiteness)](#input-e12), [EtaleCohomologyFoundations §§F.0–F.4, F.10.1–F.10.5 and InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4 (finite cohomology, base change and geometric trace formulas)](#input-e49).

(Sources: [WII](#ref-wii), §3, proof of (3.3.1), p. 205.)

<a id="target-7-8"></a>

### 7.8. Deligne's fundamental theorem: `R^i f_!` of a mixed sheaf of weights `≤ n` has weights `≤ n + i`

Let `f : X → Y` be a separated morphism of schemes of finite type over `ℤ[1/ℓ]` and `ℱ` a sheaf on `X`, mixed of weights `≤ n`. Then for every `i` the sheaf `R^i f_!ℱ` on `Y` is mixed of weights `≤ n + i`. In particular, for `X₀` of finite type over `𝔽_q`, `Y₀ = Spec 𝔽_q` and `ℱ₀` mixed of weights `≤ n` (a Weil sheaf being allowed), every eigenvalue `α` of the geometric Frobenius `F` on `H^i_c(X, ℱ)` is an algebraic number for which there is an integer `w ≤ n + i` with `|σ(α)| = q^{w/2}` for every field embedding `σ : ℚ(α) → ℂ`.

*Needs:* [7.6](#target-7-6), [7.7](#target-7-7), [7.1](#target-7-1), [0.1](#target-0-1), [5.2](#target-5-2).

(Sources: [WII](#ref-wii), §3, Théorème (3.3.1), p. 204; [WII](#ref-wii), Introduction, Théorème 1, p. 138.)

<a id="target-7-9"></a>

### 7.9. The direct-image theorem for `ι`-mixed sheaves with real weights

Fix a field isomorphism `ι : ℚ̄_ℓ ≅ ℂ` and `β ∈ ℝ`. Let `f : X → Y` be a separated morphism of schemes of finite type over `ℤ[1/ℓ]` and `ℱ` an `ι`-mixed sheaf on `X` with punctual `ι`-weights `≤ β`. Then for every `i`, `R^i f_!ℱ` is `ι`-mixed, and every punctual `ι`-weight of `R^i f_!ℱ` is `≤ β + i` and congruent modulo `ℤ` to one of the punctual `ι`-weights of `ℱ`. Over `𝔽_q` (Weil sheaves allowed), every eigenvalue of `F` on `H^i_c(X, ℱ)` has `ι`-weight `≤ β + i` in such a class. No algebraicity, no integrality and no bound at another embedding follows from this statement.

*Needs:* [7.6](#target-7-6), [7.7](#target-7-7), [7.1](#target-7-1), [5.3](#target-5-3), [5.12](#target-5-12), [6.4](#target-6-4), [0.4](#target-0-4).

(Sources: [WII](#ref-wii), §3, (3.3.10), p. 207.)

**Affine fibration reduction for integrality** (`integrality_fibrationReduction`).
For a nonempty separated finite-type scheme `X/𝔽_q` of pure dimension `n>1`,
construct a dense affine open `U` with `dim(X−U)<n` and an affine morphism
`U→Y` to a finite-field curve whose fibres have dimension `≤n−1`.
Choose disjoint affine neighborhoods of the generic points after removing
component intersections. Apply affine Noether normalization on each component
and project `𝔸ⁿ→𝔸¹`; their finite disjoint union is affine and one may take
`Y=𝔸¹`. Retain nonreduced structure; the dimension bounds concern the
underlying spaces. Stratification by component dimension supplies the
corresponding reduction for an arbitrary finite-type `X` in the integrality induction.

*Needs:* Mathlib
[exists_finite_inj_algHom_of_fg](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/NoetherNormalization.lean#L287)
(finite Noether normalization for a finitely generated algebra over a field);
SchemeAndStackFoundations §0.7 (dimensions and finite-type morphisms).
(Source: [Int](#ref-int), Exposé XXI, proof of Théorème 5.2.2, pp. 386–387.)

**Checks.**

- For `X=𝔸ⁿ` with `n>1`, the first-coordinate projection has fibres `𝔸^(n−1)`
  and `U=X`, so the complement is empty.
- For `X=ℙⁿ`, its standard affine open `U=𝔸ⁿ` has complement `ℙ^(n−1)`;
  the same projection gives the required fibre bound.
- The constant map `𝔸ⁿ→𝔸¹` has a fibre of dimension `n` and fails the bound.
  Affineness alone does not give dimension reduction.

<a id="target-7-10"></a>

### 7.10. Deligne's integrality theorem (SGA `7` XXI 5.2.2)

Let `f : X → Y` be a separated morphism of schemes of finite type over `ℤ[1/ℓ]` whose fibres have dimension `≤ d`, and `ℱ` an integral sheaf on `X` (DWP.7/integral-sheaf). Then for every `i` the sheaf `R^i f_!ℱ` is integral, and for `i ≥ d` the `twist R^i f_!ℱ(i − d)` is integral: at every closed point `y` of `Y`, every eigenvalue `α` of `F_y` on `(R^i f_!ℱ)_ȳ` is an algebraic integer, and for `i ≥ d` the number `α/N(y)^{i−d}` is an algebraic integer.

*Needs:* integrality_fibrationReduction above, [7.2](#target-7-2), [EtaleCohomologyFoundations §§F.0–F.4, F.10.1–F.10.5 and InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4 (finite cohomology, base change and geometric trace formulas)](#input-e49), [EtaleCohomologyFoundations §§F.0–F.4 (constructible derived coefficients, base change and finiteness)](#input-e12), [5.2](#target-5-2), [EtaleCohomologyFoundations §§F.5–F.6 (smooth purity and Poincaré duality)](#input-e16).

(Sources: [WII](#ref-wii), §3, proof of Corollaire (3.3.3), p. 205; [Int](#ref-int), Exposé XXI, §5, Lemma 5.2.1 and Théorème 5.2.2, pp. 384–387.)

<a id="target-7-11"></a>

### 7.11. Weights of `R^i f_!` of an integral mixed sheaf lie between `0` (or `2(i − d)`) and `n + i`

Let `f : X → Y` be a separated morphism of schemes of finite type over `ℤ[1/ℓ]` whose fibres have dimension `≤ d`, and `ℱ` an integral sheaf on `X`, mixed of weights `≤ n`. Then for every `i`, `R^i f_!ℱ` is mixed with all punctual weights in `[0, n + i]`; if `i > d`, all punctual weights lie in `[2(i − d), n + i]`.

*Needs:* [7.8](#target-7-8), [7.10](#target-7-10), [7.2](#target-7-2).

(Sources: [WII](#ref-wii), §3, Corollaire (3.3.3), p. 205.)

<a id="target-7-12"></a>

### 7.12. Weight bounds for `H^i_c` and `H^i` over a finite field, and purity of the image `H^i_c → H^i`

Let `X₀` be a scheme of finite type over `𝔽_q`, `X = X₀ ⊗ 𝔽̄_q`. (i) (Weil II 3.3.4) If `ℱ₀` is mixed of weights `≤ n` (a Weil sheaf being allowed), then `H^i_c(X, ℱ)` is mixed of weights `≤ n + i`: every eigenvalue `α` of `F` is algebraic, with an integer `w ≤ n + i` such that every complex conjugate of `α` has absolute value `q^{w/2}`. If `ℱ₀` is integral then `w ≥ 0`, and if moreover `i > d = dim X₀` then `w ≥ 2(i − d)`. (ii) (3.3.5) If `X₀` is smooth and `ℱ₀` is lisse and mixed of weights `≥ n`, then `H^i(X, ℱ)` is mixed of weights `≥ n + i`. (iii) (3.3.6) If `X₀` is smooth and `ℱ₀` is lisse and punctually pure of weight `n`, then the image of `H^i_c(X, ℱ) → H^i(X, ℱ)` is pure of weight `n + i`. (iv) (3.3.10) For a fixed `ι`, (i) without its integral clauses, (ii) and (iii) hold with 'mixed' replaced by '`ι`-mixed', `n` by `β ∈ ℝ` and weights read as `ι`-weights.

*Needs:* [7.8](#target-7-8), [7.11](#target-7-11), [7.9](#target-7-9), [EtaleCohomologyFoundations §§F.5–F.6 (smooth purity and Poincaré duality)](#input-e16), [0.16](#target-0-16), [0.9](#target-0-9), [0.13](#target-0-13).

(Sources: [WII](#ref-wii), §3, Corollaire (3.3.4), p. 206; [WII](#ref-wii), §3, Corollaires (3.3.5) et (3.3.6), p. 206; [WII](#ref-wii), §3, (3.3.10), p. 207.)

<a id="target-7-13"></a>

### 7.13. The `p`-adic couple of a pure algebraic number

Let `q = p^f`, `n ∈ ℤ`, and `α` an algebraic number which is a Weil `q`-number of weight `n` (DWP.0). Let `K` be a number field containing `α` and `v` a valuation of `K` above `p`, normalised by `v(q) = 1`, extended to `v : K → ℚ ∪ {∞}`. The couple of `α` at `v` is `(r, s) = (v(α), v(q^n α⁻¹))`. Here `q^n α⁻¹ ∈ K`, and under every embedding `σ : K → ℂ` it maps to the complex conjugate of `σ(α)` (DWP.0/weil-number-arithmetic (iii)); so `q^n α⁻¹` has the same minimal polynomial over `ℚ` as `α`, `i`.`e`. it is a Galois conjugate of `α`. Always `r + s = n`; if `α` is integral over `ℤ` then `r ≥ 0` and `s ≥ 0`.

Its API includes:
- `newtonCouple` (`v` : AddValuation `K` (WithTop `ℚ`)) `(q : K) (n : ℤ) (α : K)` : WithTop `ℚ ×` WithTop `ℚ := (v α, v (q ^ n * α⁻¹))`.

- `v q = 1 → α ≠ 0 → (newtonCouple v q n α)`.`1 + (newtonCouple v q n α)`.`2 = n`.

- For an integral Weil `q`-number `α` of weight `n` with `q ∈ ℕ`, `q^n α⁻¹` is integral over `ℤ`, since it has the same minimal polynomial as `α`. If `v` is nonnegative on elements integral over `ℤ`, both coordinates are `≥ 0`.

- For a Weil `q`-number `α` of weight `n`, the couple of `q^n α⁻¹` is the couple of `α` with its coordinates swapped.

- For `τ ∈ Aut(K)` fixing `q`, `newtonCouple (v ∘ τ) q n α = newtonCouple v q n (τ α)`. In the intended number-field application `q` is rational, so it is fixed.

- For `q ≠ 0`, `newtonCouple v q (n + m) (αβ) = newtonCouple v q n α + newtonCouple v q m β`. The raw valuation API needs `q ≠ 0` to use integer-power multiplication; it follows from `v(q)=1` in the intended normalisation.

- The couple of `α/q^m` (weight `n − 2m`) is `(r − m, s − m)`.

#### Checks
- `r + s = n` for every valuation `v` with `v(q) = 1` and every nonzero `α`.

- `q = p`, `α = √−p` (weight `1`, a root of `T² + p`): at the unique place above `p` of `ℚ(√−p)`, `(r, s) = (1/2, 1/2)`.

- `q = 5`, `α = 1 + 2i` (weight `1`, `|α|² = 5`): at the place `v` of `ℚ(i)` with `v(1 + 2i) = 1` (normalised `v(5) = 1`), `(r, s) = (1, 0)`; at the conjugate place `(r, s) = (0, 1)`. The complementary conjugate `5/α = 1 − 2i` is integral without a separate integrality hypothesis.

- `α = q^m` (weight `2m`): `(r, s) = (m, m)` at every place above `p`.

- `α = q⁻¹` (weight `−2`): `(r, s) = (−1, −1)`; the nonnegativity of `r` and `s` genuinely needs integrality.

- `newtonCouple_zero_base`: In the raw valuation definition, with `q=0`, `α=β=1`, `n=1` and `m=−1`, the couple at `n+m=0` is `(0,0)`, while the sum of the two couples is `(0,∞)`. Thus the multiplication API requires `q ≠ 0`.

*Needs:* [0.1](#target-0-1), [0.2](#target-0-2).

(Sources: [WII](#ref-wii), §3, (3.3.7), p. 206.)

<a id="target-7-14"></a>

### 7.14. The `p`-adic couples of Frobenius eigenvalues lie in triangles

Let `X₀` be a scheme of finite type over `𝔽_q`, `q = p^f`, of dimension `≤ d`, and `i ≥ 0`. Let `α` be an eigenvalue of `F` on `H^i_c(X, ℚ̄_ℓ)`, or on `H^i(X, ℚ̄_ℓ)` when `X₀` is proper, of weight `w`, and `(r, s)` its couple at a place `v` above `p` (DWP.7/newton-couples-`3`-`3`-`7`). Then `r + s = w ≤ i` and `r`, `s ≥ max(0, i − d)`: `(r, s)` lies in the lower triangle `{r + s ≤ i, r ≥ max(0, i − d), s ≥ max(0, i − d)}`. If `X₀` is smooth of dimension `≤ d` and `α` is an eigenvalue of `F` on `H^i(X, ℚ̄_ℓ)`, then `r + s = w ≥ i` and `r`, `s ≤ min(i, d)`: `(r, s)` lies in the upper triangle `{r + s ≥ i, r ≤ min(i, d), s ≤ min(i, d)}`.

Use constant coefficients; the upper-triangle duality argument is degreewise on smooth pure-dimensional components.

*Needs:* [7.13](#target-7-13), [7.10](#target-7-10), [7.12](#target-7-12), [EtaleCohomologyFoundations §§F.5–F.6 (smooth purity and Poincaré duality)](#input-e16).

(Sources: [WII](#ref-wii), §3, Corollaire (3.3.8), p. 206; [WII](#ref-wii), §3, after (3.3.8), p. 207.)

<a id="target-7-15"></a>

### 7.15. Purity for proper smooth varieties and rational homology manifolds over a finite field

Let `X₀` be a scheme of finite type over `𝔽_q`, `X = X₀ ⊗ 𝔽̄_q`, a : `X₀ → Spec 𝔽_q`. (i) If `X₀` is proper and smooth and `ℱ₀` is lisse and punctually pure of weight `n`, then `H^i(X, ℱ)` is pure of weight `n + i` for every `i`; the same holds for `ι`-purity with `n ∈ ℝ`. (ii) (Weil II 3.3.9) If `X₀` is proper and smooth, then for every `i` the polynomial `det(1 − F t, H^i(X, ℚ_ℓ))` has integer coefficients independent of `ℓ ≠ p`, and its reciprocal roots, the eigenvalues of `F`, are Weil `q`-numbers of weight `i`. (iii) (3.3.11) In (i) and (ii) and in DWP.7/cohomological-bounds-`3`-`3`-`2`-`3`-`3`-`6` (ii)–(iii), 'smooth of pure dimension `N`' may be replaced by the condition that `X₀` is of pure dimension `N` and `Ra^!ℚ_ℓ ≅ ℚ_ℓ(N)[2N]` Frobenius-equivariantly (EtaleCohomologyFoundations §F.5's exceptional inverse image), for instance when `X₀` is étale-locally the quotient of a smooth scheme of dimension `N` by a finite group; then the lower bound and purity statements hold with `ℱ₀ = ℚ̄_ℓ`.

The integral factors and `ℓ`-independence in (ii) use §4.4 after purity in (i) and integrality from §7.10. In (iii) use constant coefficients and the displayed dualizing-object isomorphism.

*Needs:* [7.12](#target-7-12), [7.1](#target-7-1), [4.4](#target-4-4), [7.10](#target-7-10), [EtaleCohomologyFoundations §§F.0–F.4, F.10.1–F.10.5 and InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4 (finite cohomology, base change and geometric trace formulas)](#input-e49), [EtaleCohomologyFoundations §F.5 (exceptional inverse image and Verdier duality)](#input-e15), [EtaleCohomologyFoundations §§F.5–F.6 (smooth purity and Poincaré duality)](#input-e16), [0.1](#target-0-1).

(Sources: [WII](#ref-wii), §3, Corollaire (3.3.9), p. 207; [WII](#ref-wii), §3, (3.3.11), p. 207; [WII](#ref-wii), Introduction, p. 138; [Yu](#ref-yu), Proposition 6.1.1, proof, pp. 42–43.)

### Examples

For `H²c(𝔾_m)=ℚ_ℓ(−1)`, `i=2` and `d=1`, the eigenvalue `q` has weight `2` and Newton couple `(1,1)`, saturating the lower-triangle bound. The Tate line `ℚ_ℓ(1)` has scalar `q⁻¹`, weight `−2` and couple `(−1,−1)`, so pure coefficients alone cannot imply integrality (§§7.2, `7.13`–`7.14`).

### Dependencies

DWP.0–DWP.6; EtaleCohomologyFoundations §§F.0–F.7, F.10.1–F.10.5; LefschetzPencilsAndVanishingCycles §§1.1–1.6, 7b.3; InverseGaloisAndArithmeticFundamentalGroups §IG.0.T3 (rational constructible trace formula for all powers); SchemeAndStackFoundations §0.9; AlgebraicCurves Layer `12`; ModularCurves §0E; §4.4 for the integral-factor consequence after purity.

## Layer DWP.8: Mixed complexes, weight filtrations and geometric semisimplicity

The constructible derived category and its six operations are imported; this layer proves mixedness and directional weight estimates on them. On normal bases, `Ext¹` bounds give weight-class decomposition, the unique strict lisse weight filtration and geometric semisimplicity. Keep arithmetic model witnesses in potentially pure statements.

Geometric schemes here are separated and noetherian, with `ℓ` invertible. The finite-type base and the additional smoothness, normality or properness assumptions are those specified in each item.

<a id="target-8-1"></a>

### 8.1. Mixed complexes and complexes of weights `≤ w`

In the imported bounded constructible derived category, define a mixed complex `K` by mixedness of every `ℋⁱK`. Define `K≤w` by requiring `ℋⁱK` to have punctual weights `≤w+i`. The full mixed subcategory is triangulated. Define the fixed-`ι` version with real `w` in the same way. Use Weil coefficients over `𝔽_q` and constructible coefficients over `ℤ[1/ℓ]`. Shifts follow cohomological indexing, and twists follow the geometric-Frobenius convention.

Its API includes:
- `IsMixedComplex`: `IsMixedComplex K : Prop := ∀ i`, `IsMixed (ℋ^i K)`, for `K` in the bounded constructible derived category of EtaleCohomologyFoundations §§F.0, `F`.`4`.

- `HasWeightsLE`: `HasWeightsLE (w : ℤ) K : Prop := ∀ i`, `IsMixed (ℋ^i K) ∧ ∀` weight `m` of `ℋ^i K`, `m ≤ w + i`.

- `HasIotaWeightsLE`: The `ι`-variant with `w : ℝ` and DWP.5's `ι`-mixed sheaves.

- `isMixedComplex_triangle`: `D^b_m` is a triangulated subcategory: two out of three terms of a distinguished triangle mixed `⇒` the third is; closed under shifts and direct summands.

- `HasWeightsLE.of_triangle`: For a distinguished triangle `K′ → K → K″ →: K′`, `K″` of weights `≤ w ⇒ K` of weights `≤ w`.

- `hasWeightsLE_shift`: `HasWeightsLE (w + 1) (K[1]) ↔ HasWeightsLE w K: ℋ^i(K[1]) = ℋ^{i+1}K`.

- `hasWeightsLE_twist`: `K(r)` has weights `≤ w − 2r` iff `K` has weights `≤ w`; in particular `K(N)[2N]` has weights `≤ w` iff `K` has (Weil II 6.2.5 `a`).

- `HasWeightsLE.mono`: `w ≤ w′ → HasWeightsLE w K → HasWeightsLE w′ K`.

- `hasWeightsLE_sheaf_iff`: A sheaf `ℱ` placed in degree `0` has weights `≤ w` iff `ℱ` is mixed of punctual weights `≤ w`.

- `hasWeightsLE_iff_eigenvalues`: For mixed `K: K` has weights `≤ w` iff for all `i` and `x ∈ |X₀|` every eigenvalue of `F_x` on `ℋ^i(K)_x̄` has weight `≤ w + i` relative to `N(x)`.

- `hasWeightsLE_baseExtension`: Weights are unchanged by the base extension `𝔽_q → 𝔽_{q^r}` (DWP.0/finite-field-base-extension-of-weights).

- `HasWeightsLE.isIotaWeightsLE`: A complex of weights `≤ w` has `ι`-weights `≤ w` for every `ι`.

#### Checks
- `hasWeightsLE_const_shift_neg`: On `Spec 𝔽_q`, `ℚ̄_ℓ[−1]` (`ℋ¹ = ℚ̄_ℓ` of weight `0`) has weights `≤ −1` and not `≤ −2`; a definition without the shift by `i` would give `≤ 0`.

- `hasWeightsLE_const_shift_pos`: On `Spec 𝔽_q`, `ℚ̄_ℓ[1]` has weights `≤ 1` and not `≤ 0`.

- `hasWeightsLE_tate_shift`: `ℚ̄_ℓ(1)[2]` has weights `≤ 0` (Weil II 6.2.5 `a` with `N = 1`)`: ℋ^{−2} = ℚ̄_ℓ(1)` has weight `−2 = 0 + (−2)`.

- `hasWeightsLE_zero`: The zero complex is mixed and has weights `≤ w` for every `w`.

- `not_isMixedComplex_transcendental`: On `Spec 𝔽_q`, the rank-one Weil sheaf on which `F` acts by a transcendental `b ∈ ℚ̄_ℓ^×` is not mixed (its eigenvalue is not a Weil number), although it is `ι`-mixed for every `ι`.

- `hasWeightsLE_point_iff`: On `Spec 𝔽_q`, `K` has weights `≤ w` iff every eigenvalue of `F` on every `H^i(K)` is a Weil `q`-number of weight `≤ w + i`, `i`.`e`. iff each Frobenius module `H^i(K)` has DWP.0 weights `≤ w + i`.

*Needs:* [7.1](#target-7-1), [EtaleCohomologyFoundations §§F.0–F.4 (constructible derived coefficients, base change and finiteness)](#input-e12), [0.7](#target-0-7), [0.9](#target-0-9), [0.12](#target-0-12).

(Sources: [WII](#ref-wii), §6, Définition (6.2.2), p. 247; [WII](#ref-wii), §6, (6.1.1), p. 243.)

<a id="target-8-2"></a>

### 8.2. Complexes of weights `≥ w` and pure complexes

Let `X₀` be of finite type over `𝔽_q`, a : `X₀ → Spec 𝔽_q`, `K_{X₀} = Ra^!ℚ̄_ℓ` the dualizing complex and `D = RHom(−, K_{X₀})` the duality functor of EtaleCohomologyFoundations §F.5, which is involutive on `D^b_c(X₀)`, exchanges `f*` with `Rf^!` and `Rf_*` with `Rf_!`, and satisfies `D(K ⊗ L) = RHom(K, DL)`. A complex `K` is mixed of weights `≥ w` when `DK` is mixed of weights `≤ −w` (DWP.8/mixed-complexes). `K` is pure of weight `w` when it is mixed of weights `≤ w` and of weights `≥ w` (Weil II 6.2.4). A sheaf `ℱ` is pure of weight `w` when the complex `ℱ[0]` is. The `ι`-variants `(w ∈ ℝ)` are defined in the same way. On `X₀` smooth of pure dimension `d`, `K_{X₀} = ℚ̄_ℓ(d)[2d]` (EtaleCohomologyFoundations §F.6), so `K` has weights `≥ w` iff `RHom(K, ℚ̄_ℓ)` has weights `≤ −w`.

Its API includes:
- `HasWeightsGE`: `HasWeightsGE (w : ℤ) K : Prop := HasWeightsLE (−w) (D K)`.

- `IsPureComplex`: `IsPureComplex (w : ℤ) K : Prop := HasWeightsLE w K ∧ HasWeightsGE w K`.

- `hasWeightsGE_dual`: `HasWeightsGE w (D K) ↔ HasWeightsLE (−w) K`, by biduality.

- `IsPureComplex.dual`: `IsPureComplex w K ↔ IsPureComplex (−w) (D K)`.

- `HasWeightsGE.of_triangle`: Extensions of complexes of weights `≥ w` have weights `≥ w`; so do direct summands.

- `IsPureComplex.of_triangle`: Extensions and direct summands of pure complexes of weight `w` are pure of weight `w`.

- `hasWeightsGE_shift_twist`: `K[1] ≥ w + 1 ↔ K ≥ w`; `K(r) ≥ w − 2r ↔ K ≥ w`.

- `hasWeightsGE_iff_rhom_smooth`: On `X₀` smooth of pure dimension: `HasWeightsGE w K ↔ HasWeightsLE (−w) (RHom(K, ℚ̄_ℓ))` (Weil II 6.2.5 `b`).

- `isPureComplex_iff_lisse`: On `X₀` smooth with all `ℋ^iK` lisse: `IsPureComplex w K ↔ ∀ i`, `ℋ^iK` is punctually pure of weight `w + i` (DWP.8`/twist`-shift-and-smooth-lisse-purity-`6`-`2`-`5`).

- `IsPureComplex.directSum`: A finite direct sum of pure complexes of weight `w` is pure of weight `w`; a sum containing two nonzero pure summands of distinct weights is mixed but cannot be pure of one weight. The zero complex is pure of every weight.

#### Checks
- `isPureComplex_const_smooth`: On `X₀` smooth of pure dimension `d`, `ℚ̄_ℓ[0]` is pure of weight `0` and `ℚ̄_ℓ[d]` is pure of weight `d`.

- `isPureComplex_point_iff`: On `Spec 𝔽_q`, `K` is pure of weight `w` iff every Frobenius module `H^i(K)` is pure of weight `w + i` in the sense of DWP.0/endomorphism-weights.

- `not_isPureComplex_nodal`: On the nodal cubic `X₀ ⊂ ℙ²`, `ℚ̄_ℓ[0]` is mixed of weights `≤ 0` and every stalk is pure of weight `0`, but it is not pure: if it were, `H¹(X, ℚ̄_ℓ)` would be pure of weight `1` (proper direct image, 6.2.6), whereas it is `ℚ̄_ℓ` of weight `0`.

- `not_isPureComplex_extensionByZero`: For `j : 𝔾_m → ℙ¹`, `j_!ℚ̄_ℓ` is mixed of weights `≤ 0` but not pure: `RΓ(ℙ¹, j_!ℚ̄_ℓ) = RΓ_c(𝔾_m)` has `H¹` of weight `0 ≠ 1`.

- `isPureComplex_zero`: The zero complex is pure of every weight.

*Needs:* [8.1](#target-8-1), [EtaleCohomologyFoundations §F.5 (exceptional inverse image and Verdier duality)](#input-e15), [EtaleCohomologyFoundations §§F.5–F.6 (smooth purity and Poincaré duality)](#input-e16), [8.5](#target-8-5).

(Sources: [WII](#ref-wii), §6, Définition (6.2.4), p. 247; [WII](#ref-wii), §6, (6.2.1), p. 247.)

<a id="target-8-3"></a>

### 8.3. Generic mixedness of `R^i f_*` over a base of finite type over `ℤ[1/ℓ]`

Let `S` be a scheme of finite type over `ℤ[1/ℓ]`, `f : X → Y` a morphism of `S`-schemes of finite type, and `ℱ` a mixed sheaf on `X`. Then there is a dense open `U ⊂ S` over which all the sheaves `R^i f_*ℱ` are mixed.

*Needs:* [7.8](#target-7-8), [7.1](#target-7-1), [EtaleCohomologyFoundations §§F.0–F.4 (constructible derived coefficients, base change and finiteness)](#input-e12), [EtaleCohomologyFoundations §§F.5–F.6 (smooth purity and Poincaré duality)](#input-e16), [EtaleCohomologyFoundations §§F.0–F.4, F.10.1–F.10.5 and InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4 (finite cohomology, base change and geometric trace formulas)](#input-e49), [8.1](#target-8-1), [7.4](#target-7-4).

(Sources: [WII](#ref-wii), §6, Lemme (6.1.3), p. 244.)

<a id="target-8-4"></a>

### 8.4. `R^i f_*` of a mixed sheaf is mixed

Let `f : X → Y` be a morphism of schemes of finite type over `𝔽_p` (Weil sheaves), or of finite type over `ℤ[1/ℓ]` in the context of Weil II (6.1.1) `b`) (after inverting finitely many primes), and `ℱ` a mixed sheaf on `X`. Then every `R^i f_*ℱ` is mixed.

*Needs:* [8.3](#target-8-3), [7.8](#target-7-8), [7.4](#target-7-4), [EtaleCohomologyFoundations §§F.0–F.4 (constructible derived coefficients, base change and finiteness)](#input-e12).

(Sources: [WII](#ref-wii), §6, Théorème (6.1.2), p. 243; [WII](#ref-wii), §6, after (6.1.2), p. 243.)

<a id="target-8-5"></a>

### 8.5. Stability of mixed complexes under the six operations and duality

Let `f : X → Y` be a morphism of schemes of finite type over `𝔽_p` (Weil sheaves), or in context (6.1.1) `b`). Then `Rf_*`, `Rf_!`, `f*` and `Rf^!` carry `D^b_m` to `D^b_m`; so do `⊗`, the local `RHom` (and the local `ℰxt^i`), and the duality functor `D`. In particular the dualizing complex `K_X = Ra^!ℚ̄_ℓ` is mixed, and `D^b_m(X)` is stable under all the operations of EtaleCohomologyFoundations §§F.0–F.5.

*Needs:* [8.4](#target-8-4), [7.8](#target-7-8), [7.1](#target-7-1), [EtaleCohomologyFoundations §§F.0–F.4 (constructible derived coefficients, base change and finiteness)](#input-e12), [EtaleCohomologyFoundations §F.5 (exceptional inverse image and Verdier duality)](#input-e15), [EtaleCohomologyFoundations §§F.5–F.6 (smooth purity and Poincaré duality)](#input-e16), [8.1](#target-8-1).

(Sources: [WII](#ref-wii), §6, Corollaire (6.1.11), p. 246.)

<a id="target-8-6"></a>

### 8.6. Mixed sheaves on the special fibre with an action of the generic Galois group

Let `S` be a smooth finite-field curve, or a spread model in WII 6.1.1`(b)`, and let `X` be of finite type over its henselian trait at `s`. A Galois sheaf on `X_s̄` has continuous `Gal(η̄/η)` action over the residue action. For unramified action, mixedness means mixedness of the descended sheaf on `X_s`. For unipotent inertia, test the unramified graded pieces of a finite Galois subsheaf filtration. For quasi-unipotent inertia, first take a finite trait extension. Prove independence of the filtration and extension, with the stability operations below. The equal-characteristic trait scope and the stated spread-model context are retained.

Its API includes:
- `IsMixedGalois`: `IsMixedGalois (𝒢, ρ)` : `Prop`, defined by (a)–`(c)`.

- `isMixedGalois_of_unramified`: If `ρ` factors through `Gal(s̄/s)`, `IsMixedGalois (𝒢, ρ) ↔ IsMixed` of the corresponding sheaf on `X_s`.

- `isMixedGalois_iff_filtration`: In the unipotent case, mixedness may be tested on any filtration `F` with unramified graded pieces.

- `isMixedGalois_changeOfTrait`: Invariant under finite extension of the trait.

- `IsMixedGalois.subquotient`: Stable under Galois subsheaves, quotients and extensions.

- `IsMixedGalois.tensor`: Stable under tensor products.

- `IsMixedGalois.invariants`: If `(𝒢, ρ)` is mixed then so is its subsheaf of I-invariants, a sheaf on `X_s`.

#### Checks
- `isMixedGalois_trivial`: For `X = S` and `𝒢 = ℚ̄_ℓ` with trivial action of the entire generic Galois group, `(𝒢, ρ)` is mixed of weight `0` (case (a)).

- The unramified Tate line `ℚ̄_ℓ(−1)` has trivial inertia and Frobenius scalar
  `q`, hence weight `2`. Trivial inertia alone does not specify the arithmetic weight.

- `isMixedGalois_tate_curve`: For the Tate elliptic curve over `𝔽_q((t))` (split multiplicative reduction), `H¹(E_η̄, ℚ̄_ℓ)` with its unipotent inertia action has the filtration `ℚ̄_ℓ ⊂ H¹` with graded pieces `ℚ̄_ℓ` (weight `0`) and `ℚ̄_ℓ(−1)` (weight `2`): mixed, case (b).

- `isMixedGalois_quadratic_twist`: A quadratic character of `I` (tamely ramified, `p ≠ 2`) becomes trivial after a degree-`2` extension of the trait: case (c) applies.

- `isMixedGalois_zero`: The zero Galois sheaf is mixed.

- `not_isMixedGalois_transcendental`: For a rank-one unramified Galois sheaf on `X_s̄ = Spec s̄`, if Frobenius acts on its one-dimensional stalk by a transcendental `ℓ`-adic unit, the sheaf is not mixed. A nontrivial finite tame quadratic character instead has zero inertia invariants and is mixed.

*Needs:* [LefschetzPencilsAndVanishingCycles §0.5 (derived nearby cycles and the vanishing triangle)](#input-e30), [LefschetzPencilsAndVanishingCycles §§1.1–1.6 (inertia, monodromy and relative filtrations)](#input-e31), [7.1](#target-7-1), [0.12](#target-0-12).

(Sources: [WII](#ref-wii), §6, (6.1.12), p. 246.)

<a id="target-8-7"></a>

### 8.7. Nearby cycles of a mixed sheaf are mixed

In the setting of DWP.8/mixed-sheaves-with-galois-action-on-the-special-fibre, let `ℱ` be a mixed sheaf on `X` (`X` of finite type over `S`). Then the sheaves of nearby cycles `R^iΨ(ℱ)` on `X_s̄`, with their action of `Gal(η̄/η)`, are mixed for every `i`.

*Needs:* [8.6](#target-8-6), [8.5](#target-8-5), [LefschetzPencilsAndVanishingCycles §0.5 (derived nearby cycles and the vanishing triangle)](#input-e30), [LefschetzPencilsAndVanishingCycles §§0.6–0.8 (specialization and nearby-cycle functoriality)](#input-e29), [LefschetzPencilsAndVanishingCycles §§1.1–1.6 (inertia, monodromy and relative filtrations)](#input-e31), [5.12](#target-5-12).

(Sources: [WII](#ref-wii), §6, Théorème (6.1.13), p. 246.)

<a id="target-8-8"></a>

### 8.8. `Rf_!` preserves complexes of weights `≤ w`

Let `f : X₀ → Y₀` be a morphism of schemes of finite type over `𝔽_q`. If `K ∈ D^b_c(X₀)` is mixed of weights `≤ w`, then `Rf_!K` is mixed of weights `≤ w`. The `ι`-variant holds with `w ∈ ℝ`.

Require `f` separated and of finite type for `Rf_!`.

*Needs:* [7.8](#target-7-8), [7.9](#target-7-9), [8.1](#target-8-1), [EtaleCohomologyFoundations §§F.0–F.4 (constructible derived coefficients, base change and finiteness)](#input-e12).

(Sources: [WII](#ref-wii), §6, Variante (6.2.3), p. 247.)

<a id="target-8-9"></a>

### 8.9. Purity on a smooth scheme is pointwise purity of lisse cohomology sheaves

Let `X₀` be of finite type over `𝔽_q`. (a) For every `N ∈ ℤ`, `K` is mixed of weights `≤ w` iff `K(N)[2N]` is; hence in the definition of purity the dualizing complex may be replaced by any complex locally isomorphic to `K_{X₀}(N)[2N]`. (b) If `X₀` is smooth, `K` has weights `≥ w` iff `RHom(K, ℚ̄_ℓ)` has weights `≤ −w`. If moreover every `ℋ^iK` is lisse, `K` is pure of weight `w` iff every `ℋ^iK` is punctually pure of weight `w + i`. (c) Consequently, for `X₀` smooth and `ℱ₀` lisse and punctually pure of weight `w`, the complex `ℱ₀[m](r)` is pure of weight `w + m − 2r`. The `ι`-variants hold.

*Needs:* [8.2](#target-8-2), [8.1](#target-8-1), [EtaleCohomologyFoundations §F.5 (exceptional inverse image and Verdier duality)](#input-e15), [EtaleCohomologyFoundations §§F.5–F.6 (smooth purity and Poincaré duality)](#input-e16), [0.13](#target-0-13), [7.1](#target-7-1).

(Sources: [WII](#ref-wii), §6, Exemples (6.2.5) a), b), p. 247.)

<a id="target-8-10"></a>

### 8.10. `j_*` of a pure lisse sheaf across a smooth divisor is pure

(c) Let `X₀` be a smooth curve over `𝔽_q`, `j : U₀ → X₀` a dense open and `ℱ₀` a lisse sheaf on `U₀`, punctually pure of weight `w` (equivalently, by DWP.8`/twist`-shift-and-smooth-lisse-purity-`6`-`2`-`5`, `ℱ₀` is pure of weight `w` as a sheaf). Then `j_*ℱ₀` is pure of weight `w`. (d) Let `X₀` be smooth, `D₀ ⊂ X₀` a smooth divisor, `j : U₀ = X₀ − D₀ → X₀`, and `ℱ₀` lisse on `U₀`, punctually pure of weight `w` and tamely ramified along `D₀`. Then `j_*ℱ₀` is pure of weight `w`. The `ι`-variants hold.

Use the underived `j_*` placed in degree zero, with lisse source sheaf.

*Needs:* [8.2](#target-8-2), [8.9](#target-8-9), [5.11](#target-5-11), [5.12](#target-5-12), [EtaleCohomologyFoundations §F.5 (exceptional inverse image and Verdier duality)](#input-e15), [EtaleCohomologyFoundations §§F.5–F.6 (smooth purity and Poincaré duality)](#input-e16).

(Sources: [WII](#ref-wii), §6, Exemples (6.2.5) c), p. 248.)

<a id="target-8-11"></a>

### 8.11. Weight estimates for the six operations

Let `f : X₀ → Y₀` be a morphism of schemes of finite type over `𝔽_q`, and `a`, `b`, `w ∈ ℤ`. (i) `f*` and `Rf_!` carry complexes of weights `≤ w` to complexes of weights `≤ w`. (ii) `Rf_*` and `Rf^!` carry complexes of weights `≥ w` to complexes of weights `≥ w`. (iii) `D` exchanges 'weights `≤ w`' and 'weights `≥ −w`'. (iv) If `K` has weights `≤ a` and `L` has weights `≤ b`, then `K ⊗ L` has weights `≤ a + b`. (v) If `K` has weights `≤ a` and `L` has weights `≥ b`, then `RHom(K, L)` has weights `≥ b − a`. The `ι`-variants hold with real weights. No other preservation is asserted: `Rf_*` and `Rf^!` need not preserve upper bounds, `f*` and `Rf_!` need not preserve lower bounds, and a pure complex need not split into its cohomology sheaves.

Require separated finite-type `f` for the compact-support operations. Each functor has the displayed direction of bound.

*Needs:* [8.8](#target-8-8), [8.2](#target-8-2), [8.5](#target-8-5), [EtaleCohomologyFoundations §§F.0–F.4 (constructible derived coefficients, base change and finiteness)](#input-e12), [EtaleCohomologyFoundations §F.5 (exceptional inverse image and Verdier duality)](#input-e15), [0.3](#target-0-3), [7.1](#target-7-1).

(Sources: [WII](#ref-wii), §6, (6.2.1), p. 247.)

<a id="target-8-12"></a>

### 8.12. Proper direct images of pure complexes are pure

Let `f : X₀ → Y₀` be a proper morphism of schemes of finite type over `𝔽_q` and `K ∈ D^b_c(X₀)` pure of weight `w`. Then `Rf_*K` is pure of weight `w`. In particular, for `X₀` proper over `𝔽_q` and `K` pure of weight `w`, `H^i(X, K)` is pure of weight `w + i` for every `i`. The `ι`-variant holds.

*Needs:* [8.8](#target-8-8), [8.2](#target-8-2), [EtaleCohomologyFoundations §F.5 (exceptional inverse image and Verdier duality)](#input-e15).

(Sources: [WII](#ref-wii), §6, Proposition (6.2.6), p. 248.)

<a id="target-8-13"></a>

### 8.13. Pure complexes over `ℤ[1/ℓ]`

For `X` of finite type over `ℤ[1/ℓ]` with structure map a : `X → Spec ℤ[1/ℓ]`, put `K′_X = Ra^!ℚ̄_ℓ` and `D′ = RHom(−, K′_X)`. Call `K ∈ D^b_c(X)` pure of weight `w` when `K` is mixed of weights `≤ w` (DWP.8/mixed-complexes, read on schemes of finite type over `ℤ[1/ℓ]`) and `D′K` is mixed of weights `≤ −w`. If `X` is of finite type over `𝔽_p` then `K′_X = K_X(−1)[−2]`, so `D′ = D(−1)[−2]` and this notion agrees with that of DWP.8/pure-complexes. Proper direct images preserve this purity: for `f : X → Y` proper over `ℤ[1/ℓ]` and `K` pure of weight `w`, `Rf_*K` is pure of weight `w`.

*Needs:* [8.2](#target-8-2), [8.9](#target-8-9), [8.8](#target-8-8), [7.8](#target-7-8), [EtaleCohomologyFoundations §F.5 (exceptional inverse image and Verdier duality)](#input-e15), [EtaleCohomologyFoundations §§F.5–F.6 (smooth purity and Poincaré duality)](#input-e16).

(Sources: [WII](#ref-wii), §6, Variante (6.2.7), p. 248.)

<a id="target-8-14"></a>

### 8.14. Geometric monodromy and geometrically semisimple lisse sheaves

For a normal connected finite-field scheme, a lisse finite-model Weil sheaf gives a representation `ρ` on its stalk `V`. Define geometric monodromy as the image of the geometric fundamental group and geometric semisimplicity as semisimplicity of the restricted representation, using `Representation.IsSemisimpleRepresentation`. Arithmetic semisimplicity uses the full Weil representation. For schemes not geometrically connected work on each geometric component. Prove base-point conjugacy, dense-open and finite-base-extension invariance, subquotient/dual stability, and the characteristic-zero reductive-closure criterion specified in the API.

Its API includes:
- For `ρ : Representation E W V` and a subgroup `G ≤ W: IsGeometricallySemisimple ρ G : Prop := Representation.IsSemisimpleRepresentation (ρ.comp G.subtype)`; for a lisse sheaf, `W = W(X₀, x̄)` and `G = π₁(X, x̄)`.

- For a finite-dimensional representation `ρ` over a field and `G` normal in `W: ρ` semisimple `⇒ ρ|G` semisimple, by the pinned Tau Ceti Clifford theorem on each irreducible summand.

- `isGeometricallySemisimple_iff_restrict_open`: For `X₀` normal and `U₀ ⊂ X₀` a dense open: `ℱ₀` is geometrically semisimple iff `ℱ₀|U₀` is (`π₁(U) → π₁(X)` is surjective, `IG`.`0`).

- `isGeometricallySemisimple_baseExtension`: Unchanged by the base extension `𝔽_q → 𝔽_{q^r}` (same geometric fundamental group).

- `IsGeometricallySemisimple.subquotient`: Lisse subsheaves, quotients and direct summands of a geometrically semisimple sheaf are geometrically semisimple; finite direct sums of geometrically semisimple sheaves are.

- `IsGeometricallySemisimple.dual`: The dual of a geometrically semisimple lisse sheaf is geometrically semisimple.

- `maximalGeometricallySemisimpleSubsheaf`: The largest geometrically semisimple lisse subsheaf: on the geometric stalk it is the sum of irreducible geometric subrepresentations, stable under Frobenius and hence descended to `X₀`.

- `isGeometricallySemisimple_iff_reductive`: With algebraically closed characteristic-zero coefficients and finite-dimensional stalk: `ℱ₀` is geometrically semisimple iff the identity component of the Zariski closure of its geometric monodromy group is reductive (tauceti ReductiveGroups layer `6`). The closure acts faithfully; invariant subspaces are unchanged by Zariski closure.

- `geometricMonodromyGroup_conjugate`: An isomorphism of stalk representations conjugates the geometric monodromy image; changing the geometric base point gives this conjugacy, so geometric semisimplicity is independent of the base point.

#### Checks
- On `Spec 𝔽_q` the rank-two Weil sheaf on which `F` acts by `[[1, 1], [0, 1]]` is geometrically semisimple (the geometric group is trivial) but not arithmetically semisimple: purity of weight `0` does not give semisimple Frobenius.

- On `𝔾_m` over `𝔽_q`, the Kummer extension `0 → ℚ̄_ℓ(1) → ℒ → ℚ̄_ℓ → 0` classified by the Kummer class of the coordinate in `H¹(𝔾_m, ℚ̄_ℓ(1))` is not geometrically semisimple: its geometric class in `H¹(𝔾_{m,𝔽̄_q}, ℚ̄_ℓ(1)) ≅ ℚ̄_ℓ` is nonzero.

- Every lisse sheaf on `Spec 𝔽_q` is geometrically semisimple; so is the zero sheaf on any `X₀`.

- For a finite-dimensional representation `ρ` of a group `W` over a field and a normal subgroup `G`, if `ρ` is semisimple then `ρ|G` is semisimple (Clifford), so arithmetic semisimplicity implies geometric semisimplicity.

*Needs:* [EtaleCohomologyFoundations §§F.0–F.4 (constructible derived coefficients, base change and finiteness)](#input-e12), [InverseGaloisAndArithmeticFundamentalGroups §IG.0.3 (local systems) and §IG.5.7 (finite-cover criterion and dense-open surjectivity)](#input-e26), [EtaleCohomologyFoundations §§F.0.A1–F.0.A2 and InverseGaloisAndArithmeticFundamentalGroups §§IG.1.2–IG.1.3 (arithmetic exact sequence, covers and specialization)](#input-e27), [Representation](#input-b30), [Representation.IsSemisimpleRepresentation](#input-b33), [Representation.asModule](#input-b31), [TauCeti.Representation.isSemisimpleRepresentation_comp_subtype](#input-b41), [ReductiveGroups, Layer 6 (reductive and semisimple groups)](#input-e66).

(Sources: [WII](#ref-wii), §1, (1.1.15), p. 153; [WII](#ref-wii), §3, Théorème (3.4.1) (iii), p. 207.)

<a id="target-8-15"></a>

### 8.15. The `Ext¹` sequence of lisse sheaves over a finite field

Let `X₀` be of finite type over `𝔽_q` and `ℱ₀`, `𝒢₀` lisse finite-model Weil
sheaves. Construct the exact sequence
`0 → H⁰(X,ℋom(ℱ,𝒢))_F → Ext¹(ℱ₀,𝒢₀) → H¹(X,ℋom(ℱ,𝒢))^F`.
`Ext¹` is taken in the abelian category of Weil sheaves, where extensions of
lisse sheaves are lisse. The right map forgets descent and uses the geometric
identification `Ext¹(ℱ,𝒢)=H¹(X,ℋom(ℱ,𝒢))`. Construct the left map by the
Frobenius defect of a geometric splitting: changing a splitting by `f` changes
its defect by `(F−1)f`. Conversely each defect defines a Frobenius action on the
split geometric extension, and yields a continuous finite-model Weil sheaf.
This proves exactness directly by descent. On normal geometrically connected
`X₀` it also realizes the low-degree Weil-group sequence with quotient `ℤ`;
ArithmeticGaloisDuality §§R02.2.1–R02.2.2 supplies only its stated
profinite-group, discrete-module version.

**Checks.**

- On `Spec 𝔽_q`, the extension of the trivial line by itself is classified by
  a scalar defect; the nonzero defect gives a unipotent Jordan Frobenius.
- For two point lines with distinct Frobenius scalars, `F−1` is invertible on
  `Hom` and `Ext¹=0`.
- Replacing a geometric splitting by `f` changes the defect by `(F−1)f` and
  leaves its coinvariant class unchanged; a zero class gives a Weil splitting.

*Needs:* §5.2 (Weil descent and finite models), §0.8;
[EtaleCohomologyFoundations §§F.0–F.4 (constructible derived coefficients, base change and finiteness)](#input-e12)
(geometric `Ext`–cohomology and lisse extensions);
[EtaleCohomologyFoundations §§F.0.A1–F.0.A2 and InverseGaloisAndArithmeticFundamentalGroups §§IG.1.2–IG.1.3 (arithmetic exact sequence, covers and specialization)](#input-e27).

(Sources: [WII](#ref-wii), §3, Lemme (3.4.2), p. 208.)

<a id="target-8-16"></a>

### 8.16. Extensions between pure lisse sheaves on a smooth scheme

Let `X₀` be smooth of finite type over `𝔽_q`, `ι : ℚ̄_ℓ ≅ ℂ`, and `ℱ₀`, `𝒢₀` lisse sheaves on `X₀` punctually `ι`-pure of weights `β` and `γ`. (Lemma 3.4.3) A geometrically nontrivial extension `0 → 𝒢₀ → ℰ₀ → ℱ₀ → 0` can exist only if `β ≡ γ (mod ℤ)` and `β > γ`. (Lemma 3.4.4) `Ext¹(ℱ₀, 𝒢₀) ≠ 0` only if `β ≡ γ (mod ℤ)` and `β ≥ γ`.

*Needs:* [8.15](#target-8-15), [7.12](#target-7-12), [7.9](#target-7-9), [0.13](#target-0-13).

(Sources: [WII](#ref-wii), §3, Lemmes (3.4.3)–(3.4.4), p. 208.)

<a id="target-8-17"></a>

### 8.17. The decomposition of an `ι`-mixed sheaf by weights modulo `ℤ`

Let `X₀` be of finite type over `𝔽_q`, `ι : ℚ̄_ℓ ≅ ℂ`, and `ℱ₀` an `ι`-mixed sheaf on `X₀` (Weil sheaves allowed). There is a unique decomposition `ℱ₀ = ⊕_{b ∈ ℝ/ℤ} ℱ₀(b)`, almost all summands zero, such that the punctual `ι`-weights of `ℱ₀(b)` lie in `b`. It is functorial: every morphism `ℱ₀ → 𝒢₀` of `ι`-mixed sheaves maps `ℱ₀(b)` to `𝒢₀(b)`. Each `ℱ₀(b)` is a `twist ℋ₀^{(c)}` (Weil II 1.2.7) of an `ι`-mixed sheaf `ℋ₀` with integer punctual weights, for any `c ∈ ℚ̄_ℓ^×` with `ι`-weight in `b`. Stalkwise, for `x ∈ |X₀|: ℱ₀(b)_x̄ = ⊕_{β ∈ b} ℱ_x̄(β)`, where `ℱ_x̄(β)` is the sum of the generalised eigenspaces of `F_x` for the eigenvalues of `ι`-weight `β` relative to `N(x)`.

Its API includes:
- `weightClass`: `weightClass ℱ₀ (b : ℝ/ℤ)` : the summand `ℱ₀(b)`, a subsheaf of `ℱ₀`.

- `weightClass_isInternal`: `ℱ₀` is the internal direct sum of the `ℱ₀(b)`, with finitely many nonzero.

- `weightClass_stalk`: `(ℱ₀(b))_x̄ = ⊕_{β ∈ b} ℱ_x̄(β)`, generalised eigenspaces of `F_x`.

- `weightClass_map`: `φ : ℱ₀ → 𝒢₀` maps `ℱ₀(b)` into `𝒢₀(b)`; `weightClass` is an exact functor; `map_id` and `map_comp` hold.

- `weightClass_unique`: Any decomposition `ℱ₀ = ⊕ 𝒜(b)` with the weights of `𝒜(b)` in `b` equals the weight-class decomposition.

- `weightClass_eq_twist`: `ℱ₀(b) ≅ ℋ₀^{(c)}` with `ℋ₀` of integer `ι`-weights, for any `c` of `ι`-weight in `b`.

- `weightClass_of_integer`: If all punctual `ι`-weights of `ℱ₀` are integers then `ℱ₀(0) = ℱ₀`.

- `weightClass_tensor`: `(ℱ₀ ⊗ 𝒢₀)(b) = ⊕_{b′ + b″ = b} ℱ₀(b′) ⊗ 𝒢₀(b″)`.

#### Checks
- `weightClass_fractional`: On `Spec 𝔽_q` with `ι` fixed and a chosen fourth root `q^{1/4}`, `ℚ̄_ℓ ⊕ ℚ̄_ℓ^{(q^{1/4})}` has nonzero classes exactly `0` and `1/2 mod ℤ`.

- `weightClass_integral`: `ℚ̄_ℓ ⊕ ℚ̄_ℓ(1)` on `Spec 𝔽_q` has all of its weight in the class `0`: the decomposition is by weight modulo `ℤ`, not by weight.

- `weightClass_depends_on_iota`: For `b = 1 + √2` (an `ℓ`-adic unit, of norm `−1`), `ℚ̄_ℓ^{(b)}` on `Spec 𝔽_q` has `ι`-weight `2 log_q(1 + √2)` or `−2 log_q(1 + √2)` according to `ι(√2) = ±√2`: the class depends on `ι`.

- `weightClass_zero`: The zero sheaf has all classes zero.

- `weightClass_point`: On `Spec 𝔽_q`, `ℱ₀(b)` is the sum of the generalised eigenspaces of `F` whose `ι`-weights lie in `b`, `i`.`e`. DWP.0's decomposition (ii) regrouped modulo `ℤ`.

*Needs:* [8.16](#target-8-16), [0.18](#target-0-18), [0.17](#target-0-17), [0.15](#target-0-15), [5.12](#target-5-12), [7.1](#target-7-1), [EtaleCohomologyFoundations §§F.0–F.4 (constructible derived coefficients, base change and finiteness)](#input-e12).

(Sources: [WII](#ref-wii), §3, Théorème (3.4.1) (i), p. 207; [WII](#ref-wii), §3, (3.4.6), p. 209.)

<a id="target-8-18"></a>

### 8.18. The weight filtration of a lisse mixed sheaf

Let `X₀` be of finite type over `𝔽_q`, `ι : ℚ̄_ℓ ≅ ℂ`, and `ℱ₀` a lisse `ι`-mixed sheaf on `X₀` whose punctual `ι`-weights are integers. There is a unique finite increasing filtration `W` of `ℱ₀` by lisse subsheaves `W_iℱ₀` (the filtration by punctual weight) such that `Gr^W_i ℱ₀` is punctually `ι`-pure of weight `i` for every `i`. It is functorial, and every morphism between lisse `ι`-mixed sheaves with integer punctual weights is strictly compatible with the weight filtrations. Stalkwise `(W_iℱ₀)_x̄ = ⊕_{β ≤ i} ℱ_x̄(β)`. For a lisse mixed sheaf (integer weights at every `ι`) the filtration does not depend on `ι` (Weil II 3.4.9).

The unique strict weight filtration need not split as a lisse sheaf.

Its API includes:
- `weightFiltration`: `weightFiltration ℱ₀ : ℤ →` lisse subsheaves of `ℱ₀`, `i ↦ W_iℱ₀`, monotone, `W_i = 0` for `i ≪ 0` and `= ℱ₀` for `i ≫ 0`.

- `weightFiltration_gr_pure`: `Gr^W_i ℱ₀` is lisse and punctually `ι`-pure of weight `i`.

- `weightFiltration_unique`: Any finite increasing filtration by lisse subsheaves with `Gr_i` punctually `ι`-pure of weight `i` equals `W`.

- `weightFiltration_stalk`: `(W_iℱ₀)_x̄ = ⊕_{β ≤ i} ℱ_x̄(β)`.

- `weightFiltration_map`: `φ(W_iℱ₀) ⊆ W_i𝒢₀`, with `map_id` and `map_comp` for the induced maps on `Gr^W`.

- `weightFiltration_strict`: `φ(W_iℱ₀) = φ(ℱ₀) ∩ W_i𝒢₀`; hence `Gr^W` is an exact functor.

- `weightFiltration_tensor`: `W_k(ℱ₀ ⊗ 𝒢₀) = Σ_{i+j=k} W_iℱ₀ ⊗ W_j𝒢₀`.

- `weightFiltration_dual`: `W_i(ℱ₀^∨) = (ℱ₀ / W_{−i−1}ℱ₀)^∨`.

- `weightFiltration_pullback`: `g*W_iℱ₀ = W_i(g*ℱ₀)` for `g : Y₀ → X₀`.

- `weightFiltration_twist`: `W_i(ℱ₀(r)) = (W_{i+2r}ℱ₀)(r)`.

- `weightFiltration_indep_iota`: For lisse mixed `ℱ₀` (integer weights for every `ι`), `W` does not depend on `ι`.

#### Checks
- `weightFiltration_kummer`: For the Kummer extension `0 → ℚ̄_ℓ(1) → ℒ → ℚ̄_ℓ → 0` on `𝔾_m` over `𝔽_q: W_{−3} = 0`, `W_{−2} = W_{−1} = ℚ̄_ℓ(1)`, `W_0 = ℒ`.

- `weightFiltration_pure`: For `ℱ₀` punctually pure of weight `n: W_{n−1} = 0` and `W_n = ℱ₀`.

- `weightFiltration_not_split`: The Kummer extension `ℒ` is not isomorphic to `Gr^W ℒ = ℚ̄_ℓ(1) ⊕ ℚ̄_ℓ`: the weight filtration is not a grading on the sheaf.

- `weightFiltration_point`: On `Spec 𝔽_q`, `W_iV` is the sum of the generalised eigenspaces of `F` of weight `≤ i`; for the Jordan block `[[q, 1], [0, q]]`, `W_1 = 0` and `W_2 = V`.

- `weightFiltration_strict_example`: The inclusion `ℚ̄_ℓ(1) → ℒ` is strict: its image meets `W_{−2}ℒ` in the whole image, and `W_{−1}` of the cokernel `ℚ̄_ℓ` is `0`.

*Needs:* [8.16](#target-8-16), [8.17](#target-8-17), [0.18](#target-0-18), [0.6](#target-0-6), [5.12](#target-5-12), [EtaleCohomologyFoundations §§F.0–F.4 (constructible derived coefficients, base change and finiteness)](#input-e12).

(Sources: [WII](#ref-wii), §3, Théorème (3.4.1) (ii), p. 207; [WII](#ref-wii), §3, Variante (3.4.9), p. 210.)

<a id="target-8-19"></a>

### 8.19. Deligne's semisimplicity theorem: pure lisse sheaves are geometrically semisimple

On a normal finite-type `𝔽_q`-scheme, a lisse sheaf punctually pure of real weight `β` for one fixed `ι` becomes semisimple after extension to `𝔽̄_q`. This includes integer-pure lisse sheaves. The conclusion is geometric semisimplicity.

*Needs:* [8.16](#target-8-16), [8.14](#target-8-14), [InverseGaloisAndArithmeticFundamentalGroups §IG.0.3 (local systems) and §IG.5.7 (finite-cover criterion and dense-open surjectivity)](#input-e26), [EtaleCohomologyFoundations §§F.0–F.4 (constructible derived coefficients, base change and finiteness)](#input-e12).

(Sources: [WII](#ref-wii), §3, Théorème (3.4.1) (iii), p. 207; [WII](#ref-wii), §3, (3.4.5), p. 208.)

<a id="target-8-20"></a>

### 8.20. Sheaves and complexes potentially having a property `P`

Let `X` be a separated scheme of finite type over an algebraically closed field `k` with `ℓ` invertible in `k`. These hypotheses apply to the API and Checks below. For an isomorphism-invariant property `P` of finite-field sheaves or complexes, `PotentiallyHas P` on `X/k` requires an explicit model: integral `S` of finite type over `ℤ[1/ℓ]`, a point `Spec k→S`, finite-type `X_S`, a sheaf or bounded constructible complex on `X_S`, and an identification of its fibre with the given object. Every closed fibre over `S` must satisfy `P`. This is the fibrewise-property interface of Weil II (3.4.10). Applied to complex purity with duality over each finite residue field, it is distinct from `PotentiallyPureComplex` below. The API transports these witnesses and states the extra stability and common-refinement hypotheses for sums, pullbacks and field extensions.

Require `P` invariant under isomorphism. Finite-sum and base-extension stability are hypotheses of the corresponding operations, together with the stated witness/refinement conditions.

Its API includes:
- `ArithmeticModel`: The data (`S`, `x̄`, `X_S`, `ℱ_S` or `K_S`, iso) of a model of `(X, ℱ)` over an integral `S` of finite type over `ℤ[1/ℓ]`.

- `PotentiallyHas`: `PotentiallyHas P ℱ : Prop := ∃ M : ArithmeticModel X ℱ`, `∀ s ∈ |M`.`S|`, `P (M.ℱ_S|X_s)`.

- `PotentiallyHas.mono`: `(∀ ℱ, P ℱ → Q ℱ) → PotentiallyHas P ℱ → PotentiallyHas Q ℱ`.

- `ArithmeticModel.restrict`: Restrict a model to a dense open of `S` containing the image of `x̄`; the fibrewise property is inherited.

- `PotentiallyHas.pullback`: If `g : Y → X` spreads out over a model, then `g*ℱ` is potentially `P` whenever `ℱ` is and `P` is stable under pullback.

- `PotentiallyHas.directSum`: If the supplied arithmetic witnesses admit a common refinement and `P` is stable under finite direct sums and finite extensions of finite ground fields, their finite direct sum is potentially `P`. Pull the witnesses to this common model, use finite-field-extension stability on its closed fibres, and take the direct sum there. A common refinement of arbitrary `ℓ`-adic sheaf models is not silently asserted.

- `potentially_baseChange_algClosed`: For an extension `k ⊂ k′` of algebraically closed fields, `PotentiallyHas P ℱ` implies `PotentiallyHas P ℱ_{k′}`, using the same model and composing `x̄` with `Spec k′ → Spec k`. The converse requires a witnessing model over `k′` whose base-point map and fibre identification descend to `k`; no unconditional converse for arbitrary `P` is asserted.

- `PotentiallyHas.of_iso`: For `P` invariant under isomorphism, an isomorphism of `(X,ℱ)` with `(X′,ℱ′)` transports an `ArithmeticModel` and gives `PotentiallyHas P ℱ ↔ PotentiallyHas P ℱ′`.

#### Checks
- `potentiallyPure_const_smooth`: For `X` smooth over `k` algebraically closed,
  `ℚ̄_ℓ[0]` has `PotentiallyHas` fibrewise complex purity of weight `0`: spread
  `X` out smoothly and apply §8.9 on each closed fibre. For projective `X`, the
  smooth/lisse comparison below also gives `PotentiallyPureComplex 0 ℚ̄_ℓ`.

- `potentially_of_finite_field`: Over `k = 𝔽̄_q`, a sheaf `ℱ₀` on `X₀/𝔽_q` with property `P` is potentially `P` with model `S = Spec 𝔽_q`.

- `not_potentiallyPure_kummer`: The Kummer extension `ℒ` on `𝔾_m` over `ℂ` (a nonsplit unipotent local system of rank two) is potentially mixed but not potentially punctually `ι`-pure: otherwise it would be semisimple by DWP.8/potentially-pure-lisse-sheaves-are-semisimple-`3`-`4`-`12`.

- `potentially_zero`: The zero sheaf is potentially `P` for every `P` satisfied by zero sheaves: choose a finite-type model of `X` and the zero sheaf on the entire model. For `X=Spec ℚ̄` and `S=Spec ℤ[1/ℓ]`, the sheaf `i_(p)*ℚ̄_ℓ` with `p≠ℓ` has
  zero `ℚ̄`-fibre and nonzero `p`-fibre; that model does not witness `P=(being zero)`.

- `Spec ℂ(t)` is separated and Noetherian but not of finite type over `ℂ`. It cannot be a fibre of a finite-type arithmetic model, since finite type is preserved by base change; it is outside the zero-sheaf assertion's hypotheses.

*Needs:* [8.2](#target-8-2), [8.1](#target-8-1), [7.1](#target-7-1), [SchemeAndStackFoundations §0.9 and LefschetzPencilsAndVanishingCycles §§7b.3, 7b.7 (Noetherian approximation and arithmetic models)](#input-e8).

(Sources: [WII](#ref-wii), §3, (3.4.10), p. 210.)

**Arithmetic potential purity of complexes** (`PotentiallyPureComplex`). For
projective `X/k` and `K∈D^b_c(X,ℚ̄_ℓ)`, define `PotentiallyPureComplex w K`
by existence of an `InvariantCycles.GeometricGenericArithmeticModel X K`
from LefschetzPencilsAndVanishingCycles §7b.7 whose total complex `K₀` is
pure of weight `w` in §8.13's arithmetic sense. Thus `Spec k→S₀` lies over the
generic point of the integral arithmetic base, the family `X₀→S₀` is proper,
and both fibre identifications are part of the witness. The arithmetic dual is
`D′=RHom(−,Ra^!ℚ̄_ℓ)` for `a:X₀→Spec ℤ[1/ℓ]`, not fibrewise duality over
closed residue fields. Use integer weights, and also the fixed-`ι` variant with
real weights. Potential purity without a specified weight means existence of
such a weight and witness. `PotentiallyPureComplex.shiftTwist` gives weight
`w+a−2b` for `K[a](b)`; `PotentiallyPureComplex.of_iso` transports the family
and realization through compatible isomorphisms, using the supplier's model API.

*Needs:* §8.13; §8.2; LefschetzPencilsAndVanishingCycles §7b.7 / `InvariantCycles.GeometricGenericArithmeticModel`.
(Source: [WII](#ref-wii), (6.2.7)–(6.2.8)(a)–(d), p. 248.)

**Checks.**

- For `S₀=ℙ¹/𝔽_q`, `X₀=S₀` over itself and
  `K₀=j_!ℚ̄_ℓ`, `j:𝔾_m↪ℙ¹`, every closed fibre is zero or a pure line of
  weight zero. But `H¹(ℙ¹_𝔽̄_q,K₀)=ℚ̄_ℓ` has weight zero, so §8.12 excludes
  arithmetic purity of weight zero for this total complex. The same witness
  cannot serve `PotentiallyPureComplex`. Shrinking to `𝔾_m` gives a pure model
  of its geometric generic fibre, the pure line on a point.
- A parameter map landing in a proper closed subset of `S₀` fails this
  geometric-generic model condition, even for a constant sheaf; restricting to
  dense opens containing that point does not change its image closure.
- A pure finite-field complex uses `S₀=Spec 𝔽_q`; arithmetic and finite-field
  purity agree by §8.13. Shifts and twists change its weight by `a−2b`, and the
  zero complex admits every weight.

**Smooth/lisse model comparison** (`PotentiallyPureComplex.of_lisse`). Let
`X/k` be smooth projective of pure dimension `n`, `L` a specified very ample
line bundle, and `ℱ` lisse with a `PotentiallyHas` witness for punctual purity
of weight `w`. Construct a geometric-generic model, spreading `L` to a projective
embedding, whose total lisse sheaf is arithmetically pure of weight `w`.
Consequently `PotentiallyPureComplex w (ℱ[0])` holds. The same assertion holds
for fixed-`ι` punctual purity and real `w`.

Replace the original base by the reduced closure of the image of `Spec k`.
Allow a finite-type integral refinement to spread the specified embedding and
its fibre identification; closed fibres pull back through finite extensions of
finite residue fields, preserving punctual purity. The point is now geometric
generic, so shrinking retains it. Descend smoothness, projectivity and lissity
from the geometric generic fibre; properness removes the vertical non-lisse
locus after shrinking. Shrink the base to be smooth over a finite field in
positive characteristic, or over an open of `Spec ℤ[1/ℓ]` in characteristic
zero. On each nonempty connected component of the resulting total space,
put `δ=dim X₀−1`. Smooth purity and §8.13 give
`D′ℱ₀≅ℱ₀∨(δ)[2δ]`. All closed total-space stalks have weight `w`, and the
dual stalks have weight `−w`; the twist subtracts `2δ` and the shift adds `2δ`.
Thus both arithmetic bounds hold, including mixedness of `ℱ₀` and `D′ℱ₀`.
Over a closed finite-field fibre of dimension `n`, the relative dual is instead
`ℱ_s∨(n)[2n]`; the difference is a twist by `δ−n` and a shift by `2(δ−n)`,
which together preserve complex weight. No such comparison is asserted
for arbitrary constructible complexes or arbitrary unchanged witnesses.

*Needs:* §8.9; §8.13; `PotentiallyHas`; SchemeAndStackFoundations §0.9 (spreading geometry and embeddings); EtaleCohomologyFoundations §§F.0–F.4 (constructibility and descent of lissity), F.5–F.6 (duality and smooth purity); LefschetzPencilsAndVanishingCycles §7b.7 (geometric-generic model carrier).
(Sources: [WII](#ref-wii), (3.4.10)–(3.4.11), p. 210; (6.2.5)(a)–(b), pp. 247–248; (6.2.7)–(6.2.8), p. 248.)

**Checks.**

- For `X=ℙⁿ_ℚ̄` with the constant sheaf, a smooth model over an open of
  `Spec ℤ[1/ℓ]` has `δ=n`, so `D′ℚ̄_ℓ=ℚ̄_ℓ(n)[2n]` has weight zero.
- For `X=ℙⁿ_𝔽̄_p` modeled over `Spec 𝔽_p`, `δ=n−1`; arithmetic duality is
  `ℚ̄_ℓ(n−1)[2n−2]`, while finite-field duality is `ℚ̄_ℓ(n)[2n]`. Both
  have weight zero, including `n=0`.
- A constant model over an arithmetic surface with base point over a closed
  finite-field point requires replacement by that point's reduced closure
  before shrinking. The resulting smooth model gives the required weight-zero
  witness. The rank-jumping `j_!ℚ̄_ℓ` family above is not lisse on the total
  base; its geometric generic fibre becomes lisse only after removing the boundary.

<a id="target-8-21"></a>

### 8.21. `R^i f_*ℚ_ℓ` of a proper smooth morphism is potentially punctually pure

Let `k` be algebraically closed with `ℓ` invertible, `X` of finite type over `k`, and `f : Y → X` proper and smooth. Then for every `i` the lisse sheaf `R^i f_*ℚ_ℓ` is potentially punctually pure of weight `i`: there is a model `f_S : Y_S → X_S` over an integral `S` of finite type over `ℤ[1/ℓ]`, with `f_S` proper and smooth, and for every closed point `s` of `S` the sheaf `R^i f_{s*}ℚ_ℓ` on `X_s` is lisse and punctually pure of weight `i`.

*Needs:* [8.20](#target-8-20), [7.15](#target-7-15), [SchemeAndStackFoundations §0.9 and LefschetzPencilsAndVanishingCycles §§7b.3, 7b.7 (Noetherian approximation and arithmetic models)](#input-e8), [EtaleCohomologyFoundations §§F.0–F.4, F.10.1–F.10.5 and InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4 (finite cohomology, base change and geometric trace formulas)](#input-e49).

(Sources: [WII](#ref-wii), §3, Exemple (3.4.11), p. 210.)

<a id="target-8-22"></a>

### 8.22. Potentially pure lisse sheaves on a normal variety are semisimple

Let `k` be algebraically closed with `ℓ` invertible, `X` a normal scheme of finite type over `k`, and `ℱ` a lisse sheaf on `X` which is potentially punctually `ι`-pure (DWP.8/potentially-property-`p`-`3`-`4`-`10`). Then `ℱ` is semisimple.

*Needs:* [8.20](#target-8-20), [8.19](#target-8-19), [8.14](#target-8-14), [5.15](#target-5-15), [SchemeAndStackFoundations §0.9 and LefschetzPencilsAndVanishingCycles §§7b.3, 7b.7 (Noetherian approximation and arithmetic models)](#input-e8).

(Sources: [WII](#ref-wii), §3, Corollaire (3.4.12), p. 210.)

<a id="target-8-23"></a>

### 8.23. Semisimplicity of `R^i f_*ℚ_ℓ` for a proper smooth family

Let `k` be algebraically closed with `ℓ` invertible, `S` a normal connected scheme of finite type over `k`, and `f : X → S` proper and smooth. Then for every `i` the lisse sheaf `R^i f_*ℚ_ℓ` on `S` is semisimple, `i`.`e`. `H^i(X_s̄, ℚ_ℓ)` is a semisimple representation of `π₁(S, s̄)`.

*Needs:* [8.21](#target-8-21), [8.22](#target-8-22), [EtaleCohomologyFoundations §§F.0–F.4, F.10.1–F.10.5 and InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4 (finite cohomology, base change and geometric trace formulas)](#input-e49).

(Sources: [WII](#ref-wii), §3, Corollaire (3.4.13), p. 210; [WII](#ref-wii), §3, Remarque (3.4.14), p. 210.)

<a id="target-8-24"></a>

### 8.24. The weight spectral sequence of a normal crossings compactification

Let `X₀` be a smooth proper scheme of pure dimension `d` over `𝔽_q`, `D₀ ⊂ X₀` a divisor with normal crossings, `U₀ = X₀ − D₀` and `j : U₀ → X₀`. For `m ≥ 1` let `ν_m : D^{(m)}₀ → X₀` be the normalisation of the locus of points lying on at least `m` local branches of `D₀` (étale locally the disjoint union of the `m`-fold intersections of the branches), `D^{(0)}₀ = X₀`, and `ε_m` the rank-one orientation sheaf on `D^{(m)}₀`, the determinant of the permutation representation on the `m` local branches. Then there is a spectral sequence of Frobenius modules `E₁^{m,k} = H^k(D^{(m)}, ε_m) ⇒ H^{m+k}_c(U, ℚ_ℓ)`, whose `d₁` is the alternating sum of the restriction maps; `E₁^{m,k}` is pure of weight `k`, the sequence degenerates at `E₂`, and `E₂^{m,k} = Gr^W_k H^{m+k}_c(U, ℚ_ℓ)` for the weight filtration of the Frobenius module `H^{m+k}_c(U)`. The same holds for `X₀` a smooth proper Deligne–Mumford stack over `𝔽_q` with a normal crossings divisor, the `D^{(m)}` being smooth proper Deligne–Mumford stacks; for the boundary of `M̄_{g,n}` it reads `E₁^{j,k} = ⊕_{|E(G)| = j} (H^k(∏_v M̄_{g_v,n_v}) ⊗ det E(G))^{Aut(G)}`.

Retain the orientation sheaf even for non-strict normal crossings. The ordinary-cohomology sequence is obtained by duality.

*Needs:* [7.15](#target-7-15), [smooth proper DM purity](#target-dm-purity) below, [0.17](#target-0-17), [0.18](#target-0-18), [EtaleCohomologyFoundations §§F.0–F.4 (constructible derived coefficients, base change and finiteness)](#input-e12), [EtaleCohomologyFoundations §§F.0–F.4, F.10.1–F.10.5 and InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4 (finite cohomology, base change and geometric trace formulas)](#input-e49), [SchemeAndStackFoundations §§1.19–1.20 (Deligne–Mumford stacks) and the coefficient descent target of §8.24 here](#input-e48).

(Sources: [BFP](#ref-bfp), proof of Proposition 4.2, p. 7.)

For the stack clause of §8.24 construct `dmStack_etaleCohomology`: for a
finite-type Deligne–Mumford stack over `𝔽_q` with `ℓ≠p`, construct its rational
constructible étale coefficient category and `Hⁱ_et(X_𝔽̄q,ℚ_ℓ)` by effective étale
descent from scheme atlases, with invariance under atlas refinement, pullback,
Frobenius descent and proper finite-dimensional cohomology. This coefficient
construction precedes the smooth proper DM purity target below, which supplies
the weight input to this spectral sequence. Construct the normalized-stratum
resolution by étale descent from scheme charts: its degree-`m` term is `ν_(m)*ε_m`, and its
alternating restriction differential squares to zero because the determinant
line changes sign under a branch swap. It resolves `j_!ℚ_ℓ`. Descent of cohomology
and the spectral sequence uses SchemeAndStackFoundations §§1.19–1.20 (étale
atlases and stabilizers), EtaleCohomologyFoundations §§F.1–F.4 (coherent
derived diagrams, finite descent and cohomology), and the smooth proper DM
purity target below. These are constructions on the supplied stack
carriers, with rational coefficients; no new stack carrier is introduced.
(Source: [BFP](#ref-bfp), proof of Proposition 4.2, p. 7.)

Its API includes `dmStack_etaleCohomology_atlas` (the atlas descent equivalence),
`dmStack_etaleCohomology_refinement` (independence with composition coherence),
`dmStack_etaleCohomology_pullback`, `dmStack_etaleCohomology_frobenius`, and
`dmStack_etaleCohomology_finite` (finite-dimensional proper rational cohomology).

**Checks.**

- On `Spec 𝔽_q` the constant coefficients have geometric `H⁰=ℚ_ℓ` with Frobenius `1`
  and no higher geometric cohomology; this is the supplied scheme realization.
- On `BC₂` the sign local system has `H⁰=0`, while the constant local system has
  `H⁰=ℚ_ℓ`; rational higher group cohomology vanishes in both cases, even for `ℓ=2`.
  A category containing only coarse-space constant sheaves loses this distinction.
- On the empty stack every cohomology group is zero and atlas refinement yields
  the empty coefficient category's zero object, rather than a spurious constant line.

<a id="target-dm-purity"></a>

**Smooth proper DM purity** (`dmStack_smoothProper_purity`). For a smooth proper
Deligne–Mumford stack `𝒳₀/𝔽_q` of pure dimension `d` with finite diagonal and `ℓ≠p`,
prove that `Hⁱ(𝒳,ℚ_ℓ)` is pure of weight `i` and vanishes outside `0≤i≤2d`.
The same purity holds with a finite-monodromy rational local system, including
the branch orientation sheaves of §8.24, by a finite étale trivializing cover
and rational trace splitting.

Construct the Frobenius-equivariant constant-coefficient comparison with the
proper coarse algebraic space `M: ℚ_ℓ≅Rπ_*ℚ_ℓ` and `Hⁱ(M,ℚ_ℓ)≅Hⁱ(𝒳,ℚ_ℓ)`.
Finite stabilizer cohomology is killed by rational averaging, even when `ℓ`
divides its order. Extend §7.12's compact-support upper bound to finite-type
algebraic spaces by finite scheme stratification and localization. Construct
smooth-stack duality and trace by étale atlas descent, obtaining the perfect
pairing `Hⁱ×H^(2d−i)→ℚ_ℓ(−d)`. The upper bound on proper `M` and this duality give
the matching lower bound on `𝒳`. These constructions use the coefficient descent
above and precede the stack spectral sequence; they do not use its degeneration.

*Needs:* dmStack_etaleCohomology above; SchemeAndStackFoundations §§1.19–1.20,
`1.23` (DM atlases and coarse spaces); EtaleCohomologyFoundations
§§F.3–F.6 (localization, duality and trace); §§0.9, `0.12`–`0.13`, `7.12`.
(Source: [Sun](#ref-sun), Proposition 7.3.2 and proof, preprint p. 47;
[BFP](#ref-bfp), proof of Proposition 4.2, p. 7.)

**Checks.**

- For `BC₂` the constant rational cohomology is `ℚ_ℓ` in degree zero and zero
  otherwise, also for `ℓ=2`. Stabilizer order need not be prime to `ℓ`.
- For `[ℙ¹/C₂]` with trivial action, `H⁰=ℚ_ℓ` and `H²=ℚ_ℓ(−1)`, with weights
  `0` and `2`; the coarse comparison agrees with `ℙ¹`.
- On `BC₂`, the sign local system has zero cohomology. On the empty stack every
  group is zero. Finite-monodromy purity permits these zero groups and does
  not assert that every local system is pulled back from the coarse space.

### Examples

On a point `ℚ_ℓ[1]` has complex weight `1` and `ℚ_ℓ(1)[2]` weight `0`, pinning both shifts. For the Kummer extension on `𝔾_m`, `W_(−2)=W_(−1)=ℚ_ℓ(1)` and `W_0` is the whole system; the filtration does not split. A nodal cubic has a weight-zero `H¹` and its constant sheaf is not a pure weight-zero complex (§§8.1–8.2, `8.18`).

### Dependencies

DWP.0, DWP.5–DWP.7; EtaleCohomologyFoundations §§F.0–F.6; LefschetzPencilsAndVanishingCycles §§0.5–0.8, `1.1`–`1.6`, 7b.3, 7b.7; EtaleCohomologyFoundations §§F.0.A1–F.0.A2; InverseGaloisAndArithmeticFundamentalGroups §§IG.0.3, IG.1.2–IG.1.3, IG.5.7; SchemeAndStackFoundations §§0.9, `1.19`–`1.20`, `1.23`; ReductiveGroups Layer `6`; Tau Ceti’s Clifford restriction theorem; §8.24 here for coefficient descent and smooth proper DM purity.

## Layer DWP.9: Absolute hard Lefschetz and primitive pairings

The invariant-cycle theorem is imported from its pencil owner. Combine it with complete reducibility and the nondegeneracy of invariant pairings to prove absolute hard Lefschetz. A separate graded-operator argument constructs primitive summands, and alternating pairings give parity. Support bounds control the potentially pure complex extension.

Geometric schemes here are separated and noetherian, with `ℓ` invertible. The finite-type base and the additional smoothness, normality or properness assumptions are those specified in each item.

<a id="target-9-1"></a>

### 9.1. The Lefschetz operator of a line bundle

Let `k` be an algebraically closed field, `ℓ` a prime invertible in `k`, `X` a smooth projective `k`-scheme of pure dimension `n`, and `L` a line bundle on `X` with first Chern class `η = c₁(L) ∈ H²(X, ℚ_ℓ(1))` (EtaleCohomologyFoundations §§F.6–F.7). The Lefschetz operator is `L_η = η ∪ − : H^j(X, ℚ_ℓ(m)) → H^{j+2}(X, ℚ_ℓ(m + 1))`, and its `r`-th iterate is cup product with `η^r ∈ H^{2r}(X, ℚ_ℓ(r))`. For `0 ≤ r ≤ n`: the hard Lefschetz map is `η^r ∪ − : H^{n−r}(X, ℚ_ℓ) → H^{n+r}(X, ℚ_ℓ(r))`; the primitive part is `P^{n−r}(X) = ker(η^{r+1} ∪ − : H^{n−r}(X, ℚ_ℓ) → H^{n+r+2}(X, ℚ_ℓ(r + 1)))`; the Lefschetz pairing is `ψ_r(x, y) = Tr_X(η^r ∪ x ∪ y) ∈ ℚ_ℓ(r − n)` for `x`, `y ∈ H^{n−r}(X, ℚ_ℓ)`, where `Tr_X : H^{2n}(X, ℚ_ℓ(n)) → ℚ_ℓ` is the trace of EtaleCohomologyFoundations §F.6. Tate twists are kept: the source's identification `ℤ_ℓ ≅ ℤ_ℓ(1)` over `k` is not used.

Its API includes:
- `lefschetzOperator`: `lefschetzOperator η : H^j(X, ℚ_ℓ(m)) →ₗ H^{j+2}(X, ℚ_ℓ(m + 1))`, `x ↦ η ∪ x`.

- `lefschetzOperator_pow`: `(lefschetzOperator η)^r =` cup product with `η^r ∈ H^{2r}(X, ℚ_ℓ(r))`.

- `lefschetzOperator_smul`: `lefschetzOperator (m • η) = m • lefschetzOperator η`, and `η(L^{⊗m}) = m • η(L)`.

- `lefschetzOperator_comm_pullback`: For `g : X′ → X`, `g* ∘ L_{η(L)} = L_{η(g*L)} ∘ g*`.

- `lefschetzOperator_galois`: For `(X, L)` defined over `k₀ ⊂ k`, `L_η` commutes with the action of `Gal(k/k₀)`.

- `lefschetzOperator_eq_gysin_restrict`: For `L` very ample and a smooth hyperplane section `i : Y → X`, `L_η = i_* ∘ i*`.

- `lefschetzOperator_selfAdjoint`: `Tr_X(L_η x ∪ y) = Tr_X(x ∪ L_η y)`.

- `lefschetzOperator_pow_top`: `η^{n+1} = 0` and `Tr_X(η^n) = deg_L(X)`; if `L` is ample and `X` is nonempty, this degree is `> 0`. For `X` empty, it is `0`.

- `primitivePart`: `P^{n−r}(X) = ker(η^{r+1} ∪ − on H^{n−r}(X, ℚ_ℓ))`.

- `lefschetzPairing`: `ψ_r(x, y) = Tr_X(η^r ∪ x ∪ y)` on `H^{n−r}(X, ℚ_ℓ)`, with values in `ℚ_ℓ(r − n)`.

- `lefschetzPairing_symm`: `ψ_r(y, x) = (−1)^{n−r} ψ_r(x, y)`.

#### Checks
- `lefschetzOperator_projectiveSpace`: For `X = ℙ^n` and `L = 𝒪(1): H^{2j}(ℙ^n, ℚ_ℓ(j)) = ℚ_ℓ·η^j`, `L_η(η^j) = η^{j+1}` for `j < n`, `η^{n+1} = 0`, and `Tr(η^n) = 1`.

- `lefschetzOperator_trivial_bundle`: For `L = 𝒪_X`, `η = 0` and `L_η = 0`; on `X = ℙ¹`, `η : H⁰ → H²(1)` is the zero map, so ampleness cannot be dropped from hard Lefschetz.

- `lefschetzOperator_degree_zero`: For an elliptic curve `E` and a line bundle `L` of degree `0`, `c₁(L) = 0` in `H²(E, ℚ_ℓ(1)) ≅ ℚ_ℓ` (the degree), so `L_η = 0` although `L` may be nontrivial.

- `lefschetzOperator_point`: For `n = 0` (`X` a finite set of points) `L_η = 0` on `H⁰` and `P⁰(X) = H⁰(X)`; the hard Lefschetz map for `r = 0` is the identity.

- `lefschetzPairing_curve`: For a smooth projective curve of genus `g` and `L` of degree `e > 0: ψ₀` on `H¹` is `Tr(x ∪ y)`, alternating and nondegenerate on a space of dimension `2g`; `ψ₁` on `H⁰` is `x·y·e`.

*Needs:* [EtaleCohomologyFoundations §§F.0–F.4 (constructible derived coefficients, base change and finiteness)](#input-e12), [EtaleCohomologyFoundations §§F.5–F.6 (smooth purity and Poincaré duality)](#input-e16), [EtaleCohomologyFoundations §§F.6–F.7 (cycle classes and projective-space cohomology)](#input-e22).

(Sources: [WII](#ref-wii), §4, Théorème (4.1.1), p. 217; [WII](#ref-wii), §4, (4.1), p. 217; [Lef](#ref-lef), (1.5), p. 108.)

<a id="target-9-2"></a>

### 9.2. An invariant nondegenerate form stays nondegenerate on the invariants of a completely reducible representation

Let `π` be a group, `K` a field, `V` a finite-dimensional `K`-vector space with a completely reducible (semisimple) representation of `π`, and `Φ` a `π`-invariant bilinear form on `V` (`Φ(gx, gy) = Φ(x, y)` for `g ∈ π`) which is nondegenerate. Then the restriction of `Φ` to the invariant subspace `V^π` is nondegenerate.

The invariant form may be neither symmetric nor alternating.

*Needs:* [Representation](#input-b30), [Representation.invariants](#input-b32), [IsSemisimpleModule](#input-b33), [Representation.asModule](#input-b31), [LinearMap.BilinForm.Nondegenerate](#input-b34), [LinearMap.BilinForm.restrict](#input-b35).

(Sources: [WII](#ref-wii), §4, Lemme (4.1.4), p. 218.)

<a id="target-9-3"></a>

### 9.3. Reduction of hard Lefschetz to the middle intersection form on a hyperplane section

Let `k` be algebraically closed with `ℓ` invertible, `X` a smooth projective `k`-scheme of pure dimension `n ≥ 1`, `L` a very ample line bundle, `η = c₁(L)`, `i : Y → X` the inclusion of a smooth hyperplane section in the embedding defined by `L`, and `η_Y = i*η`. (a) The Gysin map `i_* : H^j(Y, ℚ_ℓ(m)) → H^{j+2}(X, ℚ_ℓ(m + 1))` is the transpose of `i*` under Poincaré duality on `Y` and `X`, and `i_* ∘ i* = L_η`. (b) For `r ≥ 1` and `x ∈ H^{n−r}(X, ℚ_ℓ): η^r ∪ x = i_*(η_Y^{r−1} ∪ i*x)`. (c) (Weak Lefschetz) `i* : H^j(X) → H^j(Y)` is an isomorphism for `j < n − 1` and injective for `j = n − 1`; dually `i_* : H^j(Y) → H^{j+2}(X)(1)` is an isomorphism for `j > n − 1` and surjective for `j = n − 1`. (d) Suppose hard Lefschetz holds for `(Y, L|_Y)`. Then `η^r ∪ − : H^{n−r}(X, ℚ_ℓ) → H^{n+r}(X, ℚ_ℓ(r))` is an isomorphism for every `r ≠ 1`, and it is an isomorphism for `r = 1` iff the form `⟨y, y′⟩ = Tr_Y(y ∪ y′)` on `H^{n−1}(Y, ℚ_ℓ)` is nondegenerate on the image of `i* : H^{n−1}(X, ℚ_ℓ) → H^{n−1}(Y, ℚ_ℓ)` (Weil II 4.1.2).

*Needs:* [9.1](#target-9-1), [EtaleCohomologyFoundations §§F.5–F.6 (smooth purity and Poincaré duality)](#input-e16), [EtaleCohomologyFoundations §§F.6–F.7 (cycle classes and projective-space cohomology)](#input-e22), [EtaleCohomologyFoundations §F.7 (blow-ups and weak Lefschetz)](#input-e23).

(Sources: [WII](#ref-wii), §4, proof of (4.1.1) and Lemme (4.1.2), p. 217; [WII](#ref-wii), §4, proof of (4.1.1), p. 217.)

<a id="target-9-4"></a>

### 9.4. Arithmetic models of a polarised smooth projective variety and cospecialisation

For smooth projective pure-dimensional `X` over algebraically closed `k` with `ℓ` invertible, and a very ample embedding `X⊂ℙᴺ_k`, construct a polarized smooth projective pure-relative-dimensional model `X_S⊂ℙᴺ_S` over integral finite-type `S/ℤ[1/ℓ]` through the given `k`-point. Its smooth proper cohomology sheaves are lisse and commute with base change. Cospecialization preserves the cohomology ring, trace and `c₁(L)`; hard Lefschetz therefore transports from any closed fibre. Its closed fibres witness fibrewise weight-zero purity of the constant sheaf; §8.20's `PotentiallyPureComplex.of_lisse` supplies the geometric-generic arithmetic-pure model when the complex interface is used. The family of smooth hyperplane sections also spreads smoothly and projectively, with `Rʲg_*ℚ_ℓ` potentially pure of weight `j`.

*Needs:* [8.20](#target-8-20), [8.9](#target-8-9), [8.21](#target-8-21), [SchemeAndStackFoundations §0.9 and LefschetzPencilsAndVanishingCycles §§7b.3, 7b.7 (Noetherian approximation and arithmetic models)](#input-e8), [EtaleCohomologyFoundations §§F.0–F.4, F.10.1–F.10.5 and InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4 (finite cohomology, base change and geometric trace formulas)](#input-e49), [EtaleCohomologyFoundations §§F.5–F.6 (smooth purity and Poincaré duality)](#input-e16), [EtaleCohomologyFoundations §§F.6–F.7 (cycle classes and projective-space cohomology)](#input-e22), [LefschetzPencilsAndVanishingCycles §3.2 (dual variety and incidence family)](#input-e34).

(Sources: [WII](#ref-wii), Introduction, p. 142; [WII](#ref-wii), §3, Exemple (3.4.11), p. 210.)

<a id="target-9-5"></a>

### 9.5. The image of `H^{n−1}(X)` in `H^{n−1}(Y)` is the monodromy invariants

Let `k` be algebraically closed with `ℓ` invertible, `X` a smooth projective `k`-scheme of pure dimension `n ≥ 1` embedded by a very ample `L` in `P = ℙ^N`, `U = P̌ − X̌` the open of hyperplanes `H` with `X ∩ H` smooth, `g : Z → U` the family of smooth hyperplane sections, `u ∈ U(k)`, `Y = Z_u` and `i : Y → X`. Then the image of `i* : H^{n−1}(X, ℚ_ℓ) → H^{n−1}(Y, ℚ_ℓ)` is the subspace `H^{n−1}(Y, ℚ_ℓ)^{π₁(U, u)}` of monodromy invariants. If `D ⊂ P̌` is a sufficiently general line through `u` (a Lefschetz pencil when one exists), the image of `π₁(D ∩ U, u)` in `GL(H^{n−1}(Y))` equals that of `π₁(U, u)`, so the image of `i*` is also `H^{n−1}(Y)^{π₁(D ∩ U, u)}` (Weil II 4.1.3).

*Needs:* [LefschetzPencilsAndVanishingCycles §§7b.1–7b.11 (invariant cycles and support bounds)](#input-e44), [9.4](#target-9-4), [LefschetzPencilsAndVanishingCycles §3.2 (dual variety and incidence family)](#input-e34), [LefschetzPencilsAndVanishingCycles §5.1 (Bertini for monodromy images)](#input-e41), [EtaleCohomologyFoundations §F.7 (blow-ups and weak Lefschetz)](#input-e23), [8.9](#target-8-9).

(Sources: [WII](#ref-wii), §4, (4.1.3), p. 218; [WII](#ref-wii), §6, Corollaire (6.2.12), p. 250.)

Prove `localInvariantCycles_weightSeparation` to apply the conditional
invariant-cycle interfaces. In a finite-field model of a proper family over an
algebraizable equicharacteristic henselian trait, with essentially smooth total
space of pure dimension `d` and smooth generic fibre, the space
`B=Hⁱ(X_η̄,ℚ_ℓ)^I` has weights `≤i`, while
`C=H^(2d−i−1)(X_s̄,ℚ_ℓ)∨(−d)` has weights `≥i+1`. The first bound uses §5.11 on the
pure smooth-proper generic family, and the second uses §7.12 on the proper
special fibre plus duality and the displayed twist. Their spectra are disjoint
by §0.17; LefschetzPencilsAndVanishingCycles §7b.5 then gives local surjectivity,
and §7b.11 gives §9.5's global fixed part after arithmetic transport. The support
bounds for potentially pure complexes are retained in the corresponding
§§7b.8–7b.11 interfaces and in §9.10 here. (Source: [WII](#ref-wii),
§3.6, Theorem 3.6.1 and Lemmas 3.6.2–3.6.3, pp. `213`–`214`.)

<a id="target-9-6"></a>

### 9.6. The hard Lefschetz theorem

Let `k` be an algebraically closed field, `ℓ` a prime invertible in `k`, `X` a smooth projective `k`-scheme of pure dimension `n`, `L` an ample line bundle on `X` and `η = c₁(L) ∈ H²(X, ℚ_ℓ(1))`. Then for every `r ≥ 0` the map `η^r ∪ − : H^{n−r}(X, ℚ_ℓ) → H^{n+r}(X, ℚ_ℓ(r))` is an isomorphism. If `(X, L) = (X₀, L₀) ⊗_{k₀} k` for a subfield `k₀` of which `k` is an algebraic closure, the isomorphism is `Gal(k/k₀)`-equivariant.

Use rational `ℚ_ℓ` coefficients; the integral assertion fails in general.

*Needs:* [9.1](#target-9-1), [9.3](#target-9-3), [9.5](#target-9-5), [8.23](#target-8-23), [9.2](#target-9-2), [LefschetzPencilsAndVanishingCycles §3.2 (dual variety and incidence family)](#input-e34), [EtaleCohomologyFoundations §§F.5–F.6 (smooth purity and Poincaré duality)](#input-e16).

(Sources: [WII](#ref-wii), §4, Théorème (4.1.1), p. 217; [WII](#ref-wii), §4, proof of (4.1.1), p. 218.)

<a id="target-9-7"></a>

### 9.7. Primitive decomposition for a graded operator satisfying hard Lefschetz

Let `K` be a field, `n ∈ ℕ`, `V` a finite-dimensional `K`-vector space which is the internal direct sum of subspaces `V^j` (`0 ≤ j ≤ 2n`; `V^j = 0` otherwise), and `λ ∈ End(V)` with `λ(V^j) ⊆ V^{j+2}`, such that `λ^r : V^{n−r} → V^{n+r}` is bijective for `0 ≤ r ≤ n`. Put `P^{n−r} = V^{n−r} ∩ ker λ^{r+1}` for `0 ≤ r ≤ n`. Then: (i) for `0 ≤ r ≤ n`, the maps `⊕_{k ≥ 0} λ^k : ⊕_{k≥0} P^{n−r−2k} → V^{n−r}` and `⊕_{k ≥ 0} λ^{r+k}` : `⊕_{k≥0} P^{n−r−2k} → V^{n+r}` are isomorphisms; (ii) `dim P^{n−r} = dim V^{n−r} − dim V^{n−r−2}`; (iii) if `B` is a nondegenerate bilinear form on `V` with `B(V^a, V^b) = 0` unless `a + b = 2n` and `B(λx, y) = B(x, λy)`, then for `0 ≤ r ≤ n` the form `ψ_r(x, y) = B(λ^r x, y)` on `V^{n−r}` is nondegenerate, the decomposition (i) of `V^{n−r}` is `ψ_r`-orthogonal, and `ψ_r` restricts to a nondegenerate form on `P^{n−r}`; if moreover `B(y, x) = (−1)^a B(x, y)` for `x ∈ V^a`, then `ψ_r` is `(−1)^{n−r}`-symmetric.

*Needs:* [DirectSum.IsInternal](#input-b38), [LinearMap.ker](#input-b39), [Module.finrank](#input-b40), [LinearMap.BilinForm.Nondegenerate](#input-b34).

(Sources: [Lef](#ref-lef), Théorème (1.5) and (1.6), p. 108.)

The definition `primitivePiece` in Suggested.lean is
`primitivePiece 𝒱 λ n r = 𝒱(n−r)∩ker(λ^(r+1))`, with
`𝒱:ℤ→Submodule K V`. The statement `lefschetzDecomposition` gives both
independent spanning families, the injective primitive-source maps with
exponents `k` and `r+k`, and the dimension difference in (i)–(ii).
The statement `lefschetzPairings` gives nondegeneracy, orthogonality and the
conditional graded symmetry in (iii). Both statements retain all hypotheses
of §9.7, over an arbitrary field.
(Source: [Lef](#ref-lef), (1.5)–(1.6), p. 108.)

Extend a natural grading `𝒱_nat:ℕ→Submodule K V` by zero in negative degrees
to an integer grading `𝒱`. Prove that this preserves the internal direct sum,
and transport the degree-two operator, finite support, hard-Lefschetz
bijections and compatible pairings through the extension.
For `0≤j≤n`, identify `𝒱_nat(j)∩ker(λ^(n−j+1))` with
`primitivePiece 𝒱 λ n (n−j)`.
This is the common-core export to StandardConjectures §§0.1–0.4:
`P_SC^j = primitivePiece 𝒱 λ n (n−j)`, where `𝒱` is the extended grading.
Its `LefschetzStructure` packages this decomposition and pairing theory; its
characteristic-zero `sl₂` triple, `Λ` and grade projectors are additional
downstream constructions. This arbitrary-field core uses neither those
operators nor a characteristic-zero assumption. EtaleDualityAndPerverseSheaves
uses the same vector-space core for its categorical extension.

**Checks.**

- On the chain `e₀→e₂→e₄→0` with degrees `0`,`2`,`4` and `n=2`, `P⁰=Ke₀` and `P²=0`;
  `λ²` sends `P⁰` onto degree four, so the upper exponent is `r+k`.
- Replacing `ker λ^(r+1)` by `ker λ^r` would make `P⁰` vanish on that chain; the
  exponent `r+1` is essential.
- On `V=K` concentrated in degree zero with `λ=0` and `n=0`, primitivePiece at `r=0`
  is `V`, while its value at `r=1` is zero. For `V=0` every primitive piece is zero.
- For the natural grading of the three-step chain, extension by zero gives
  `𝒱(−1)=0`; `j=0` corresponds to `r=n=2` and the kernel of `λ³`, while
  `j=n=2` corresponds to `r=0` and the kernel of `λ`. The same comparison
  holds over fields of positive characteristic, without an `sl₂` construction.

<a id="target-9-8"></a>

### 9.8. Primitive Lefschetz decomposition and nondegenerate Lefschetz pairings

Let `k` be algebraically closed with `ℓ` invertible, `X` a smooth projective `k`-scheme of pure dimension `n`, `L` ample, `η = c₁(L)`. (i) For `0 ≤ r ≤ n`, `H^{n−r}(X, ℚ_ℓ) = ⊕_{k≥0} η^k ∪ P^{n−r−2k}(X)(−k)` and `H^{n+r}(X, ℚ_ℓ(r)) = ⊕_{k≥0} η^{r+k} ∪ P^{n−r−2k}(X)(−k)`, where `P^{n−r}(X) = ker(η^{r+1} on H^{n−r}(X, ℚ_ℓ))` is the primitive part (DWP.9/lefschetz-operator) and `η^k ∪ P(−k)` denotes the image of `P` under `η^k ∪ −` composed with the inverse twist; `dim P^{n−r} = b_{n−r} − b_{n−r−2}`. (ii) The Lefschetz pairing `ψ_r(x, y) = Tr_X(η^r ∪ x ∪ y)` on `H^{n−r}(X, ℚ_ℓ)` is nondegenerate and `(−1)^{n−r}`-symmetric, the decomposition (i) of `H^{n−r}` is `ψ_r`-orthogonal, and `ψ_r` is nondegenerate on `P^{n−r}(X)`. All these are `Gal(k/k₀)`-equivariant when `(X, L)` is defined over `k₀`.

Nondegeneracy and graded symmetry are the conclusions; no Hodge–Riemann positivity is required.

*Needs:* [9.7](#target-9-7), [9.6](#target-9-6), [9.1](#target-9-1), [EtaleCohomologyFoundations §§F.5–F.6 (smooth purity and Poincaré duality)](#input-e16).

(Sources: [Lef](#ref-lef), (1.5)–(1.6), p. 108; [WII](#ref-wii), §4, Corollaire (4.1.5), proof, p. 218.)

<a id="target-9-9"></a>

### 9.9. Odd Betti numbers of smooth projective varieties are even

Let `k` be algebraically closed with `ℓ` invertible and `X` a smooth projective `k`-scheme. Then `b_j(X) = dim_{ℚ_ℓ} H^j(X, ℚ_ℓ)` is even for every odd `j`.

The hypothesis is smooth projective.

*Needs:* [9.8](#target-9-8), [alternating-form parity](#exact-supplier-contracts), [EtaleCohomologyFoundations §§F.5–F.6 (smooth purity and Poincaré duality)](#input-e16).

(Sources: [WII](#ref-wii), §4, Corollaire (4.1.5), p. 218.)

<a id="target-9-10"></a>

### 9.10. Hard Lefschetz for potentially pure complexes

Let `k` be algebraically closed with `ℓ` invertible, `X ⊂ P = ℙ^N_k` a projective `k`-scheme, `η = c₁(𝒪_X(1)) ∈ H²(X, ℚ_ℓ(1))`, and `K ∈ D^b_c(X, ℚ̄_ℓ)` a complex with `PotentiallyPureComplex w K` as in §8.20. Its supplied geometric-generic arithmetic model has total complex `K_S` pure in the sense of §8.13, and carries a spread of the projective embedding `X_S ⊂ ℙ^N_S`. Let `n ∈ ℤ` be such that for every `i`, `dim Supp ℋ^i(K) ≤ n − i` and `dim Supp ℋ^i(DK[−2n]) ≤ n − i (dim ∅ = −∞)`, where `D` is duality relative to `k`. Then for every `r ≥ 0` the cup product `η^r ∪ − : H^{n−r}(X, K) → H^{n+r}(X, K(r))` is an isomorphism.

The integer `n` in the two support conditions need not equal `dim X`.
Use LefschetzPencilsAndVanishingCycles §7b.7 to spread this model along the
general incidence pencil. Its noncharacteristic comparison
`D(i*q*K)≅i*q*DK` has cancelling relative twists and shifts; together with
§8.11's upper and lower inequalities it makes the total trait-model complex
arithmetically pure. Proper purity and the upper direct-image bound separate
the two spectra in the localization–Wang cross of §§7b.6, 7b.8, giving local
surjectivity; §§7b.9–7b.11 then give weak Lefschetz and the global fixed part
for the induction. Both support conditions remain conditions on `K` over `k`;
general hyperplane restriction uses
`D_Y(K|Y)≅(DK)|Y(−1)[−2]` and replaces `n` by `n−1`.

*Needs:* [LefschetzPencilsAndVanishingCycles §§7b.1–7b.11 (invariant cycles and support bounds)](#input-e44), [8.20](#target-8-20), [8.2](#target-8-2), [8.12](#target-8-12), [8.13](#target-8-13), [8.9](#target-8-9), [8.22](#target-8-22), [9.2](#target-9-2), [9.1](#target-9-1), [EtaleCohomologyFoundations §§F.0–F.4 (constructible derived coefficients, base change and finiteness)](#input-e12), [EtaleCohomologyFoundations §F.5 (exceptional inverse image and Verdier duality)](#input-e15), [8.11](#target-8-11), [EtaleCohomologyFoundations §§F.5–F.6 (smooth purity and Poincaré duality)](#input-e16).

(Sources: [WII](#ref-wii), §6, Théorème (6.2.13), p. 250; [WII](#ref-wii), §6, proof of (6.2.13), p. 251.)

<a id="target-9-11"></a>

### 9.11. Hard Lefschetz with coefficients in a potentially pure lisse sheaf

Let `k` be algebraically closed with `ℓ` invertible, `X` a smooth projective `k`-scheme of pure dimension `n` embedded by a very ample `L`, `η = c₁(L)`, and `ℱ` a lisse `ℚ̄_ℓ`-sheaf on `X` which is potentially punctually pure of some weight `w`, with a model witnessing it. Then for every `r ≥ 0`, `η^r ∪ − : H^{n−r}(X, ℱ) → H^{n+r}(X, ℱ(r))` is an isomorphism. In particular this holds for `ℱ = R^jh_*ℚ_ℓ` of a smooth projective morphism `h : Y → X`.

Use the given very ample bundle; reduction from an ample bundle uses a positive power.
Apply §8.20's `PotentiallyPureComplex.of_lisse` to the supplied fibrewise
punctual-purity witness and this bundle. The resulting arithmetic-pure
geometric-generic model is the input to §9.10. On `X`, smooth duality gives
`Dℱ[−2n]=ℱ∨(n)`; both support bounds therefore hold with parameter `n`.

*Needs:* [9.10](#target-9-10), [8.9](#target-8-9), [8.21](#target-8-21), [8.20](#target-8-20).

(Sources: [WII](#ref-wii), Introduction, p. 142.)

<a id="target-9-12"></a>

### 9.12. Invariant and vanishing cohomology of a hyperplane section are orthogonal complements

Let `k` be algebraically closed with `ℓ` invertible, `X` a smooth projective `k`-scheme of pure dimension `n + 1`, `L` very ample, `(X_t)_{t∈D}` a Lefschetz pencil of hyperplane sections (LPV.`3`) with singular set `S`, `u ∈ D − S`, `Y = X_u`, `i : Y → X`, and `E = Ev(Y) ⊂ H^n(Y, ℚ_ℓ)` the vanishing subspace (LPV.`4`). Then `H^n(Y, ℚ_ℓ) = i*H^n(X, ℚ_ℓ) ⊕ E`, an orthogonal direct sum for the intersection form `Tr_Y(x ∪ y)`, which is nondegenerate on each summand. Consequently `E ∩ E^⊥ = 0` (the radical quotient `E/(E ∩ E^⊥)` of LPV.`4` is `E` itself), and a class that is both invariant under `π₁(D − S, u)` and vanishing is zero ('Lefschetz's fundamental lemma' over `ℚ_ℓ`).

Keep `ℚ_ℓ` coefficients and the supplied pencil, allowing a Veronese embedding when required.

*Needs:* [9.6](#target-9-6), [9.3](#target-9-3), [LefschetzPencilsAndVanishingCycles §§5.2–5.3 (conjugacy and generation by transvections)](#input-e43), [LefschetzPencilsAndVanishingCycles §4.2 (vanishing subspace)](#input-e39), [LefschetzPencilsAndVanishingCycles §§3.4–3.5 (existence and finite-field descent of pencils)](#input-e35), [EtaleCohomologyFoundations §§F.5–F.6 (smooth purity and Poincaré duality)](#input-e16), [LefschetzPencilsAndVanishingCycles §§7b.1–7b.11 (invariant cycles and support bounds)](#input-e44).

(Sources: [WII](#ref-wii), §4, Corollaire (4.3.9), p. 226; [WII](#ref-wii), §4, (4.3.10), p. 226.)

### Examples

On `ℙ²` with `η=c₁(𝒪(1))`, the chain `1→η→η²→0` has `P⁰=ℚ_ℓ` and `P²=0`; `η²` is the upper map from the bottom primitive line. For a curve and a line bundle of degree `e`, `ψ₁` on `H⁰` is multiplication by `e` while `ψ₀` on `H¹` is alternating. The trivial bundle has `e=0`, so its positive-degree Lefschetz map fails (§§9.1, `9.7`–`9.8`).

### Dependencies

DWP.0, DWP.5, DWP.7–DWP.8; EtaleCohomologyFoundations §§F.5–F.7; LefschetzPencilsAndVanishingCycles §§3.1–3.5, `4.2`–`4.4`, `5.1`–`5.3`, 7b.1–7b.11; the supplier’s spectral and local-surjectivity hypotheses are discharged in §9.5. Tau Ceti supplies alternating-form parity. Relative hard Lefschetz and decomposition are outside this roadmap.

## Layer DWP.10: Arithmetic weight transport and finite-field equidistribution

Expose the weight theory in the forms consumed by arithmetic realizations and distribution problems. These targets transport established weights; they do not construct a second Tate module, a second semistable filtration or a private six-operation formalism. The elliptic distribution theorem keeps its precise universal-family monodromy input.

<a id="target-10-1"></a>

### 10.1. Weights on stable arithmetic subquotients

Let `(V,F)` be a finite-dimensional invertible Frobenius module and let a commuting algebra of correspondences act on `V`. Every Frobenius-stable correspondence-stable subquotient of a pure weight-`w` module is pure of weight `w`; for a mixed module its actual weights are a subset of those of `V`. Scalar extension preserves and reflects purity, tensor products add pure weights, duals negate them and an integer Tate twist subtracts `2r`. A Hecke eigenspace inherits the conclusion only when it is actually Frobenius-stable. This statement does not imply `ℓ`-independence of a chosen eigenspace.

For natural `q≥2` over a characteristic-zero field, §0.19 transports this ordinary purity to the supplied
Weil–Deligne purity of `(F,0)`. For nilpotent `N` with `NF=qFN`, transport the
weights on each supplied `grᴹ_a` to pair purity of weight `w` precisely when
every grade has ordinary weight `w+a`. Purity of the full Frobenius module
alone is not this graded condition.

*Needs:* [0.9](#target-0-9), [0.13](#target-0-13), [0.15](#target-0-15), [0.18](#target-0-18), [0.19](#target-0-19).

(Sources: [WII](#ref-wii), Weil II §1.2 (1.2.2), (1.2.3), (1.2.6)–(1.2.8), pp. 153–155.)

<a id="target-10-2"></a>

### 10.2. Compatible degree factors and point counts

For smooth projective `X₀/𝔽_q`, §4.4's integral factors `Π_i` identify the Weil
weight-`i` eigenvalue multisets across every `ℓ≠p`. For `X₀` of pure dimension `d`,
let `σ` permute its geometric connected components, `c_n=#Fix(σⁿ)`, and
`b_i=dim Hⁱ(X,ℚ_ℓ)`. For `d>0` the bottom and top contributions are
`c_n(1+q^(nd))`, and for every `n≥1` prove
`|#X₀(𝔽_(qⁿ))−c_n(1+q^(nd))|≤Σ_(i=1)^(2d−1)b_i q^(ni/2).`
The leading-term version is
`|#X₀(𝔽_(qⁿ))−c_n q^(nd)|≤Σ_(i=0)^(2d−1)b_i q^(ni/2).`
For `d=0`, `H⁰` is both bottom and top degree, and the exact count is `c_n`.
Apply componentwise in differing dimensions. These estimates follow from the
trace formula, degreewise purity and Poincaré duality, retaining the component
permutation and all eigenvalue multiplicities.

To export a compatible stable arithmetic subquotient, supply a normalized
rational factor `Q(t)`, independent of `ℓ`, whose image is exactly its Frobenius
factor in every realization. Under this additional hypothesis its eigenvalues
and weights agree across realizations; ambient purity alone does not construct `Q`.

**Checks.**

- For `X₀=Spec 𝔽_q`, `d=0` and `c_n=1` give count `1`, never `2`.
- For `Spec 𝔽_(q²)` over `𝔽_q`, `c_n` is `2` for even `n` and `0` for odd `n`; the
  dimension-zero count is exactly this permutation trace.
- For `ℙ¹` over `𝔽_(q²)` viewed over `𝔽_q`, `d=1` and the same permutation gives
  count `2(1+qⁿ)` for even `n` and `0` for odd `n`, with no intermediate cohomology.
- For a geometrically connected genus-`g` curve, the endpoint is `1+qⁿ` and
  the error bound is `2g q^(n/2)`.

*Needs:* §§1.10, 4.3–4.4, 10.1; EtaleCohomologyFoundations §§F.6, F.10.2–F.10.2b (Poincaré duality and Frobenius);
InverseGaloisAndArithmeticFundamentalGroups §IG.0.T4 (constant-sheaf point count for every finite extension, applied componentwise); §0.12 (powers and multiplicities).
(Sources: [WI](#ref-wi), (1.4)–(1.8), pp. 274–277;
[WII](#ref-wii), (3.3.9), p. 207.)

<a id="target-10-3"></a>

### 10.3. Weights in the semistable curve filtration

For a proper semistable curve over a trait with finite residue field, import the geometric normalization sequence and generic `H¹` monodromy
filtration centered at `1` from LefschetzPencilsAndVanishingCycles §§7a.1–7a.3,
and their residue-Galois-equivariant descent from §7a.5, including signed
component and branch permutations. Its graded pieces `H¹(Γ)`, `⊕H¹(Ỹ_v)`, `H₁(Γ)(−1)` have weights respectively `0`,`1`,`2`. The graph may have a Frobenius permutation, and the normalized components may need finite residue-field extension; these change no weight. This is the finite-residue-field curve consequence, not a general mixed-characteristic weight–monodromy theorem.

*Needs:* [LefschetzPencilsAndVanishingCycles §§7a.3, 7a.5 (nodal-curve monodromy and arithmetic descent)](#input-e45), [LefschetzPencilsAndVanishingCycles §§7a.1–7a.2, 7a.5 (normalization, specialization and arithmetic descent)](#input-e46), [1.7](#target-1-7), [0.12](#target-0-12), [0.15](#target-0-15).

(Sources: [WII](#ref-wii), Weil II §1.8 (1.8.4), pp. 175–176; LefschetzPencilsAndVanishingCycles §§7a.1–7a.3 identifies the three pieces and §7a.5 supplies their arithmetic descent.)

<a id="target-10-4"></a>

### 10.4. Mixed nearby cycles and Newton restrictions

The arithmetic consumers use DWP.8's mixedness theorem for nearby-cycle cohomology sheaves and its proper direct-image purity over `ℤ[1/ℓ]`. For an integral weight-`w` eigenvalue, DWP.7’s Newton couple `(r,s)` satisfies `r+s=w` and `r`,`s≥0`; its cohomological valuation triangles retain the separate compact-support/proper and smooth ordinary hypotheses. DWP.0 supplies the real-base scalar adapter and `ι`-weight interfaces; §0.19 compares natural `q≥2` with the canonical arithmetic scalar predicate and monodromy-graded purity. Rigid coefficient categories and their fibres are outside this roadmap.

*Needs:* [8.7](#target-8-7), [8.13](#target-8-13), [7.13](#target-7-13), [7.14](#target-7-14), [0.1](#target-0-1), [0.4](#target-0-4), [0.19](#target-0-19).

(Sources: [WII](#ref-wii), Weil II §3.3 (3.3.7)–(3.3.8), pp. 206–207; [WII](#ref-wii), Théorème (6.1.13), p. 246; [WII](#ref-wii), Variante (6.2.7), p. 248.)

<a id="target-10-5"></a>

### 10.5. Deligne’s Frobenius equidistribution theorem

In Weil II §2.2’s algebraic-by-`ℤ` monodromy setting, let `X₀/𝔽_q` be normal and geometrically connected of dimension `N≥1`, with the hypotheses (a)–`(c)` and compact form `G_R` of DWP.5 (finite kernel is required on the geometric subgroup). Let `G_R^i` denote degree-`i` conjugacy classes with the pushforward of normalized compact Haar. For a central `z` of positive degree `d` and fixed `i`, translate by `z^(−n)` the measure `q^(−(nd+i)N) Σ_(x∈X₀(𝔽_(q^(nd+i)))) δ_[ιF_x,ss]`. As `n→∞` it converges weakly to Haar on the degree-`i` conjugacy fibre. The sum is over rational points with Frobenius powers, and normalization uses the base dimension `N`. This is Weil II (3.5.3), not Weil I’s estimate or density of individual Weil numbers.

*Needs:* [5.17](#target-5-17), [5.19](#target-5-19), [7.12](#target-7-12), [8.19](#target-8-19), [EtaleCohomologyFoundations §§F.0–F.4, F.10.1–F.10.5 and InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4 (finite cohomology, base change and geometric trace formulas)](#input-e49).

(Sources: [WII](#ref-wii), §3.5 (3.5.1)–(3.5.3), pp. 210–211.)

<a id="target-10-6"></a>

### 10.6. Finite-field Sato–Tate for elliptic families

For a smooth elliptic family `E₀→C₀` over a smooth geometrically connected finite-field curve with nonconstant `j`, use the imported full `SL₂` geometric monodromy of the universal-family comparison. Normalized `H¹` classes lie in `SU(2)`. For `x∈C₀(𝔽_(q^m))`, write `eigenvalues q^(m/2)e^(±iθ_x)`, `0≤θ_x≤π`. Then `#E_x(𝔽_(q^m))=1+q^m−2q^(m/2)cos θ_x`, and `q^(−m)Σ_xδ_(θ_x)` converges to `(2/π)sin²θ dθ`.

*Needs:* [10.5](#target-10-5), [5.17](#target-5-17), [1.8](#target-1-8), [ModularCurves §5B and ModularCurvesPartII §§3.1–3.2, 4.11–4.12 (full level and geometric connectedness)](#input-e63), [RepresentationTheory/CompactGroups, Layers 0, 6 and the SU(2) engine case (Haar probability, characters and SU(2))](#input-e68).

(Sources: [WII](#ref-wii), §3.5 (3.5.4)–(3.5.7), pp. 211–212.)

Prove `ellipticFamily_fullMonodromy` as the input to §10.6. For the universal
elliptic family on a geometric fixed-pairing full-level curve of prime-to-`p`
level `n≥3`, each further prime-to-`p` full-level cover is geometrically connected
by ModularCurvesPartII §4.11 / fixedPairingIntegralComponents for the
compactification, §3.2 for smoothness at invertible level, and §4.12 /
agreementWithKatzMazurSchemes for its nonempty elliptic open. A smooth connected
geometric compactification is irreducible, so its nonempty open is connected;
apply this at every higher prime-to-`p` level. The compatible level actions give the
full determinant-one geometric action at finite levels, and their inverse
limits give `SL₂(ℤ_ℓ)`, with the chosen level subgroup when `ℓ` divides `n`. For any
smooth geometrically connected curve with a smooth elliptic family and
nonconstant `j`, pass to a finite cover carrying level `n` and compare its map to
the universal curve. The map is dominant and induces finite-index geometric
fundamental-group image; purely inseparable factors use étale invariance under
universal homeomorphisms. Its geometric `ℓ`-adic image is open in `SL₂(ℚ_ℓ)`, so its
Zariski closure is `SL₂`. These comparisons prove the monodromy hypothesis used
by the Sato–Tate theorem, rather than assuming it from the family’s rank.
*Needs:* ModularCurves §5B; ModularCurvesPartII §§3.1–3.2, 4.11–4.12;
InverseGaloisAndArithmeticFundamentalGroups §IG.5.7 (finite-cover and dense-open criteria);
EtaleCohomologyFoundations §F.0 (universal-homeomorphism invariance);
ArithmeticGaloisRepresentations §6.1; §2.2; the finite-index lemma of §5.8.
(Source: [WII](#ref-wii), §3.5 (3.5.4)–(3.5.7), pp. 211–212.)

### Examples

For a full-`SL₂` elliptic family, normalized trace is 2cos `θ`. Haar on `SU(2)` pushes forward to `(2/π)sin²θ dθ`, so the trace has mean `0` and second moment `1`. For `Spec 𝔽_(q²)`, the component permutation gives two points over even-degree extensions and zero over odd-degree extensions, preserving the `c_m` factor (§§10.2, `10.6`).

### Dependencies

DWP.0–DWP.9, including §§1.10, `4.4`, `8.24`; EtaleCohomologyFoundations §§F.10.1–F.10.5; LefschetzPencilsAndVanishingCycles §§7a.1–7a.3, 7a.5; InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T3–IG.0.T4 (rational constructible trace and constant-sheaf point count for every finite extension); ModularCurves §5B; ModularCurvesPartII §§3.1–3.2, `4.11`–`4.12`; EtaleCohomologyFoundations §F.0.A2; ArithmeticGaloisRepresentations §§2.6, `6.1`; RepresentationTheory/CompactGroups Layers `0`, `6` and the `SU(2)` engine case.

## Downstream consumers

ArithmeticGaloisRepresentations §§6.1–6.2 supplies Tate realizations for §10.1's
weight transport and §2.6 supplies the canonical scalar and Weil–Deligne purity
interfaces. Section `0.19` here supplies their downstream comparison with the
real-base scalar adapter and ordinary Frobenius purity.
AutomorphicLFunctionsAndLocalFactors §AL.3 uses DWP.7 for its
unramified pure realizations and tensor cohomological determinants. The `ι`-weight
predicates and compact-support bounds are export interfaces. Rigid
coefficient categories, relative hard Lefschetz and decomposition are outside
this roadmap.

## References

All page numbers in the targets are printed page numbers of the specified edition, except where a preprint page is identified.

<a id="ref-wi"></a>

- **[WI]** Pierre Deligne, [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf). Publ. Math. IHÉS 43 (1974), 273–307. Printed pagination.

<a id="ref-wii"></a>

- **[WII]** Pierre Deligne, [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf). Publ. Math. IHÉS 52 (1980), 137–252. Printed pagination.

<a id="ref-av"></a>

- **[AV]** J. S. Milne, [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf). Course notes, version 2.00, 16 March 2008. Chapter and printed-page locators.

<a id="ref-yu"></a>

- **[Yu]** Hongjie Yu, [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5). arXiv:1807.04659v5. Section and page locators refer to this author preprint.

<a id="ref-sch"></a>

- **[Sch]** Olivier Schiffmann, [Indecomposable vector bundles and stable Higgs bundles over smooth projective curves](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p06-p.pdf). Annals of Mathematics 183 (2016), 297–362.

<a id="ref-lef"></a>

- **[Lef]** Pierre Deligne, [Théorème de Lefschetz et critères de dégénérescence de suites spectrales](https://www.numdam.org/article/PMIHES_1968__35__107_0.pdf). Publ. Math. IHÉS 35 (1968), 107–126. Printed pagination.

<a id="ref-bfp"></a>

- **[BFP]** Jonas Bergström, Carel Faber, Sam Payne, [Polynomial point counts and odd cohomology vanishing on moduli spaces of stable curves](https://arxiv.org/pdf/2206.07759v2). arXiv:2206.07759v2, 17 October 2023. Page locators refer to this preprint.

<a id="ref-int"></a>

- **[Int]** Nicholas M. Katz; §5 appendix by Pierre Deligne, SGA 7 II, Exposé XXI: Le niveau de la cohomologie des intersections complètes; §5 Appendix on integrality. SGA 7 II, Lecture Notes in Mathematics 340 (1973), Exposé XXI, §5, 384–387.

<a id="ref-sun"></a>

- **[Sun]** Shenghao Sun, [L-series of Artin stacks over finite fields](https://arxiv.org/pdf/1008.3689).
  Algebra & Number Theory 6 (2012), 47–122. Locators refer to the arXiv preprint;
  Proposition 7.3.2 and its proof are on preprint p. 47.
