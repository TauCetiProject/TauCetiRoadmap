import Mathlib
import TauCeti.FieldTheory.SquareClassGroup.Basic
import TauCeti.LinearAlgebra.IntegralLattice.Scaling
import TauCeti.LinearAlgebra.IntegralLattice.Dual.Scaling
import TauCeti.LinearAlgebra.IntegralLattice.Restriction
import TauCeti.LinearAlgebra.IntegralLattice.Characteristic.Basic
import TauCeti.LinearAlgebra.IntegralLattice.Discriminant.Quadratic
import TauCeti.LinearAlgebra.IntegralLattice.Gram
import TauCeti.LinearAlgebra.IntegralLattice.RankOne
import TauCeti.LinearAlgebra.IntegralLattice.Signature
import TauCeti.LinearAlgebra.IntegralLattice.Unimodular
import TauCeti.Analysis.SpecialFunctions.Complex.Circle
import TauCeti.LinearAlgebra.FiniteBilinearModule.Metabolic
import TauCeti.LinearAlgebra.FiniteBilinearModule.GaussSum
import TauCeti.LinearAlgebra.FiniteBilinearModule.OddCyclic.Basic
import TauCeti.LinearAlgebra.FiniteBilinearModule.Dyadic.Cyclic
import TauCeti.LinearAlgebra.FiniteBilinearModule.Dyadic.RankTwo.Basic
import TauCeti.NumberTheory.IntegralLattice.Localization

/-!
# Integral quadratic forms and lattices: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
few definitions they need; every other target, API list and Check is in `README.md` only.

The carrier is Tau Ceti's native one and is not defined here: `TauCeti.IntegralLattice V` (a full
`Submodule ℤ V` in a rational ambient space with a symmetric rational form integral on it), its
dual carrier, discriminant group and half-norm discriminant forms in `AddCircle (1 : ℚ)`,
`TauCeti.FiniteBilinearModule` and `TauCeti.FiniteQuadraticModule`, the overlattice
correspondences, the ADE lattices, the form twist, restriction, characteristic vectors, the
character `expCircle`, the Gauss-sum invariant `gaussSign`, metabolic modules, the localization
`ℤ_p ⊗ L`, and Nikulin's generator modules `oddCyclic`, `dyadicCyclic`, `dyadicU` and `dyadicV`.
The archived `Completed/IntegralLattices` roadmap certifies the foundation; this file imports no
roadmap.

The headline theorems stated here are: van der Blij's congruence (1L) and Milgram's theorem at
every signature (1I); Nikulin's generator classification (1G) and the choice-independence of
`discr K(q_p)` with its dyadic exception (5B); finiteness of positive definite classes (2G) and of
the classes in a binary genus (4E, rank 2); Nikulin's existence theorem 1.10.1 with its strict
corollary 1.10.2 and his `2`-elementary existence theorem 3.6.2 (5B, 5J); uniqueness of indefinite
even unimodular lattices (Layer 6); and the completeness theorem of a mass-certified stored genus
record (9B).

Headline theorems that are **not statable at the pins**, and what each lacks:

* the Conway–Sloane genus symbol and the 2-adic symbol calculus (Layer 3): no carrier for genus
  symbols;
* the adelic double-coset description of the class set, the spinor genus and the spinor-norm
  computation of `K_p⁺(L)` (Layer 4): no finite-adelic orthogonal group and no spinor norm;
* Hilbert reciprocity in the form the oddity formula uses (3G): no Hilbert symbol over `ℚ_p`;
* the binary dictionary into `Pic 𝒪_Δ` and `NarrowPic 𝒪_Δ` and the ring class field of a
  nonsquare discriminant (B2, B3): no orders of quadratic fields with their Picard groups and no
  ring class field.

The mass formula is not a headline of this roadmap: it belongs to
`OrthogonalTamagawaAndLatticeMass` (`README.md`, §*Scope*).

**The theta series of a lattice is not this roadmap's, and the dependency runs one way.**
`Θ_L`, `θ_γ`, their `T` and `S` transformation laws, the vector-valued law on discriminant
cosets, lattice Poisson summation, every modularity statement and every conclusion drawn from
one belong to the [theta-series roadmap](../ThetaSeries/README.md). This file defines no theta
series and no transformation law and names none of that roadmap's declarations.

Conventions follow `README.md`: the rational bilinear form is primary, its restriction to the
carrier is integral, and an abstract integral form enters through rationalization. Even lattices
correspond to `QuadraticForm ℤ L` through `polarBilin` (never through `associated`, which needs
`Invertible (2 : ℤ)`). Discriminant forms use the half-norm convention `q_L(x̄) = B(x,x)/2 mod ℤ`;
Nikulin's full-norm `ℚ/2ℤ` values are halved at the boundary.
-/

namespace TauCetiRoadmap.IntegralLattices

open QuadraticMap MeasureTheory NumberField
open scoped Real
open TauCeti TauCeti.IntegralLattice

universe u v

/-! ## The foundation, consumed rather than restated

The pinned Tau Ceti implements the following vocabulary of Layers 0, 1 and 3, and this file states
its targets against those native declarations rather than against copies:

* the form twist `L(a) = a • L`, keeping the carrier and scaling the form (`IntegralLattice.scale`
  and its `ℤ`-action), and the dual of a twist, `(a • L)ᵛ = a⁻¹ • Lᵛ` for `a ≠ 0`
  (`IntegralLattice.dualCarrier_smul`);
* restriction to a full submodule in the same ambient space (`IntegralLattice.restrictFull`), to
  an arbitrary submodule in its own rationalization (`IntegralLattice.restrict`), and their
  canonical comparison isometry (`IntegralLattice.restrictFullIsometry`);
* characteristic vectors (`IntegralLattice.IsCharacteristicVector`) and the statement that `L` is
  even exactly when `0` is characteristic (`IntegralLattice.isEven_iff_isCharacteristicVector_zero`);
* the character `e^{2πi·}` of `ℚ/ℤ` on `AddCircle (1 : ℚ)`, as a bundled additive character
  (`TauCeti.expCircle`, with `expCircle_coe`);
* metabolic finite quadratic modules (`FiniteQuadraticModule.IsMetabolic`), the Gauss-sum invariant
  `gaussSign ∈ ℤ/8` with its defining Gauss-sum formula for nondegenerate modules
  (`IsNondegenerate.gaussSum_eq`), additivity on orthogonal sums of nondegenerate modules
  (`gaussSign_prod`) and vanishing on metabolic modules (`gaussSign_eq_zero_of_isMetabolic`);
* the localization `ℤ_p ⊗ L` with its base-changed integral form, the completed rational form, and
  the canonical map into `ℚ_p ⊗ V` with injectivity, fullness and form compatibility
  (`IntegralLattice.LocalCarrier`, `localIntegralForm`, `completedRationalForm`,
  `localizationToCompletion`, `localizationToCompletion_injective`,
  `span_range_localizationToCompletion`, `completedRationalForm_localizationToCompletion`);
* Nikulin's generator modules `q_θ^{(p)}(p^k)`, `q_θ^{(2)}(2^k)`, `u^{(2)}(2^k)` and
  `v^{(2)}(2^k)` (`FiniteQuadraticModule.oddCyclic`, `dyadicCyclic`, `dyadicU`, `dyadicV`). -/

#check @TauCeti.IntegralLattice.scale
#check @TauCeti.IntegralLattice.dualCarrier_smul
#check @TauCeti.IntegralLattice.restrictFull
#check @TauCeti.IntegralLattice.restrict
#check @TauCeti.IntegralLattice.restrictFullIsometry
#check @TauCeti.IntegralLattice.IsCharacteristicVector
#check @TauCeti.IntegralLattice.isEven_iff_isCharacteristicVector_zero
#check @TauCeti.expCircle
#check @TauCeti.expCircle_coe
#check @TauCeti.FiniteQuadraticModule.IsMetabolic
#check @TauCeti.FiniteQuadraticModule.gaussSign
#check @TauCeti.FiniteQuadraticModule.IsNondegenerate.gaussSum_eq
#check @TauCeti.FiniteQuadraticModule.gaussSign_prod
#check @TauCeti.FiniteQuadraticModule.gaussSign_eq_zero_of_isMetabolic
#check @TauCeti.IntegralLattice.LocalCarrier
#check @TauCeti.IntegralLattice.localIntegralForm
#check @TauCeti.IntegralLattice.completedRationalForm
#check @TauCeti.IntegralLattice.localizationToCompletion
#check @TauCeti.IntegralLattice.localizationToCompletion_injective
#check @TauCeti.IntegralLattice.span_range_localizationToCompletion
#check @TauCeti.IntegralLattice.completedRationalForm_localizationToCompletion
#check @TauCeti.FiniteQuadraticModule.oddCyclic
#check @TauCeti.FiniteQuadraticModule.dyadicCyclic
#check @TauCeti.FiniteQuadraticModule.dyadicU
#check @TauCeti.FiniteQuadraticModule.dyadicV

open scoped TensorProduct
open Module

namespace IntegralLattice

variable {V : Type u} [AddCommGroup V] [Module ℚ V] (L : IntegralLattice V)

/-- **Layer 1L, van der Blij's congruence.** For a **unimodular** lattice and any
characteristic vector `w` in the sense of Tau Ceti's `IsCharacteristicVector`,

    t₊ − t₋ ≡ β(w, w)  (mod 8).

The signature difference is taken in `ℤ`, so no truncated `ℕ` subtraction can silently change
the statement. At `w = 0` this recovers 1I's corollary `8 ∣ t₊ − t₋` for even unimodular
lattices, and for `⟨1⟩` it is `w² ≡ 1 (mod 8)` for odd `w`. The pinned
`IsUnimodular.characteristicVector_integralNorm_modEq` gives only that all characteristic norms
agree modulo 8; the comparison with the signature is the target.

⚠ Unimodularity is load-bearing and not a convenience: for a merely nondegenerate integral
lattice the statement is false, and `⟨2⟩` is the witness — every vector is characteristic
because every value of the form is even, the signature difference is the odd number `1`, and
every `β(w,w) = 2k²` is even. `rankOne_one_characteristic_congruence_fails` below pins that
counterexample. -/
theorem vanDerBlij [FiniteDimensional ℚ V] [L.IsNondegenerate] (hU : L.IsUnimodular)
    {w : L} (hw : L.IsCharacteristicVector w) :
    Int.ModEq 8 ((L.sigPos : ℤ) - (L.sigNeg : ℤ)) (L.integralForm w w) := sorry

end IntegralLattice

/-! ### Nikulin's `l(A)`

`l(A)` is used by Nikulin's boundary conditions in Layer 5. It is named once here rather than
spelled out at each use. The character `e^{2πi·}` of `ℚ/ℤ` that Layer 1's Gauss-sum invariant and
Milgram's theorem use is Tau Ceti's `expCircle`; the theta-series roadmap's own character on its
real model is the same character read on representatives in a real inner product space, and is
that roadmap's. -/

/-- **Nikulin's `l(A)`**: the least number of generators of a finite abelian group. This is
real data, not a milestone: the formula *is* the convention being pinned. -/
noncomputable def minGenerators (A : Type*) [AddCommGroup A] : ℕ :=
  sInf {n : ℕ | ∃ s : Finset A, s.card = n ∧ AddSubgroup.closure (s : Set A) = ⊤}

namespace FiniteQuadraticModule

/-- **Nikulin's primary generators** (Nikulin Proposition 1.8.1): the odd cyclic module
`q_θ^{(p)}(p^k)` for an odd prime `p`, the dyadic cyclic module `q_θ^{(2)}(2^k)` for `k ≥ 1`, and
the two dyadic rank-two modules `u^{(2)}(2^k)` and `v^{(2)}(2^k)`. -/
inductive NikulinGenerator where
  | oddCyclic (p k : ℕ) (hp : p.Prime) (hodd : Odd p) (θ : ℤ)
  | dyadicCyclic (k : ℕ) (hk : 0 < k) (θ : ℤ)
  | dyadicU (k : ℕ)
  | dyadicV (k : ℕ)

/-- Positive exponent and unit parameter: the generators that are nondegenerate and nonzero. -/
def NikulinGenerator.IsAdmissible : NikulinGenerator → Prop
  | .oddCyclic p k _ _ θ => 0 < k ∧ ¬ (p : ℤ) ∣ θ
  | .dyadicCyclic _ _ θ => Odd θ
  | .dyadicU k => 0 < k
  | .dyadicV k => 0 < k

/-- The prime at which a generator is primary. -/
def NikulinGenerator.prime : NikulinGenerator → ℕ
  | .oddCyclic p _ _ _ _ => p
  | .dyadicCyclic _ _ _ => 2
  | .dyadicU _ => 2
  | .dyadicV _ => 2

/-- The finite quadratic module of a generator: Tau Ceti's native `oddCyclic (p^k)`,
`dyadicCyclic k`, `dyadicU k` or `dyadicV k`. -/
noncomputable def NikulinGenerator.toFiniteQuadraticModule :
    NikulinGenerator → TauCeti.FiniteQuadraticModule.{0}
  | .oddCyclic p k _ hodd θ => TauCeti.FiniteQuadraticModule.oddCyclic (p ^ k) hodd.pow θ
  | .dyadicCyclic k hk θ =>
      haveI : NeZero k := ⟨hk.ne'⟩
      TauCeti.FiniteQuadraticModule.dyadicCyclic k θ
  | .dyadicU k => TauCeti.FiniteQuadraticModule.dyadicU k
  | .dyadicV k => TauCeti.FiniteQuadraticModule.dyadicV k

/-- **The Gram determinant of the minimal `p`-adic realization of a generator**: `⟨θ·p^k⟩` for
`q_θ^{(p)}(p^k)`, `⟨θ·2^k⟩` for `q_θ^{(2)}(2^k)`, `2^k·U` (determinant `−4^k`) for `u^{(2)}(2^k)`
and `2^k·!![2,1;1,2]` (determinant `3·4^k`) for `v^{(2)}(2^k)`. -/
def NikulinGenerator.realizationDet : NikulinGenerator → ℤ
  | .oddCyclic p k _ _ θ => θ * (p : ℤ) ^ k
  | .dyadicCyclic k _ θ => θ * 2 ^ k
  | .dyadicU k => -(4 ^ k)
  | .dyadicV k => 3 * 4 ^ k

/-- The orthogonal sum of a finite list of generators; the empty list gives the zero module. -/
noncomputable def orthogonalSumNikulinGenerators :
    List NikulinGenerator → TauCeti.FiniteQuadraticModule.{0}
  | [] => TauCeti.FiniteQuadraticModule.ofQuadraticMap
      (0 : QuadraticMap ℤ PUnit.{1} (AddCircle (1 : ℚ)))
  | g :: gs => g.toFiniteQuadraticModule.prod (orthogonalSumNikulinGenerators gs)

/-- Concrete classification output: a list of admissible generators together with an actual
isometry onto their orthogonal sum. -/
structure NikulinDecomposition (A : TauCeti.FiniteQuadraticModule.{u}) where
  generators : List NikulinGenerator
  admissible : ∀ g ∈ generators, g.IsAdmissible
  isometry : A.Isometry (orthogonalSumNikulinGenerators generators)

/-- **Layer 1G, Nikulin Proposition 1.8.1, the generator classification.** Every nondegenerate
finite quadratic module is isometric to an orthogonal sum of admissible primary generators. -/
theorem exists_isometry_orthogonalSum_generators
    (A : TauCeti.FiniteQuadraticModule.{u}) (hA : A.IsNondegenerate) :
    Nonempty (NikulinDecomposition A) := sorry

/-! ### The invariants Nikulin's boundary conditions are stated in

`l(A_{q_p})`, the Gauss-sum invariant, the square class `discr K(q_p)`, and the dyadic
alternative "`q₂` has a summand `q_θ^{(2)}(2)`" are each named, so that the existence predicate
of Layer 5 can be written clause by clause instead of as a table. -/

/-- The `p`-primary component of a finite quadratic module: Tau Ceti's `restrict` to Mathlib's
`AddCommGroup.primaryComponent`, so its carrier is that subgroup and `minGenerators` and
`HasCyclicTwoSummand` apply to it. -/
noncomputable abbrev primaryComponent (A : TauCeti.FiniteQuadraticModule.{u}) (p : ℕ) :
    TauCeti.FiniteQuadraticModule.{u} :=
  A.restrict (AddCommGroup.primaryComponent A p)

/-- **Layer 1G**, the `p`-primary decomposition, in the form Nikulin's `l(A_q) = max_p l(A_{q_p})`
needs: every primary length is at most the total length. -/
theorem minGenerators_primaryComponent_le (A : TauCeti.FiniteQuadraticModule) (p : ℕ) :
    minGenerators (primaryComponent A p) ≤ minGenerators A := sorry

/-- and the maximum is attained at some prime, so `l(A_q) = max_p l(A_{q_p})` on the nose. -/
theorem exists_minGenerators_primaryComponent_eq (A : TauCeti.FiniteQuadraticModule) :
    ∃ p : ℕ, p.Prime ∧ minGenerators (primaryComponent A p) = minGenerators A := sorry

/-- **Layer 1G/1H, the rejection test for `IsLagrangian`'s quadratic isotropy.** A subgroup
that is Lagrangian only for the polar pairing does not force the Gauss sign to vanish: the
discriminant form of `A₁ ⊕ A₁` — the module `(ℤ/2)²` with `q(g₁) = q(g₂) = ¼` and
`b(g₁, g₂) = 0` — is nondegenerate, its glue class spans a subgroup with `H = H^⊥` and
`b|_{H×H} = 0`, and its Gauss sum is `2i`, so `gaussSign = 2 ≠ 0`. A definition of
`IsMetabolic` through `FiniteBilinearModule.IsLagrangian` alone would make
`gaussSign_eq_zero_of_isMetabolic` false. -/
theorem exists_bilinearLagrangian_gaussSign_ne_zero :
    ∃ (A : FiniteQuadraticModule.{u}) (H : AddSubgroup A), A.IsNondegenerate ∧
      A.toFiniteBilinearModule.IsLagrangian H ∧ A.gaussSign ≠ 0 := sorry

/-- **Nikulin's `discr K(q_p)`, read off a generator decomposition.** The `p`-primary generators
of a decomposition `D` of `A` are a decomposition of `q_p`, and the orthogonal sum of their
minimal realizations is a `p`-adic lattice `K(q_p)` of rank `l(A_{q_p})` with discriminant form
`q_p`; its determinant is the product of the `realizationDet`s. The value is the square class of
that product in `ℚ_p^*/(ℚ_p^*)²` (the product is nonzero for an admissible decomposition; the
other branch only makes the function total).

⚠ It is a function of `q_p` alone only where the minimal realization is unique up to isometry:
at odd `p`, and at `p = 2` exactly when `q₂` has no summand `q_θ^{(2)}(2)` (Nikulin Theorem
1.9.1). That independence is `padicDiscriminant_eq_squareClass_gramDet`, with the exception in its
hypothesis, and `padicDiscriminant_not_determined_by_cyclicTwoSummand` is the rejection test
showing the exception is real. -/
noncomputable def NikulinDecomposition.padicDiscriminant {A : TauCeti.FiniteQuadraticModule.{u}}
    (D : NikulinDecomposition A) (p : ℕ) [Fact p.Prime] : TauCeti.SquareClassGroup ℚ_[p] :=
  let d : ℤ := ((D.generators.filter fun g => g.prime = p).map
    NikulinGenerator.realizationDet).prod
  if h : d = 0 then TauCeti.squareClass (1 : ℚ_[p]ˣ)
  else TauCeti.squareClass (Units.mk0 (d : ℚ_[p]) (Int.cast_ne_zero.mpr h))

/-- **The dyadic alternative of Nikulin's condition (4)**: `q₂ ≅ q_θ^{(2)}(2) ⊕ q'` for some odd
`θ` and some `q'`. Condition (4) applies exactly when this **fails**, so it has to be a named
predicate and not an unstated side condition. -/
def HasCyclicTwoSummand (A : TauCeti.FiniteQuadraticModule.{u}) : Prop :=
  ∃ (θ : ℤ) (A' : TauCeti.FiniteQuadraticModule.{0}),
    Odd θ ∧ Nonempty (A.Isometry ((TauCeti.FiniteQuadraticModule.dyadicCyclic 1 θ).prod A'))

end FiniteQuadraticModule

section DiscriminantModules

variable {V : Type u} [AddCommGroup V] [Module ℚ V]
variable (L : IntegralLattice V) [L.IsNondegenerate]

open FiniteQuadraticModule in
/-- **Layer 5B, choice-independence of `discr K(q_p)`, with its exception.** An even
nondegenerate lattice whose rank is `l(A_{q_p})` and whose discriminant form has `p`-primary
part isometric to `q_p` localizes at `p` to a minimal realization `K(q_p)`, so the square class
of its Gram determinant is `discr K(q_p)` computed from any generator decomposition `D` of `A`: at
odd `p` unconditionally, and at `p = 2` only when `q₂` has no summand `q_θ^{(2)}(2)` (Nikulin
Theorem 1.9.1). Without the dyadic exception the statement is false, which
`padicDiscriminant_not_determined_by_cyclicTwoSummand` records. -/
theorem IntegralLattice.padicDiscriminant_eq_squareClass_gramDet
    (A : TauCeti.FiniteQuadraticModule.{u}) (D : NikulinDecomposition A) (p : ℕ) [Fact p.Prime]
    (hp : p ≠ 2 ∨ ¬ HasCyclicTwoSummand (primaryComponent A 2))
    (hL : L.IsEven) {ι : Type*} [Fintype ι] [DecidableEq ι] (e : Basis ι ℤ L.carrier)
    (hrank : Fintype.card ι = minGenerators (primaryComponent A p))
    (hq : Nonempty (TauCeti.FiniteQuadraticModule.Isometry
      (primaryComponent (L.discriminantQuadraticModule hL) p) (primaryComponent A p))) :
    ∃ u : ℚ_[p]ˣ, (u : ℚ_[p]) = ((L.gramDet e : ℤ) : ℚ_[p]) ∧
      TauCeti.squareClass u = D.padicDiscriminant p := sorry

end DiscriminantModules

section Layer1

/-! ## Layer 1: dual lattices, discriminant groups, overlattices, signature mod 8 -/

variable {V : Type v} [AddCommGroup V] [Module ℚ V]

/-- **Layer 1I, Milgram's theorem at every signature.** For an even nondegenerate lattice the
signature difference is the Gauss-sum invariant of its discriminant form:
`t₊ − t₋ ≡ sign q_L (mod 8)`, where `∑_{γ ∈ A_L} e(q_L(γ)) = √|A_L| · e(sign q_L / 8)` (Nikulin
Theorem 1.3.3; Milnor–Husemoller, Appendix 4). For unimodular `L` the discriminant module is
trivial and this is `8 ∣ t₊ − t₋` (Serre, *A Course in Arithmetic*, V.2, Theorem 2, Corollary 1).
`⟨2⟩` pins the sign: `A = ℤ/2` with `q = 1/4`, Gauss sum `1 + i = √2 · e(1/8)`, and `t₊ − t₋ = 1`. -/
theorem milgram [FiniteDimensional ℚ V] (L : IntegralLattice V) [L.IsNondegenerate]
    (hL : L.IsEven) :
    ((((L.sigPos : ℤ) - (L.sigNeg : ℤ) : ℤ) : ZMod 8)) =
      (L.discriminantQuadraticModule hL).gaussSign :=
  sorry

end Layer1

/-! ## Gram-level vocabulary

Isometry, local isometry and genus membership, written out at the level of Gram matrices. They
are expressible at the current Mathlib, they are what a class-number statement quantifies over,
and they are what a stored LMFDB record asserts, so they are named once here and used by
Layers 2, 4 and 9 alike. -/

/-- **Isometry of lattices, at the level of Gram matrices** (2C): integral congruence by a
matrix invertible over `ℤ`. Over `ℤ` this is `det P = ±1`, so `IsUnit P.det` is the whole
condition; positive definiteness is not needed for the definition. -/
def GramIsometric {n : ℕ} (G H : Matrix (Fin n) (Fin n) ℤ) : Prop :=
  ∃ P : Matrix (Fin n) (Fin n) ℤ, IsUnit P.det ∧ P.transpose * G * P = H

/-- **Local isometry at `p`** (3A, 3F): congruence over `ℤ_p`. Writing it by base change of
the Gram matrix is what keeps `p = 2` in scope, exactly as in the convention that localizes
with `LinearMap.BilinForm.baseChange` rather than `QuadraticForm.baseChange`. -/
def GramIsometricAt (p : ℕ) [Fact p.Prime] {n : ℕ} (G H : Matrix (Fin n) (Fin n) ℤ) : Prop :=
  ∃ P : Matrix (Fin n) (Fin n) ℤ_[p], IsUnit P.det ∧
    P.transpose * G.map (Int.cast : ℤ → ℤ_[p]) * P = H.map (Int.cast : ℤ → ℤ_[p])

/-- **Membership in one genus** (3F), written out: congruence over every `ℤ_p` **together with**
the real signature. The genus is defined by both halves and this definition carries both, so
that the indefinite statement of 4E and the positive definite one of 9A are about the same
notion; in the positive definite case the signature clause is implied by definiteness on both
sides, and carrying it is then harmless rather than wrong. -/
def GramSameGenus {n : ℕ} (G H : Matrix (Fin n) (Fin n) ℤ) : Prop :=
  (∀ (p : ℕ) [Fact p.Prime], GramIsometricAt p G H) ∧
    sigPos (Matrix.toQuadraticForm' (G.map (Int.cast : ℤ → ℝ)))
        = sigPos (Matrix.toQuadraticForm' (H.map (Int.cast : ℤ → ℝ))) ∧
      sigNeg (Matrix.toQuadraticForm' (G.map (Int.cast : ℤ → ℝ)))
        = sigNeg (Matrix.toQuadraticForm' (H.map (Int.cast : ℤ → ℝ)))

section Layer2

/-! ## Layer 2: positive definite lattices — automorphisms, reduction, covolume -/

/-- **Layer 2G, reduction-theory finiteness — the first of the three class-number branches, and
one of the two this roadmap owns.** There are finitely many positive
definite integral lattices of given rank and determinant up to isometry: every class
contains a (Minkowski-)reduced Gram matrix, and reduced Gram matrices of bounded
determinant have bounded entries.

⚠ Definiteness is a hypothesis of this theorem and not a convenience. The proof is reduction
theory, it does not extend to indefinite forms, and O'Meara 103:4 — the statement for every
nondegenerate lattice — is **not** what this is. See `finite_genusClasses_rank_two`
for the second branch and the note beside it for the third. -/
theorem finite_classes_of_posDef (n : ℕ) (d : ℤ) :
    ∃ S : Finset (Matrix (Fin n) (Fin n) ℤ), ∀ G : Matrix (Fin n) (Fin n) ℤ,
      G.IsSymm → (Matrix.toQuadraticForm' G).PosDef → G.det = d →
        ∃ H ∈ S, GramIsometric G H :=
  sorry



end Layer2

section Layer4

/-! ## Layer 4: the class-number finiteness branches

There are three, with three unrelated proofs, and this roadmap owns two. Nothing here is a
`finite_genusClassSet` covering all of them: such a statement would silently claim the third.
The definite branch is `finite_classes_of_posDef` in Layer 2, proved by reduction. The rank-2
branch is below, proved through ideal classes.

⚠ **The third branch is not stated in this file and must not be added to it.** For an
indefinite nondegenerate lattice of rank at least 3 the class number is finite because Eichler's
theorem identifies proper classes with proper spinor genera and 4C counts the latter; that runs
through strong approximation for `Spin`, which no supplier in this portfolio exports. It is
`OrthogonalTamagawaAndLatticeMass`'s 4D together with the rank-`≥ 3` half of 4E
(`README.md`, §*Scope*). A contributor who wants one theorem covering every rank is being asked
for the successor's, not for a generalization of either theorem here. -/

/-- **Layer 4E, rank 2 — the second of the three class-number branches, and the other one this
roadmap owns.** For a nondegenerate binary lattice the classes in a genus inject into the
invertible proper ideal classes of the quadratic order `𝒪(L)` of B1, by the dictionary of B2,
and that group is the consumed `Pic 𝒪_Δ` for `Δ < 0` and `NarrowPic 𝒪_Δ` for `Δ > 0`, both
finite by `GlobalNumberFields.finite_pic` and `finite_narrowPic`. In the square-discriminant
branch B5 counts the split classes directly.

⚠ Rank 2 is stated separately because the rank-`≥ 3` proof does not cover it and this proof does
not extend: the argument is the arithmetic of a quadratic order, and it stops as soon as the
norm form is no longer binary. The name says `rank_two` and not `indefinite_rank_two` because
indefiniteness is not a hypothesis: the ideal-class proof covers definite binary lattices too,
where it agrees with `finite_classes_of_posDef`. It is 4E's rank-2 half that this discharges,
and 4E's rank-`≥ 3` half is the successor's. -/
theorem finite_genusClasses_rank_two (G : Matrix (Fin 2) (Fin 2) ℤ)
    (hs : G.IsSymm) (hd : G.det ≠ 0) :
    ∃ S : Finset (Matrix (Fin 2) (Fin 2) ℤ), ∀ H : Matrix (Fin 2) (Fin 2) ℤ,
      H.IsSymm → GramSameGenus G H → ∃ H' ∈ S, GramIsometric H' H :=
  sorry

end Layer4

section Layer5Nikulin

/-! ## Layer 5B and 5J: Nikulin's boundary predicates, clause by clause

These are the highest-risk statements of the roadmap, and they are typed here rather than left
as tables in `README.md`. Each condition of Nikulin Theorem 1.10.1 and of Theorem 3.6.2 is one
field, with its own hypothesis visible in its own type, and each existence theorem is stated as
a literal `↔`.

⚠ A single field named `localConditions`, or any packaging that hides which clause applies at
which prime and at which boundary, is an explicit **rejection test**. The whole point of the
source audit behind Layer 5 is that one omitted boundary clause produces a statement that is
not Nikulin's theorem and that no reviewer of the proof would catch. -/

/-- **Nikulin Theorem 1.10.1, the four conditions.** An even lattice with invariants
`(t₊, t₋, q)` exists exactly when these hold. Conditions 3 and 4 are the boundary conditions:
they apply only at the equality `t₊ + t₋ = l(A_{q_p})`, condition 4 additionally switches off
when `q₂` has a summand `q_θ^{(2)}(2)`, and the two determinant clauses differ — condition 3
carries the sign `(−1)^{t₋}` while condition 4 allows either sign. `discr K(q_p)` is read off a
generator decomposition `D` of `q`; where the conditions read it, it does not depend on `D`
(`padicDiscriminant_eq_squareClass_gramDet`). -/
structure NikulinExistenceConditions (tp tm : ℕ) (q : FiniteQuadraticModule)
    (D : FiniteQuadraticModule.NikulinDecomposition q) : Prop where
  /-- (1) The signature is congruent to the Gauss-sum invariant mod 8. -/
  signature_congr : (((tp : ℤ) - (tm : ℤ) : ℤ) : ZMod 8) = q.gaussSign
  /-- (2) The rank is at least `l(A_q)`. Nikulin's `t₊ ≥ 0` and `t₋ ≥ 0` are carried by `ℕ`. -/
  minGenerators_le : minGenerators q ≤ tp + tm
  /-- (3) At every **odd** prime where the rank meets `l(A_{q_p})` exactly, the determinant
  square class is pinned, with the sign `(−1)^{t₋}`. The existential says both that the number
   is nonzero in `ℚ_p` (a unit of the FIELD, not necessarily of `ℤ_p`) and has square class
   `discr K(q_p)`. Its exact valuation equals `v_p(|A_q|)`; at that fixed valuation, the ratio
   comparison is a unit-square test. -/
  odd_boundary : ∀ (p : ℕ) [Fact p.Prime], p ≠ 2 →
    tp + tm = minGenerators (FiniteQuadraticModule.primaryComponent q p) →
    ∃ u : ℚ_[p]ˣ, (u : ℚ_[p]) = (((-1) ^ tm * (Nat.card q : ℤ) : ℤ) : ℚ_[p]) ∧
      TauCeti.squareClass u = D.padicDiscriminant p
  /-- (4) The dyadic clause. It applies only when the rank meets `l(A_{q₂})` exactly **and**
  `q₂` has no summand `q_θ^{(2)}(2)`, and then `|A_q|` matches `discr K(q₂)` up to a sign that
  is not fixed. -/
  dyadic_boundary :
    tp + tm = minGenerators (FiniteQuadraticModule.primaryComponent q 2) →
    ¬ FiniteQuadraticModule.HasCyclicTwoSummand (FiniteQuadraticModule.primaryComponent q 2) →
    ∃ (ε : ℤ) (u : ℚ_[2]ˣ), (ε = 1 ∨ ε = -1) ∧
      (u : ℚ_[2]) = ((ε * (Nat.card q : ℤ) : ℤ) : ℚ_[2]) ∧
        TauCeti.squareClass u = D.padicDiscriminant 2

/-- **The left-hand side of 5B**: an even lattice with invariants `(t₊, t₋, q)` exists. It is
nondegenerate and even, its signature triple is `(t₊, 0, t₋)`, and its discriminant quadratic
module — in the half-norm `ℚ/ℤ` convention of `README.md`, not Nikulin's `ℚ/2ℤ` one — is
isometric to `q`. The ambient space has the right dimension, so no rank hypothesis is
implicit. -/
def EvenLatticeWithInvariants (tp tm : ℕ) (q : FiniteQuadraticModule) : Prop :=
  ∃ (L : IntegralLattice (Fin (tp + tm) → ℚ)) (hnd : L.IsNondegenerate) (hev : L.IsEven),
    L.signature = (tp, 0, tm) ∧
      Nonempty (letI := hnd; (L.discriminantQuadraticModule hev).Isometry q)

/-- **Layer 5B, Nikulin Theorem 1.10.1, as a literal necessary-and-sufficient statement.**
Nondegeneracy of `q` is a hypothesis: the generator classification, the Gauss-sum invariant and
`discr K(q_p)` are all stated for nondegenerate finite quadratic forms only. -/
theorem exists_evenLattice_iff (tp tm : ℕ) (q : FiniteQuadraticModule)
    (hq : q.IsNondegenerate) (D : FiniteQuadraticModule.NikulinDecomposition q) :
    EvenLatticeWithInvariants tp tm q ↔ NikulinExistenceConditions tp tm q D :=
  sorry

/-- **Layer 5B, Nikulin Corollary 1.10.2**, the sufficient form under the *strict* inequality.
⚠ This is not a restatement of `exists_evenLattice_iff`, and it does not replace it: the strict
inequality is what makes conditions 3 and 4 vacuous, and at equality they are exactly what
decides existence. -/
theorem exists_evenLattice_of_lt (tp tm : ℕ) (q : FiniteQuadraticModule)
    (hq : q.IsNondegenerate)
    (hsign : (((tp : ℤ) - (tm : ℤ) : ℤ) : ZMod 8) = q.gaussSign)
    (hrank : minGenerators q < tp + tm) :
    EvenLatticeWithInvariants tp tm q :=
  sorry

/-- **Nikulin Theorem 3.6.2, the seven conditions** for an even `2`-elementary lattice with
invariants `(δ_S; t₊, t₋, a)`. Conditions 4 to 7 are boundary clauses at `a = 0`, `a = 1`,
`a = 2` and `a = t₊ + t₋`, and none of them follows from the ones before it; `README.md`
records a witness tuple for each. -/
structure TwoElementaryAdmissible (δ : ZMod 2) (tp tm a : ℕ) : Prop where
  /-- (1) `a ≤ t₊ + t₋`. -/
  le_rank : a ≤ tp + tm
  /-- (2) `t₊ + t₋ + a ≡ 0 (mod 2)`. -/
  parity : ((tp + tm + a : ℕ) : ZMod 2) = 0
  /-- (3) `t₊ − t₋ ≡ 0 (mod 4)` when `δ_S = 0`. -/
  four_of_delta_zero : δ = 0 → (((tp : ℤ) - (tm : ℤ) : ℤ) : ZMod 4) = 0
  /-- (4) `δ_S = 0` and `t₊ − t₋ ≡ 0 (mod 8)` when `a = 0`, which is 1I for a unimodular
  lattice. -/
  unimodular_of_a_zero : a = 0 → δ = 0 ∧ (((tp : ℤ) - (tm : ℤ) : ℤ) : ZMod 8) = 0
  /-- (5) `t₊ − t₋ ≡ ±1 (mod 8)` when `a = 1`. -/
  pm_one_of_a_one : a = 1 →
    (((tp : ℤ) - (tm : ℤ) : ℤ) : ZMod 8) = 1 ∨ (((tp : ℤ) - (tm : ℤ) : ℤ) : ZMod 8) = -1
  /-- (6) `δ_S = 0` when `a = 2` and `t₊ − t₋ ≡ 4 (mod 8)`. -/
  delta_zero_of_a_two : a = 2 → (((tp : ℤ) - (tm : ℤ) : ℤ) : ZMod 8) = 4 → δ = 0
  /-- (7) `t₊ − t₋ ≡ 0 (mod 8)` when `δ_S = 0` and `a = t₊ + t₋`. -/
  eight_of_a_eq_rank : δ = 0 → a = tp + tm → (((tp : ℤ) - (tm : ℤ) : ℤ) : ZMod 8) = 0

/-- **The left-hand side of 5J**: an even `2`-elementary lattice with invariants
`(δ_S; t₊, t₋, a)` exists. `2`-elementary is `A_S ≅ (ℤ/2)^a` as an actual additive equivalence,
and `δ_S = 0` is the statement that the half-norm discriminant form takes values in
`½ℤ/ℤ` — equivalently that `q_S` has no `q_θ^{(2)}(2)` summand, which is where Nikulin's
full-norm `ℚ/2ℤ` convention would put integrality. Nondegeneracy is asserted by the second
binder even though the half-norm form of 1D is defined without it. -/
def TwoElementaryLatticeWithInvariants (δ : ZMod 2) (tp tm a : ℕ) : Prop :=
  ∃ (L : IntegralLattice (Fin (tp + tm) → ℚ)) (_hnd : L.IsNondegenerate) (hev : L.IsEven),
    L.signature = (tp, 0, tm) ∧
      Nonempty (L.DiscriminantGroup ≃+ (Fin a → ZMod 2)) ∧
        (δ = 0 ↔ ∀ x : L.DiscriminantGroup,
          L.discriminantQuadraticMap hev x + L.discriminantQuadraticMap hev x = 0)

/-- **Layer 5J, Nikulin Theorem 3.6.2, as a literal necessary-and-sufficient statement.** -/
theorem exists_twoElementaryLattice_iff (δ : ZMod 2) (tp tm a : ℕ) :
    TwoElementaryLatticeWithInvariants δ tp tm a ↔ TwoElementaryAdmissible δ tp tm a :=
  sorry

/-- **Layer 5J, the four independence witnesses.** Each tuple satisfies every condition before
the named one and fails that one, so no clause of `TwoElementaryAdmissible` is implied by its
predecessors. These are decidable arithmetic checks, and they are what stops a contributor from
dropping a clause. -/
theorem twoElementaryAdmissible_independence :
    ¬ TwoElementaryAdmissible 0 4 0 0 ∧ ¬ TwoElementaryAdmissible 1 3 0 1 ∧
      ¬ TwoElementaryAdmissible 1 4 0 2 ∧ ¬ TwoElementaryAdmissible 0 4 0 4 :=
  sorry

end Layer5Nikulin

section Layer6

/-! ## Layer 6: unimodular lattices in low rank -/

/-- **Layer 6, indefinite even unimodular uniqueness.** Two even unimodular
integral lattices that are indefinite with equal signatures are isometric
(`II_{t₊,t₋} ≅ U^{min(t₊,t₋)} ⊕ E₈(±1)^{|t₊−t₋|/8}`; Serre V.2.2, Milnor–Husemoller
II §5; via Nikulin Corollary 1.13.3 in the discriminant-form route). The definite
analogue is false from rank 16 on (`E₈²` vs `D₁₆⁺`). -/
theorem equivalent_of_isEven_unimodular_indefinite {n : ℕ} (G₁ G₂ : Matrix (Fin n) (Fin n) ℤ)
    (h₁s : G₁.IsSymm) (h₂s : G₂.IsSymm)
    (h₁e : ∀ i, 2 ∣ G₁ i i) (h₂e : ∀ i, 2 ∣ G₂ i i)
    (h₁u : G₁.det = 1 ∨ G₁.det = -1) (h₂u : G₂.det = 1 ∨ G₂.det = -1)
    (hp : sigPos (Matrix.toQuadraticForm' (G₁.map (Int.cast : ℤ → ℝ)))
        = sigPos (Matrix.toQuadraticForm' (G₂.map (Int.cast : ℤ → ℝ))))
    (hn : sigNeg (Matrix.toQuadraticForm' (G₁.map (Int.cast : ℤ → ℝ)))
        = sigNeg (Matrix.toQuadraticForm' (G₂.map (Int.cast : ℤ → ℝ))))
    (hindef : 0 < sigPos (Matrix.toQuadraticForm' (G₁.map (Int.cast : ℤ → ℝ))) ∧
        0 < sigNeg (Matrix.toQuadraticForm' (G₁.map (Int.cast : ℤ → ℝ)))) :
    (Matrix.toBilin' G₁).Equivalent (Matrix.toBilin' G₂) :=
  sorry

end Layer6

/-! ## What this file supplies to the theta-series roadmap

The theta series of a positive definite lattice, its transformation laws, its modularity and
every conclusion drawn from them are the [theta-series roadmap](../ThetaSeries/README.md)'s,
and this file states none of them. The dependency runs one way: that roadmap imports this
file, and its Layer-2 bridge builds an `IntegralLattice (ℚ ⊗[ℤ] L)` out of its real carrier
and reads the declarations below across it. This file imports nothing from it and names none
of its declarations as an input (`README.md`, §*Scope* and Layer 8).

The declarations supplied are:

* Tau Ceti's carrier `TauCeti.IntegralLattice` with `IsEven`, `IsNondegenerate`, `IsUnimodular`
  and `IsPosDef`, the dual carrier and the discriminant group with its cardinality,
  `discriminantBilinearModule` and `discriminantQuadraticModule`, and `FiniteBilinearModule` and
  `FiniteQuadraticModule` with `IsIsotropic` and `IsLagrangian` (0A, 1B–1D, 1G);
* `minGenerators`, `FiniteQuadraticModule.primaryComponent` and
  `FiniteQuadraticModule.NikulinDecomposition` — the finite-module vocabulary this file adds
  (1G);
* Tau Ceti's character `expCircle` of `ℚ/ℤ` (1D) and its Gauss-sum invariant `gaussSign`, with
  `IsNondegenerate.gaussSum_eq` and `gaussSign_prod` (1H), and Milgram's theorem at every
  signature, `milgram` (1I);
* Tau Ceti's overlattice correspondences `integralOverlatticeEquivIsotropicSubgroup`,
  `evenOverlatticeEquivIsotropicSubgroup` and `ofIsotropicSubgroup`, and the orthogonal quotient,
  through which `D₁₆⁺` is built (1E, 1F);
* Tau Ceti's ADE lattices `typeARootLattice`, `typeE₈RootLattice` and `d8PlusLattice` with their
  discriminant forms and the `D₈⁺ ≅ E₈` calculation (1K);
* the shells and representation numbers of 2B, the covolume identity of Layer 2, and the
  rank-16 pair of 6D and the rank-24 reference lattices of 6E, which are README milestones.

⚠ What is proved *from* a theta series lives there and is not restated here: that every even
unimodular lattice of rank `8` has `r_L(2m) = 240 σ₃(m)`, that every one of rank `16` has the
same theta series `E₄²` — whose non-isometric witnesses `E₈ ⊕ E₈` and `D₁₆⁺` are 6D's — and
the rank-`24` identities. Here `r_{E₈}(2) = 240` is a finite count (2B, 6G), not a
`q`-expansion coefficient, and the identification of shell counts with `q`-expansion
coefficients is that roadmap's theorem in its real model.

⚠ Milgram runs one way too. Milgram's theorem `t₊ − t₋ ≡ sign q_L (mod 8)` for an even
nondegenerate lattice, stated through Tau Ceti's `gaussSign`, is **this** roadmap's at every
signature, proved arithmetically; the theta-series roadmap proves the positive-definite
instance `∑_{γ} e(q_L(γ)) = |A_L|^{1/2} e(n/8)` by theta asymptotics for its own Gauss-sum
layer, and its own scope section says so. Both are wanted, its bridge identifies them, and
neither is derived from the other.

⚠ Nothing here weakens the positive-definiteness that roadmap builds into its carrier. The
indefinite Siegel–Narain theta, summed against a maximal positive definite subspace of
`L ⊗ ℝ`, is not obtained from anything in either roadmap by dropping a hypothesis; it is the
successor `IndefiniteThetaAndSiegelWeil`'s (`README.md`, §*Scope*), together with the
indefinite Siegel–Weil theorem and the genus averages it evaluates.

⚠ The half-norm convention is the same on both sides. `discriminantQuadraticForm` is
`q_L(x̄) = B(x,x)/2 mod ℤ` in `AddCircle (1 : ℚ)`, so a discriminant-form value enters an
exponent through `expCircle` with no factor of two to insert, and Nikulin's full-norm `ℚ/2ℤ`
values are halved at the boundary. A contributor who finds `e^{π i q}` in a source has found
the full-norm convention, not a discrepancy. -/

section Layer9

/-! ## Layer 9: what a stored LMFDB lattice record asserts

The Gram-level vocabulary — `GramIsometric`, `GramIsometricAt`, `GramSameGenus` — is the one
fixed before Layer 2, so a certificate and a class-number theorem talk about the same notions.

⚠ The record splits in two, and the split is the point. `StoredGenusCertificate` carries the
**semantic** columns, each of which is a finite check about the stored matrices.
`StoredClassNumberCertificate` carries **completeness**, which no milestone of this roadmap
proves, and it carries it as a named imported hypothesis rather than as a bare field. -/

/-- **Layer 9A, the stored record as one object.** Each field is a statement an LMFDB
lattice record asserts, and nothing here is a placeholder: every condition is spelled out
in terms of the stored matrices, so no unintended model satisfies it. The label
`dim.det.level.class_number.index` contributes the three fields named after its first three
components; its fifth component is an insertion-order serial with no mathematical content and
has no field, and its `class_number` component belongs to `StoredClassNumberCertificate` below.

Genus membership is 3F written out, as `GramSameGenus`: congruence over every `ℤ_p` together
with the real signature.

⚠ There is deliberately **no completeness field and no `class_number` field here**. A list of
pairwise non-isometric lattices in one genus is not thereby the whole genus; 2G gives finiteness
of the class set, which is a different statement from identifying it. Putting `class_number`
beside the semantic columns would make every certificate assert exhaustiveness, which is exactly
not supplied by the semantic record alone. Actual classifications or certified enumerations
can establish it, just as exact mass and connectivity routes can. -/
structure StoredGenusCertificate where
  /-- The label component `dim`, and the size of the stored Gram matrix. -/
  dim : ℕ
  /-- The stored lattices have positive rank, which is what makes the minimum and the
  kissing number of 2B defined. -/
  dim_pos : 0 < dim
  /-- The stored Gram matrix. -/
  gram : Matrix (Fin dim) (Fin dim) ℤ
  /-- It is symmetric, so it is the Gram matrix of a lattice form (0A, 0C). -/
  gram_isSymm : gram.IsSymm
  /-- It is positive definite, which is what makes 0A to 0E, 2B, 2C and 2G apply (0E). -/
  gram_posDef : (Matrix.toQuadraticForm' gram).PosDef
  /-- The label component `det`, the Gram determinant of 0C. -/
  det : ℤ
  /-- and it is that determinant. -/
  det_eq : det = gram.det
  /-- The label component `level`, in the shape 0D fixes it: the least positive `N` for
  which `N·G⁻¹` is integral with even diagonal. -/
  level : ℕ
  /-- and it is that least element. -/
  level_isLeast :
    IsLeast {N : ℕ | 0 < N ∧ ∃ M : Matrix (Fin dim) (Fin dim) ℤ, (∀ i, 2 ∣ M i i) ∧
      M.map (Int.cast : ℤ → ℚ) = (N : ℚ) • (gram.map (Int.cast : ℤ → ℚ))⁻¹} level
  /-- The stored minimum, `min L` of 2B: the least norm of a nonzero vector. -/
  minimum : ℤ
  /-- and it is that least element. -/
  minimum_isLeast :
    IsLeast {k : ℤ | ∃ x : Fin dim → ℤ, x ≠ 0 ∧ Matrix.toBilin' gram x x = k} minimum
  /-- The stored kissing number, `#S_{min L}(L)` of 2B. -/
  kissing : ℕ
  /-- and it counts the minimal shell. -/
  kissing_eq : kissing = Nat.card {x : Fin dim → ℤ // Matrix.toBilin' gram x x = minimum}
  /-- The stored automorphism group order, `|O(L)|` of 2C, at the level of Gram
  matrices. -/
  autOrder : ℕ
  /-- and it counts the integral congruences of `G` with itself. -/
  autOrder_eq :
    autOrder = Nat.card {P : Matrix (Fin dim) (Fin dim) ℤ // P.transpose * gram * P = gram}
  /-- The stored representation numbers `r_L(k) = #S_k(L)` of 2B, which the record's own
  column calls the theta series. They are shell **counts** here, and the assertion below is a
  count and not an identity of analytic functions: that they are the `q`-expansion
  coefficients of `Θ_L` is the theta-series roadmap's theorem, in its real model. -/
  repNum : ℕ → ℕ
  /-- and each one counts its shell. -/
  repNum_eq :
    ∀ k : ℕ, repNum k = Nat.card {x : Fin dim → ℤ // Matrix.toBilin' gram x x = (k : ℤ)}
  /-- The stored genus representatives. -/
  reps : List (Matrix (Fin dim) (Fin dim) ℤ)
  /-- Each one is the Gram matrix of a positive definite lattice. -/
  reps_posDef : ∀ H ∈ reps, H.IsSymm ∧ (Matrix.toQuadraticForm' H).PosDef
  /-- Each one lies in `gen L`, by 3F. -/
  reps_mem_genus : ∀ H ∈ reps, GramSameGenus gram H
  /-- They are pairwise non-isometric, which is a decidable check for positive definite
  lattices by 2G. -/
  reps_pairwise : reps.Pairwise fun H H' => ¬ GramIsometric H H'

/-- **The mass of a positive definite genus, at the level of Gram matrices** (7A). This says
that the genus of `G` has a finite complete set of representatives whose reciprocal
automorphism orders sum to `m`. It is a definition, not a theorem: 7A defines the mass and 2G
gives finiteness of the class set, but **no milestone of this roadmap evaluates it**. The
Conway–Sloane evaluation is `OrthogonalTamagawaAndLatticeMass`'s 7H. -/
def IsGenusMass {n : ℕ} (G : Matrix (Fin n) (Fin n) ℤ) (m : ℚ) : Prop :=
  ∃ S : Finset (Matrix (Fin n) (Fin n) ℤ),
    (∀ H ∈ S, H.IsSymm ∧ (Matrix.toQuadraticForm' H).PosDef ∧ GramSameGenus G H) ∧
      ((S : Set (Matrix (Fin n) (Fin n) ℤ)).Pairwise fun H H' => ¬ GramIsometric H H') ∧
        (∀ H : Matrix (Fin n) (Fin n) ℤ, H.IsSymm → (Matrix.toQuadraticForm' H).PosDef →
          GramSameGenus G H → ∃ H' ∈ S, GramIsometric H' H) ∧
          m = ∑ H ∈ S,
            (1 : ℚ) / (Nat.card {P : Matrix (Fin n) (Fin n) ℤ // P.transpose * H * P = H} : ℚ)

/-- **Layer 9B, the mass-route completeness certificate.** Exhaustiveness of a stored list
is separate from its semantic columns. `mass_isGenusMass` supplies a proved mass identity and
`reps_exhaust_mass` checks that the listed classes account for it. The exact identity can come
from the successor's mass formula, a direct low-rank calculation, or an exhaustive classification
or certified enumeration via `IsGenusMass`. A neighbour-connectivity route must include an
exhaustive search; 4G's edge relation alone is not such a theorem. -/
structure StoredClassNumberCertificate extends StoredGenusCertificate where
  /-- The rational number an exact mass identity supplies for this genus. -/
  mass : ℚ
  /-- **The exact mass identity, required as data rather than inferred from a list.** -/
  mass_isGenusMass : IsGenusMass toStoredGenusCertificate.gram mass
  /-- The finite check: the listed representatives already carry the whole mass. -/
  reps_exhaust_mass :
    mass = ∑ H ∈ toStoredGenusCertificate.reps.toFinset,
      (1 : ℚ) / (Nat.card {P : Matrix (Fin toStoredGenusCertificate.dim)
        (Fin toStoredGenusCertificate.dim) ℤ //
          P.transpose * H * P = H} : ℚ)
  /-- The label component `class_number`, the invariant of 4A, finite by 2G. -/
  classNumber : ℕ
  /-- and it is the length of the list. -/
  classNumber_eq : classNumber = toStoredGenusCertificate.reps.length

/-- **Layer 9B, completeness is a theorem and not a field.** Given the imported mass, the
listed representatives exhaust the genus: they are distinct classes in it, `1/|O(M)|` is an
isometry invariant and strictly positive, so a proper sublist would sum to strictly less than
the mass. -/
theorem StoredClassNumberCertificate.reps_complete (c : StoredClassNumberCertificate)
    (H : Matrix (Fin c.dim) (Fin c.dim) ℤ) (hs : H.IsSymm)
    (hp : (Matrix.toQuadraticForm' H).PosDef) (hgen : GramSameGenus c.gram H) :
    ∃ H' ∈ c.reps, GramIsometric H' H :=
  sorry

/-- **Layer 9B, what the certificate buys.** Completeness and pairwise non-isometry say
together that the stored list is a set of representatives on the nose: every positive
definite lattice in the genus is isometric to exactly one entry. This is the statement the
`class_number` column asserts, and it is why it lives on this record and not on 9A's. -/
theorem StoredClassNumberCertificate.existsUnique_rep (c : StoredClassNumberCertificate)
    (H : Matrix (Fin c.dim) (Fin c.dim) ℤ)
    (hs : H.IsSymm) (hp : (Matrix.toQuadraticForm' H).PosDef)
    (hgen : GramSameGenus c.gram H) :
    ∃! H' : Matrix (Fin c.dim) (Fin c.dim) ℤ, H' ∈ c.reps ∧ GramIsometric H' H :=
  sorry

end Layer9

/-! ## Rejection tests on the foundation's rank-one lattices

The two tests below apply statements of this file to Tau Ceti's rank-one lattices
`rankOne m = ⟨2m⟩`: they show that the unimodularity hypothesis of `vanDerBlij` and the dyadic
hypothesis of `padicDiscriminant_eq_squareClass_gramDet` cannot be dropped. -/

section RankOneRejection

/-- **Layer 1L, the rejection test for `vanDerBlij`'s unimodularity hypothesis.** For the
rank-one lattice `⟨2⟩` — `rankOne 1` in this file's `⟨2m⟩` parametrization — every value of the
form is even, so every vector, the zero vector included, is characteristic; the signature
difference is `1`; and every characteristic norm `2k²` is even. The congruence of `vanDerBlij`
therefore fails at every characteristic vector, so the statement with nondegeneracy in place of
unimodularity is false. -/
theorem rankOne_one_characteristic_congruence_fails :
    let L : IntegralLattice ℚ := rankOne 1
    (∀ w : L.carrier, L.IsCharacteristicVector w) ∧
      ∀ w : L.carrier,
        ¬ Int.ModEq 8 ((L.sigPos : ℤ) - (L.sigNeg : ℤ)) (L.integralForm w w) := sorry

/-- **Layer 5B, the rejection test for `padicDiscriminant`'s dyadic exception.** `rankOne 1 = ⟨2⟩`
and `rankOne 5 = ⟨10⟩` are even of rank `1 = l(A_{q₂})`; the 2-primary parts of their
discriminant forms are isometric — both are `ℤ/2` with half-norm value `1/4 = 5/4` in `ℚ/ℤ`,
the form `q_1^{(2)}(2) = q_5^{(2)}(2)` — and their Gram determinants `2` and `10` have different
square classes in `ℚ₂`, because `5` is not a 2-adic square. So both are minimal 2-adic
realizations of one `q₂` with different `discr`, and `padicDiscriminant_eq_squareClass_gramDet`
is false at `p = 2` without its `HasCyclicTwoSummand` hypothesis. -/
theorem padicDiscriminant_not_determined_by_cyclicTwoSummand :
    let L₂ : IntegralLattice ℚ := rankOne 1
    let L₁₀ : IntegralLattice ℚ := rankOne 5
    let q₂ : FiniteQuadraticModule :=
      FiniteQuadraticModule.primaryComponent (L₂.discriminantQuadraticModule (isEven_rankOne 1)) 2
    let q₁₀ : FiniteQuadraticModule :=
      FiniteQuadraticModule.primaryComponent (L₁₀.discriminantQuadraticModule (isEven_rankOne 5)) 2
    Nonempty (q₂.Isometry q₁₀) ∧
      minGenerators q₂ = 1 ∧ minGenerators q₁₀ = 1 ∧
      (∃ e : Basis (Fin 1) ℤ L₂.carrier, L₂.gramDet e = 2) ∧
      (∃ e : Basis (Fin 1) ℤ L₁₀.carrier, L₁₀.gramDet e = 10) ∧
      TauCeti.squareClass (Units.mk0 (2 : ℚ_[2]) two_ne_zero) ≠
        TauCeti.squareClass (Units.mk0 (10 : ℚ_[2]) (by norm_num)) := sorry

end RankOneRejection

end TauCetiRoadmap.IntegralLattices
