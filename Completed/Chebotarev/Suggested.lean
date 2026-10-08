import Mathlib
import TauCeti.Algebra.Group.Conj
import TauCeti.Algebra.Group.ConjFinite
import TauCeti.Algebra.Group.Subgroup.ZPowers
import TauCeti.FieldTheory.Galois.FiberProduct
import TauCeti.FieldTheory.Galois.FixedField
import TauCeti.GroupTheory.Perm.FinThree.Character
import TauCeti.NumberTheory.ArithmeticDirichletSeries.EulerProduct.Analytic
import TauCeti.NumberTheory.ArithmeticDirichletSeries.EulerProduct.Restrict
import TauCeti.NumberTheory.ArithmeticDirichletSeries.Prime.IdealZetaSum
import TauCeti.NumberTheory.ArithmeticDirichletSeries.ResidueDegree
import TauCeti.NumberTheory.Chebotarev.AuxiliaryPrime
import TauCeti.NumberTheory.Chebotarev.Crossing.CompositumFrobenius
import TauCeti.NumberTheory.Chebotarev.Crossing.CompositumRamification
import TauCeti.NumberTheory.Chebotarev.Crossing.CyclicFour
import TauCeti.NumberTheory.Chebotarev.Crossing.TaggedFibres
import TauCeti.NumberTheory.Chebotarev.Density.Abelian
import TauCeti.NumberTheory.Chebotarev.Density.Chebotarev
import TauCeti.NumberTheory.Chebotarev.Density.Cyclotomic
import TauCeti.NumberTheory.Chebotarev.Density.FixedField
import TauCeti.NumberTheory.Chebotarev.Density.PrimesCongruent
import TauCeti.NumberTheory.Chebotarev.Density.Ramification
import TauCeti.NumberTheory.Chebotarev.Density.SplitsCompletely
import TauCeti.NumberTheory.Chebotarev.Density.ZetaSum
import TauCeti.NumberTheory.Chebotarev.FixedField.CyclicGenerator
import TauCeti.NumberTheory.Chebotarev.FixedField.ExceptionalPrimes
import TauCeti.NumberTheory.Chebotarev.FixedField.IdentityFiber
import TauCeti.NumberTheory.Chebotarev.FixedField.S3Contraction
import TauCeti.NumberTheory.Chebotarev.FixedField.SeventhCyclotomic
import TauCeti.NumberTheory.Chebotarev.GaloisCharacter.Cyclotomic.Cancellation
import TauCeti.NumberTheory.Chebotarev.GaloisCharacter.Cyclotomic.Nonvanishing
import TauCeti.NumberTheory.Chebotarev.GaloisCharacter.PrimeSum
import TauCeti.NumberTheory.Chebotarev.PrimeCounting.ArithmeticProgression
import TauCeti.NumberTheory.Chebotarev.PrimeCounting.CharacterExpansion
import TauCeti.NumberTheory.Chebotarev.PrimeCounting.Consistency
import TauCeti.NumberTheory.Chebotarev.PrimeCounting.Cyclotomic
import TauCeti.NumberTheory.Chebotarev.PrimeCounting.Discard
import TauCeti.NumberTheory.Chebotarev.PrimeCounting.FixedFieldContraction
import TauCeti.NumberTheory.Chebotarev.PrimeCounting.PrimesCongruent
import TauCeti.NumberTheory.Chebotarev.PrimeCounting.SplitsCompletely
import TauCeti.NumberTheory.Chebotarev.PrimeCounting.Tower
import TauCeti.NumberTheory.Chebotarev.TaggedFixedField
import TauCeti.NumberTheory.NumberField.Cyclotomic.FifthIntersection
import TauCeti.NumberTheory.NumberField.Cyclotomic.Ramification
import TauCeti.NumberTheory.NumberField.DedekindZeta
import TauCeti.NumberTheory.NumberField.DirichletDensityBounds
import TauCeti.NumberTheory.NumberField.Frobenius.DecompositionGroup
import TauCeti.NumberTheory.NumberField.Frobenius.FixedField.Fiber
import TauCeti.NumberTheory.NumberField.Frobenius.FixedField.Inertia
import TauCeti.NumberTheory.NumberField.Frobenius.Tower
import TauCeti.NumberTheory.NumberField.Ideal.IntegersRat
import TauCeti.RingTheory.Polynomial.Cyclotomic.SqrtFive

/-!
# The Chebotarev density theorem: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for the milestones, so that contributors and reviewers
converge on names and signatures; discharging all of them finishes neither a layer nor the roadmap.

The milestones of `README.md` have statements here, in the form the roadmap asks for, closed by
the Tau Ceti declarations that realize them, so the correspondence is checked by the Lean kernel
rather than asserted in prose; the requests not yet certified are listed at the end of this
header. Every statement is proved. That is evidence for completion, not its criterion: completion
is judged by a milestone-by-milestone audit against `README.md`, which a fully proved file of
suggested forms cannot replace.

The earlier version of this file imported the `Suggested.lean` files of Arithmetic Dirichlet
Series, Global Number Fields and Number Field Arithmetic, and proposed its own `ConjClasses.pow`,
Frobenius prime sets, cyclotomic weight, crossing data and Frobenius summatory functions. All of
these now live in Tau Ceti, mostly in the namespace `NumberField.Chebotarev`, together with the
supplier declarations they consumed. The statements below import Tau Ceti and Mathlib only and are
made about the Tau Ceti objects. The differences from the README's requested forms are these.

* The weight `cyclotomicCharacterWeight χ` on the README's interface list is
  `MonoidHom.galoisCharacterWeight χ`, a `MultiplicativeIdealWeight` defined for every finite
  Galois `L / K`, not only for cyclotomic ones. Its continued series keeps the README's name
  `cyclotomicCharacterSeriesC`.
* `cyclotomicCrossing_linearDisjoint` is not a Tau Ceti declaration. Tau Ceti's isomorphism of 7.4
  is `IsCyclotomicExtension.galEquivProd : Gal(M/K) ≃* Gal(L/K) × (ZMod q)ˣ` for `M = L(μ_q)`,
  proved by a degree count from `q` coprime to `disc L` (which the auxiliary prime gets from
  `N = |disc L|`) rather than from 7.3 and linear disjointness. Below, the restriction isomorphism
  with second factor `Gal(K(ζ_q)/K)` and the linear disjointness of `L` and `K(ζ_q)` are derived
  from it in that order, with the irreducibility of 7.2; the intersection of 7.3 is proved
  separately.
* Layer 4 factors the Artin map of `K(μ_m) / K` through the ray class group of the admissible
  modulus `(m) ∞` (`cyclotomicModulus`) rather than the exact conductor, and compares no conductors.
* Two intermediate results are private in Tau Ceti: `ψ_K(x) ~ x` of 12.2 and the prime ideal
  theorem for `K` that is the natural-density denominator of Layer 14. Both are stated below and
  closed by specializing the public counting theorems to the trivial extension `K / K`, as Tau
  Ceti itself does for the second.
* *Erratum.* 12.1 of the README says that deleting the ramified Euler factors leaves the residue
  of `ζ_K` unchanged. It multiplies it by `∏_{𝔭 ramified} (1 - 𝔑𝔭⁻¹)`, so for `ℚ(ζ₅)/ℚ` the
  residue `1` becomes `4/5`. The statement below carries the corrected residue, and the README
  marks the correction.
* The non-Galois corollary of Layer 10 is stated for an intermediate field `E` of a finite Galois
  `M / K`, with density `1 / [N : K]` for the normal closure `N` of `E` in `M`.
* Some public declarations sit outside `NumberField.Chebotarev`
  (`NumberField.exists_auxiliaryPrime`, `TauCeti.NumberField.Chebotarev.crossingConstant`,
  `TauCeti.fixedField_zpowers_isCyclotomicExtension`), and the folders under
  `TauCeti/NumberTheory/Chebotarev/` differ from the README's suggestion.

The following requests of the README are not certified here: the Tau Ceti declarations they need
are private or absent at the pin.

* The exact conductor of `K(μ_m) / K` (Layer 4); see above.
* The one-sided forms of the logarithmic normalization and of finite insertion and deletion
  (Layer 3). Tau Ceti has those transfers for exact densities only.
* The ramification data of the `S₃` witness of 8.3: the inertia group, `e(Q/2) = 3` and
  `e(𝔓/2) = 3`, computed inside the proof of the witness but not exported. (`e(Q/𝔓) = 1` is its
  conclusion `P ∉ ramifiedPrimes E L`.)
* The tagged fibre densities and the lower bound `c_q` of Layer 9, and the tagged weighted limits
  and `liminf ψ_σ(x)/x ≥ c_q` of 12.4. They are private steps of
  `hasDirichletDensity_abelianFrobenius` and `frobeniusPsi_asymptotic_of_mul_comm`.
* The assembled boundary data `G = F - κ/(s-1)` of 12.1, built inside the proof of
  `frobeniusPsi_asymptotic_of_isCyclotomicExtension`; its ingredients are stated below.
* The powered fibre count of 12.3; the degree-five example motivating it is stated below.

Zero-free regions, explicit formulae and effective Chebotarev bounds are outside this roadmap by its
own text (they belong to Zeros of L-functions), so every remainder here is qualitative: `o(x)` in
the discard estimates of 11.3 and in the asymptotics and transfers of Layers 12 and 13, and
`O(log x)` for a finite set of primes and for the partition of `ψ_K` into Frobenius fibres.
-/

namespace TauCetiRoadmap.Chebotarev

open Asymptotics Filter IntermediateField NumberField NumberField.Chebotarev TauCeti Topology
open IsDedekindDomain (HeightOneSpectrum)
open scoped NumberField nonZeroDivisors

/-! ## Layer 1: powers of conjugacy classes and the consumed Frobenius classes -/

section Layer1

variable {M : Type*} [Monoid M]

/-- **The power of a conjugacy class** is `ConjClasses.pow`, written `C ^ j`. -/
example (C : ConjClasses M) (j : ℕ) : C.pow j = C ^ j :=
  rfl

theorem mem_conjClasses_pow_iff (C : ConjClasses M) (j : ℕ) (τ : M) :
    τ ∈ (C ^ j).carrier ↔ ∃ σ ∈ C.carrier, σ ^ j = τ :=
  ConjClasses.mem_pow_iff

theorem conjClasses_mk_pow (a : M) (j : ℕ) : ConjClasses.mk a ^ j = ConjClasses.mk (a ^ j) :=
  ConjClasses.mk_pow a j

theorem conjClasses_pow_zero (C : ConjClasses M) : C ^ 0 = 1 :=
  ConjClasses.pow_zero C

theorem conjClasses_pow_one (C : ConjClasses M) : C ^ 1 = C :=
  ConjClasses.pow_one C

theorem conjClasses_pow_mul (C : ConjClasses M) (i j : ℕ) : (C ^ i) ^ j = C ^ (i * j) :=
  ConjClasses.pow_mul C i j

/-- Functoriality: powering commutes with the map induced by a monoid homomorphism. -/
theorem conjClasses_map_pow {N : Type*} [Monoid N] (f : M →* N) (C : ConjClasses M) (j : ℕ) :
    ConjClasses.map f (C ^ j) = ConjClasses.map f C ^ j :=
  ConjClasses.map_pow f C j

/-- **The class cardinal does not depend on the representative**: it is the index of the
centralizer of any member. -/
theorem card_carrier_mk {G : Type*} [Group G] (g : G) :
    Nat.card (ConjClasses.mk g).carrier = (Subgroup.centralizer {g}).index :=
  ConjClasses.card_carrier_mk g

variable {K : Type*} [Field K] [NumberField K]

/-- **Shrinking the top field takes no power.** Restriction to a normal intermediate extension
carries the Artin class upstairs to the Artin class downstairs. -/
theorem artinSymbol_map_restrictNormalHom {M L : Type*} [Field M] [NumberField M]
    [Field L] [NumberField L] [Algebra K M] [Algebra M L] [Algebra K L]
    [IsScalarTower K M L] [IsGalois K L] [IsGalois K M]
    (𝔭 : Ideal (𝓞 K)) [𝔭.IsMaximal]
    (hur : ∀ (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver 𝔭],
      Algebra.IsUnramifiedAt (𝓞 K) Q) :
    ConjClasses.map (AlgEquiv.restrictNormalHom (F := K) (K₁ := L) M)
        (artinSymbol 𝔭 hur) =
      artinSymbol 𝔭 (fun P _ _ ↦
        TauCeti.RamificationInertia.isUnramifiedAt_of_isUnramifiedIn (S := 𝓞 L)
          (fun Q hQ hQ' ↦ @hur Q hQ hQ') P) :=
  NumberField.artinSymbol_map_restrictNormalHom 𝔭 hur

/-- **Raising the base field takes the power `f(𝔓/𝔭)`**, the residue degree of the intermediate
prime, never an inverse. -/
theorem artinSymbol_map_restrictScalarsHom_eq_pow_inertiaDeg {M L : Type*} [Field M]
    [NumberField M] [Field L] [NumberField L] [Algebra K M] [Algebra M L] [Algebra K L]
    [IsScalarTower K M L] [IsGalois K L]
    (𝔓 : Ideal (𝓞 M)) [𝔓.IsMaximal] (𝔭 : Ideal (𝓞 K)) [𝔭.IsMaximal] [𝔓.LiesOver 𝔭]
    (hurK : ∀ (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver 𝔭],
      Algebra.IsUnramifiedAt (𝓞 K) Q) :
    letI := IsGalois.tower_top_of_isGalois K M L
    ConjClasses.map (AlgEquiv.restrictScalarsHom K)
        (artinSymbol 𝔓 (fun Q _ _ ↦
          have : Q.LiesOver 𝔭 := Ideal.LiesOver.trans Q 𝔓 𝔭
          have := hurK Q
          Algebra.IsUnramifiedAt.of_restrictScalars (𝓞 K) Q)) =
      artinSymbol 𝔭 hurK ^ 𝔓.inertiaDeg (𝓞 K) :=
  NumberField.artinSymbol_map_restrictScalarsHom_eq_pow_inertiaDeg 𝔓 𝔭 hurK

/-- The prime-relative form the tower law is consumed in: at one prime `Q` over `𝔓` over `𝔭`, an
arithmetic Frobenius `σ` at `Q / 𝔭` has `σ ^ f(𝔓/𝔭)` as the restriction of one at `Q / 𝔓`. -/
theorem exists_isArithFrobAt_pow_inertiaDeg {L : Type*} [Field L] [NumberField L] [Algebra K L]
    [IsGalois K L] (M : Type*) [Field M] [NumberField M] [Algebra K M] [Algebra M L]
    [IsScalarTower K M L] [IsGalois M L] (Q : Ideal (𝓞 L)) [Q.IsPrime] (𝔓 : Ideal (𝓞 M))
    (𝔭 : Ideal (𝓞 K)) (hQM : Q.under (𝓞 M) = 𝔓) (hQK : Q.under (𝓞 K) = 𝔭)
    (hur : ∀ (Q' : Ideal (𝓞 L)) [Q'.IsPrime] [Q'.LiesOver 𝔭], Algebra.IsUnramifiedAt (𝓞 K) Q')
    (σ : L ≃ₐ[K] L) (hσ : IsArithFrobAt (𝓞 K) σ Q) :
    ∃ τ : L ≃ₐ[M] L, IsArithFrobAt (𝓞 M) τ Q ∧
      AlgEquiv.restrictScalars K τ = σ ^ 𝔓.inertiaDeg (𝓞 K) :=
  NumberField.exists_isArithFrobAt_pow_inertiaDeg M Q 𝔓 𝔭 hQM hQK hur σ hσ

/-- **A split-completely prime has the identity class.** -/
theorem artinSymbol_eq_one_iff_ncard_primesOver_eq_finrank {L : Type*} [Field L] [NumberField L]
    [Algebra K L] [IsGalois K L] (𝔭 : Ideal (𝓞 K)) [𝔭.IsMaximal]
    (hur : ∀ (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver 𝔭], Algebra.IsUnramifiedAt (𝓞 K) Q) :
    artinSymbol 𝔭 hur = 1 ↔ (𝔭.primesOver (𝓞 L)).ncard = Module.finrank K L :=
  NumberField.artinSymbol_eq_one_iff_ncard_primesOver_eq_finrank 𝔭 hur

end Layer1

/-! ## Layer 2: Frobenius prime sets and the finite exceptional set -/

section Layer2

variable {K L : Type*} [Field K] [NumberField K] [Field L] [NumberField L] [Algebra K L]
  [IsGalois K L]

/-- **The Frobenius prime set** on the carrier `HeightOneSpectrum (𝓞 K)`, with the unramifiedness
proof packaged existentially: no class is assigned at a ramified prime. -/
theorem mem_frobeniusPrimeSet_iff {𝔭 : HeightOneSpectrum (𝓞 K)} {C : ConjClasses (L ≃ₐ[K] L)} :
    𝔭 ∈ frobeniusPrimeSet K L C ↔
      ∃ hur : ∀ (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver 𝔭.asIdeal],
        Algebra.IsUnramifiedAt (𝓞 K) Q, artinSymbol 𝔭.asIdeal hur = C :=
  NumberField.Chebotarev.mem_frobeniusPrimeSet_iff

/-- Proof-independence: any unramifiedness proof decides membership. -/
theorem mem_frobeniusPrimeSet_iff_artinSymbol_eq {𝔭 : HeightOneSpectrum (𝓞 K)}
    (hur : ∀ (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver 𝔭.asIdeal],
      Algebra.IsUnramifiedAt (𝓞 K) Q) (C : ConjClasses (L ≃ₐ[K] L)) :
    𝔭 ∈ frobeniusPrimeSet K L C ↔ artinSymbol 𝔭.asIdeal hur = C :=
  NumberField.Chebotarev.mem_frobeniusPrimeSet_iff_artinSymbol_eq hur C

/-- Equivariance under an isomorphism of extensions. -/
theorem frobeniusPrimeSet_map_autCongr {L' : Type*} [Field L'] [NumberField L'] [Algebra K L']
    [IsGalois K L'] (C : ConjClasses (L ≃ₐ[K] L)) (e : L ≃ₐ[K] L') :
    frobeniusPrimeSet K L' (ConjClasses.map (AlgEquiv.autCongr e).toMonoidHom C) =
      frobeniusPrimeSet K L C :=
  NumberField.Chebotarev.frobeniusPrimeSet_map_autCongr C e

theorem disjoint_frobeniusPrimeSet {C D : ConjClasses (L ≃ₐ[K] L)} (h : C ≠ D) :
    Disjoint (frobeniusPrimeSet K L C) (frobeniusPrimeSet K L D) :=
  NumberField.Chebotarev.disjoint_frobeniusPrimeSet h

/-- **The finite exceptional set** is a `Finset`, of exactly the primes ramifying in `L`. -/
noncomputable example : Finset (HeightOneSpectrum (𝓞 K)) :=
  ramifiedPrimes K L

omit [IsGalois K L] in
theorem mem_ramifiedPrimes_iff (𝔭 : HeightOneSpectrum (𝓞 K)) :
    𝔭 ∈ ramifiedPrimes K L ↔
      ¬ ∀ (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver 𝔭.asIdeal], Algebra.IsUnramifiedAt (𝓞 K) Q :=
  NumberField.Chebotarev.mem_ramifiedPrimes_iff 𝔭

/-- The fibres over all classes cover exactly the unramified primes, the complement of
`ramifiedPrimes K L`. -/
theorem iUnion_frobeniusPrimeSet :
    ⋃ C : ConjClasses (L ≃ₐ[K] L), frobeniusPrimeSet K L C = (↑(ramifiedPrimes K L))ᶜ :=
  NumberField.Chebotarev.iUnion_frobeniusPrimeSet K L

theorem finite_compl_iUnion_frobeniusPrimeSet :
    (⋃ C : ConjClasses (L ≃ₐ[K] L), frobeniusPrimeSet K L C)ᶜ.Finite :=
  NumberField.Chebotarev.finite_compl_iUnion_frobeniusPrimeSet K L

end Layer2

/-! ## Layer 3: prime sums and density normalization -/

section Layer3

variable {K L : Type*} [Field K] [NumberField K] [Field L] [NumberField L] [Algebra K L]
  [IsGalois K L]

/-- **The density predicate is the ratio to the all-prime sum** (acceptance test 1). -/
example (S : Set (HeightOneSpectrum (𝓞 K))) (δ : ℝ) :
    S.HasDirichletDensity δ ↔
      Tendsto (fun s : ℝ ↦ S.primeIdealZetaSum s /
        (Set.univ : Set (HeightOneSpectrum (𝓞 K))).primeIdealZetaSum s) (𝓝[>] 1) (𝓝 δ) :=
  Iff.rfl

/-- **The logarithmic normalization is a theorem**, from the Euler product and the bound on the
higher prime powers. -/
theorem hasDirichletDensity_iff_tendsto_div_log_one_div_sub_one
    (S : Set (HeightOneSpectrum (𝓞 K))) (δ : ℝ) :
    S.HasDirichletDensity δ ↔
      Tendsto (fun s : ℝ ↦ S.primeIdealZetaSum s / Real.log (1 / (s - 1))) (𝓝[>] 1) (𝓝 δ) :=
  NumberField.Set.hasDirichletDensity_iff_tendsto_div_log_one_div_sub_one S δ

open scoped Classical in
/-- `primeIdealZetaSum` specialized to the Frobenius fibres: they reassemble the sum over the
unramified primes. -/
theorem sum_primeIdealZetaSum_frobeniusPrimeSet {s : ℝ}
    (hsum : ∀ C : ConjClasses (L ≃ₐ[K] L),
      Summable fun 𝔭 : frobeniusPrimeSet K L C ↦ (Ideal.absNorm 𝔭.1.asIdeal : ℝ) ^ (-s)) :
    ∑ C : ConjClasses (L ≃ₐ[K] L), (frobeniusPrimeSet K L C).primeIdealZetaSum s =
      (↑(ramifiedPrimes K L) : Set (HeightOneSpectrum (𝓞 K)))ᶜ.primeIdealZetaSum s :=
  NumberField.Chebotarev.sum_primeIdealZetaSum_frobeniusPrimeSet K L hsum

omit [IsGalois K L] in
/-- **Deleting the ramified set**: the unramified primes have density one. -/
theorem hasDirichletDensity_compl_ramifiedPrimes :
    ((↑(ramifiedPrimes K L) : Set (HeightOneSpectrum (𝓞 K)))ᶜ).HasDirichletDensity 1 :=
  NumberField.Chebotarev.hasDirichletDensity_compl_ramifiedPrimes K L

/-- **Upper and lower density bounds**, which together are exactly a density. -/
theorem hasDirichletDensity_iff_bounds {S : Set (HeightOneSpectrum (𝓞 K))} {δ : ℝ} :
    S.HasDirichletDensity δ ↔
      NumberField.Set.IsUpperDirichletDensityBound S δ ∧
        NumberField.Set.IsLowerDirichletDensityBound S δ :=
  NumberField.Set.hasDirichletDensity_iff_bounds

end Layer3

/-! ## Layer 4: cyclotomic Galois characters -/

section Layer4

/-- **Arithmetic Frobenius raises a root of unity to the norm**, `ζ ↦ ζ ^ 𝔑𝔭`, not its inverse. -/
theorem apply_eq_pow_absNorm_of_pow_eq_one {K F : Type*} [Field K] [NumberField K] [Field F]
    [Algebra K F] {m : ℕ} {ζ : F} (hζ : ζ ^ m = 1) (𝔭 : HeightOneSpectrum (𝓞 K))
    (hm : (m : 𝓞 K) ∉ 𝔭.asIdeal) (Q : Ideal (𝓞 F)) [Q.LiesOver 𝔭.asIdeal]
    {σ : F ≃ₐ[K] F} (hσ : IsArithFrobAt (𝓞 K) σ Q) :
    σ ζ = ζ ^ Ideal.absNorm 𝔭.asIdeal :=
  AlgHom.IsArithFrobAt.apply_eq_pow_absNorm_of_pow_eq_one hζ 𝔭 hm Q hσ

/-- Over `ℚ`, Frobenius at `p ∤ m` corresponds to `p mod m`. -/
theorem isArithFrobAt_iff_galEquivZMod_eq_absNorm {n : ℕ} [NeZero n] {F : Type*} [Field F]
    [NumberField F] [IsCyclotomicExtension {n} ℚ F] (𝔭 : HeightOneSpectrum (𝓞 ℚ))
    (hm : (n : 𝓞 ℚ) ∉ 𝔭.asIdeal) (Q : Ideal (𝓞 F)) [Q.IsPrime] [Q.LiesOver 𝔭.asIdeal]
    (σ : F ≃ₐ[ℚ] F) :
    IsArithFrobAt (𝓞 ℚ) σ Q ↔
      ((IsCyclotomicExtension.Rat.galEquivZMod n F σ : (ZMod n)ˣ) : ZMod n) =
        Ideal.absNorm 𝔭.asIdeal :=
  TauCeti.NumberField.isArithFrobAt_iff_galEquivZMod_eq_absNorm 𝔭 hm Q σ

variable {K F : Type*} [Field K] [NumberField K] [Field F] [NumberField F] [Algebra K F]
  [IsGalois K F]

/-- `Gal(F/K)` is abelian. -/
example (m : ℕ) [IsCyclotomicExtension {m} K F] : IsMulCommutative (F ≃ₐ[K] F) :=
  IsCyclotomicExtension.isMulCommutative {m} K F

/-- **The modulus through Global Number Fields**: finite part `(m)`, and every real place. -/
theorem cyclotomicModulus_finitePart (m : ℕ) [NeZero m] :
    (cyclotomicModulus K m).finitePart = Ideal.span {(m : 𝓞 K)} :=
  NumberField.Chebotarev.cyclotomicModulus_finitePart K m

theorem mem_cyclotomicModulus_infinitePart (m : ℕ) [NeZero m]
    (w : {w : InfinitePlace K // w.IsReal}) : w ∈ (cyclotomicModulus K m).infinitePart :=
  NumberField.Chebotarev.mem_cyclotomicModulus_infinitePart K m w

/-- The Artin map of `F = K(μ_m)` on the ray class group of `cyclotomicModulus K m` sends the class
of a prime `𝔭 ∤ m` to the Frobenius at `𝔭`. -/
theorem cyclotomicArtin_idealClass_of_isArithFrobAt (m : ℕ) [NeZero m]
    [IsCyclotomicExtension {m} K F] (𝔭 : HeightOneSpectrum (𝓞 K))
    (h𝔭 : 𝔭.asIdeal ∈ TauCeti.GlobalNumberFields.integralIdealsPrimeTo (cyclotomicModulus K m))
    (Q : Ideal (𝓞 F)) [Q.IsPrime] [Q.LiesOver 𝔭.asIdeal] {σ : F ≃ₐ[K] F}
    (hσ : IsArithFrobAt (𝓞 K) σ Q) :
    cyclotomicArtin K F m (TauCeti.GlobalNumberFields.idealClass _ ⟨𝔭.asIdeal, h𝔭⟩) = σ :=
  NumberField.Chebotarev.cyclotomicArtin_idealClass_of_isArithFrobAt F m 𝔭 h𝔭 Q hσ

/-- **The canonical weight** (`cyclotomicCharacterWeight` in the README) is `χ (Frob 𝔭)` at an
unramified prime. -/
theorem galoisCharacterWeight_apply_of_unramified (χ : (F ≃ₐ[K] F) →* ℂˣ)
    (𝔭 : HeightOneSpectrum (𝓞 K))
    (hur : ∀ (Q : Ideal (𝓞 F)) [Q.IsPrime] [Q.LiesOver 𝔭.asIdeal],
      Algebra.IsUnramifiedAt (𝓞 K) Q) :
    haveI : 𝔭.asIdeal.IsMaximal := 𝔭.isMaximal
    MonoidHom.galoisCharacterWeight (L := F) χ 𝔭.asIdeal =
      (χ (artinSymbol (L := F) 𝔭.asIdeal hur).out : ℂ) :=
  MonoidHom.galoisCharacterWeight_apply_of_unramified χ 𝔭 hur

/-- The weight is `0` exactly at the ramified primes, which are therefore its bad primes. -/
theorem galoisCharacterWeight_apply_eq_zero_iff (χ : (F ≃ₐ[K] F) →* ℂˣ)
    (𝔭 : HeightOneSpectrum (𝓞 K)) :
    MonoidHom.galoisCharacterWeight (L := F) χ 𝔭.asIdeal = 0 ↔ 𝔭 ∈ ramifiedPrimes K F :=
  MonoidHom.galoisCharacterWeight_apply_eq_zero_iff χ 𝔭

theorem badPrimes_galoisCharacterWeight (χ : (F ≃ₐ[K] F) →* ℂˣ) :
    (MonoidHom.galoisCharacterWeight (L := F) χ).badPrimes = ↑(ramifiedPrimes K F) :=
  MonoidHom.badPrimes_galoisCharacterWeight χ

/-- **The Euler product** of the weight on `Re s > 1`. -/
theorem hasProd_eulerFactor_galoisCharacterWeight (χ : (F ≃ₐ[K] F) →* ℂˣ) {s : ℂ}
    (hs : 1 < s.re) :
    HasProd (fun P : HeightOneSpectrum (𝓞 K) ↦
        (1 - MonoidHom.galoisCharacterWeight (L := F) χ P.asIdeal /
          (Ideal.absNorm P.asIdeal : ℂ) ^ s)⁻¹)
      (LSeries (normCoeff K (MonoidHom.galoisCharacterWeight (L := F) χ).toIdealArithmeticFunction)
        s) :=
  (MonoidHom.galoisCharacterWeight (L := F) χ).hasProd_eulerFactor
    (χ.summable_idealTerm_galoisCharacterWeight hs)

open scoped Classical in
/-- **Character orthogonality**, at every prime, ramified ones included. The inverse sits on the
tag `σ`. -/
theorem sum_inv_mul_galoisCharacterWeight_apply_eq_ite [IsMulCommutative (F ≃ₐ[K] F)]
    (σ : F ≃ₐ[K] F) (P : HeightOneSpectrum (𝓞 K)) :
    ∑ χ : (F ≃ₐ[K] F) →* ℂˣ,
        (((χ σ)⁻¹ : ℂˣ) : ℂ) * MonoidHom.galoisCharacterWeight (L := F) χ P.asIdeal =
      if P ∈ frobeniusPrimeSet K F (ConjClasses.mk σ) then (Nat.card (F ≃ₐ[K] F) : ℂ) else 0 :=
  AlgEquiv.sum_inv_mul_galoisCharacterWeight_apply_eq_ite σ P

end Layer4

/-! ## Layer 5: ray-class counting and continuation -/

section Layer5

variable {K F : Type*} [Field K] [NumberField K] [Field F] [NumberField F] [Algebra K F]
  [IsGalois K F]

/-- **The weight factors through a ray class character**, on the integral ideals prime to `m`. -/
theorem galoisCharacterWeight_eq_onIdeals_cyclotomicArtin {m : ℕ} [NeZero m]
    [IsCyclotomicExtension {m} K F] (χ : (F ≃ₐ[K] F) →* ℂˣ)
    (I : TauCeti.GlobalNumberFields.integralIdealsPrimeTo (cyclotomicModulus K m)) :
    MonoidHom.galoisCharacterWeight (L := F) χ (I : Ideal (𝓞 K)) =
      (TauCeti.GlobalNumberFields.RayClassCharacter.onIdeals
        (χ.comp (cyclotomicArtin K F m)) I : ℂ) :=
  MonoidHom.galoisCharacterWeight_eq_onIdeals_cyclotomicArtin χ I

/-- **Cancellation**, from the class-by-class ray counts, for a nontrivial ray class character. -/
theorem hasCancellation_restrict_galoisCharacterUnitaryWeight {m : ℕ} [NeZero m]
    [IsCyclotomicExtension {m} K F] (χ : (F ≃ₐ[K] F) →* ℂˣ)
    (hχ : χ.comp (cyclotomicArtin K F m) ≠ 1) :
    HasCancellation ((MonoidHom.galoisCharacterUnitaryWeight (L := F) χ).restrict
      ((cyclotomicModulus K m).support : Set (HeightOneSpectrum (𝓞 K)))
      (cyclotomicModulus K m).support.finite_toSet) :=
  MonoidHom.hasCancellation_restrict_galoisCharacterUnitaryWeight χ hχ

/-- **The continued series** `cyclotomicCharacterSeriesC` agrees with the `L`-series on
`Re s > 1`. -/
theorem cyclotomicCharacterSeriesC_eq_LSeries (χ : (F ≃ₐ[K] F) →* ℂˣ) {s : ℂ} (hs : 1 < s.re) :
    cyclotomicCharacterSeriesC K F χ s =
      LSeries (normCoeff K (MonoidHom.galoisCharacterWeight (L := F) χ).toIdealArithmeticFunction)
        s :=
  NumberField.Chebotarev.cyclotomicCharacterSeriesC_eq_LSeries K F χ hs

/-- For nontrivial `χ` it is holomorphic on a half-plane containing `Re s = 1`. -/
theorem differentiableOn_cyclotomicCharacterSeriesC (m : ℕ) [NeZero m]
    [IsCyclotomicExtension {m} K F] (χ : (F ≃ₐ[K] F) →* ℂˣ) (hχ : χ ≠ 1) :
    DifferentiableOn ℂ (cyclotomicCharacterSeriesC K F χ)
      {s | 1 - 1 / (Module.finrank ℚ K : ℝ) < s.re} :=
  NumberField.Chebotarev.differentiableOn_cyclotomicCharacterSeriesC K F m χ hχ

theorem analyticAt_cyclotomicCharacterSeriesC_one (m : ℕ) [NeZero m]
    [IsCyclotomicExtension {m} K F] (χ : (F ≃ₐ[K] F) →* ℂˣ) (hχ : χ ≠ 1) :
    AnalyticAt ℂ (cyclotomicCharacterSeriesC K F χ) 1 :=
  NumberField.Chebotarev.analyticAt_cyclotomicCharacterSeriesC_one K F m χ hχ

/-- For nontrivial `χ` it does not vanish at `s = 1`, nor anywhere on `Re s = 1`. -/
theorem cyclotomicCharacterSeriesC_ne_zero_at_one (m : ℕ) [NeZero m]
    [IsCyclotomicExtension {m} K F] (χ : (F ≃ₐ[K] F) →* ℂˣ) (hχ : χ ≠ 1) :
    cyclotomicCharacterSeriesC K F χ 1 ≠ 0 :=
  NumberField.Chebotarev.cyclotomicCharacterSeriesC_ne_zero_at_one K F m χ hχ

theorem cyclotomicCharacterSeriesC_ne_zero_of_re_eq_one (m : ℕ) [NeZero m]
    [IsCyclotomicExtension {m} K F] (χ : (F ≃ₐ[K] F) →* ℂˣ) (hχ : χ ≠ 1) {s : ℂ}
    (hs : s.re = 1) : cyclotomicCharacterSeriesC K F χ s ≠ 0 :=
  NumberField.Chebotarev.cyclotomicCharacterSeriesC_ne_zero_of_re_eq_one m χ hχ hs

/-- **The trivial character has the single pole of the all-ideal series**: its series is `ζ_K`
with the ramified Euler factors deleted, and continues past `Re s = 1` after removing
`ρ / (s - 1)`. -/
theorem exists_differentiableOn_eq_LSeries_galoisCharacterWeight_one_sub :
    ∃ G : ℂ → ℂ, DifferentiableOn ℂ G {s | 1 - 1 / (Module.finrank ℚ K : ℝ) < s.re} ∧
      ∀ s : ℂ, 1 < s.re → G s = LSeries (normCoeff K
          (MonoidHom.galoisCharacterWeight (L := F)
            (1 : (F ≃ₐ[K] F) →* ℂˣ)).toIdealArithmeticFunction) s -
        dedekindZeta_residue K *
          (∏ P ∈ ramifiedPrimes K F, (1 - (Ideal.absNorm P.asIdeal : ℂ) ^ (-1 : ℂ))) / (s - 1) := by
  rw [MonoidHom.galoisCharacterWeight_one]
  exact TauCeti.exists_differentiableOn_eq_LSeries_ofBadPrimes_sub K (ramifiedPrimes K F)

end Layer5

/-! ## Layer 6: cyclotomic Dirichlet density -/

section Layer6

theorem hasDirichletDensity_cyclotomicFrobenius {K F : Type*} [Field K] [NumberField K] [Field F]
    [NumberField F] [Algebra K F] [IsGalois K F] (m : ℕ) [NeZero m]
    [IsCyclotomicExtension {m} K F] (σ : F ≃ₐ[K] F) :
    NumberField.Set.HasDirichletDensity (frobeniusPrimeSet K F (ConjClasses.mk σ))
      (1 / (Nat.card (F ≃ₐ[K] F) : ℝ)) :=
  NumberField.Chebotarev.hasDirichletDensity_cyclotomicFrobenius K F m σ

/-- **Dirichlet's theorem** over `ℚ`, by comparison with Mathlib's primes in arithmetic
progressions. -/
theorem hasDirichletDensity_primesCongruent (m a : ℕ) [NeZero m] (ha : IsUnit (a : ZMod m)) :
    NumberField.Set.HasDirichletDensity
      {𝔭 : HeightOneSpectrum (𝓞 ℚ) | Ideal.absNorm 𝔭.asIdeal % m = a % m}
      (1 / (Nat.totient m : ℝ)) :=
  NumberField.Chebotarev.hasDirichletDensity_primesCongruent m a ha

variable (F : Type*) [Field F] [NumberField F] (n : ℕ) [NeZero n] [IsCyclotomicExtension {n} ℚ F]
  [IsGalois ℚ F]

/-- **Orientation**: the fibre tagged by the unit `a` is the primes `p ≡ a`, not `p ≡ a⁻¹`. -/
theorem mem_frobeniusPrimeSet_galEquivZMod_symm_iff {𝔭 : HeightOneSpectrum (𝓞 ℚ)}
    (hm : (n : 𝓞 ℚ) ∉ 𝔭.asIdeal) (a : (ZMod n)ˣ) :
    𝔭 ∈ frobeniusPrimeSet ℚ F
        (ConjClasses.mk ((IsCyclotomicExtension.Rat.galEquivZMod n F).symm a)) ↔
      (Ideal.absNorm 𝔭.asIdeal : ZMod n) = a :=
  NumberField.Chebotarev.mem_frobeniusPrimeSet_galEquivZMod_symm_iff F n hm a

theorem hasDirichletDensity_frobeniusPrimeSet_galEquivZMod_symm (a : (ZMod n)ˣ) :
    NumberField.Set.HasDirichletDensity
      (frobeniusPrimeSet ℚ F
        (ConjClasses.mk ((IsCyclotomicExtension.Rat.galEquivZMod n F).symm a)))
      (1 / (Nat.totient n : ℝ)) :=
  NumberField.Chebotarev.hasDirichletDensity_frobeniusPrimeSet_galEquivZMod_symm F n a

end Layer6

/-! ## Layer 7: the auxiliary prime and the crossing data -/

section Layer7

open Polynomial

/-- **7.1 The auxiliary prime**, with every condition the later layers use as a conclusion. -/
theorem exists_auxiliaryPrime (K L : Type*) [Field K] [NumberField K] [Field L] [NumberField L]
    (n N : ℕ) (hn : n ≠ 0) :
    ∃ q : ℕ, q.Prime ∧ N < q ∧ q ≡ 1 [MOD n] ∧ n ∣ q - 1 ∧
      Algebra.IsUnramifiedIn (𝓞 K) (Ideal.span {(q : ℤ)}) ∧
      Algebra.IsUnramifiedIn (𝓞 L) (Ideal.span {(q : ℤ)}) ∧
      Irreducible (cyclotomic q K) :=
  NumberField.exists_auxiliaryPrime K L n N hn

variable {K : Type*} [Field K] [NumberField K]

/-- **7.2(1) Total ramification**: over a base unramified at `p`, every prime of `K(ζ_{p^(k+1)})`
above `p` has ramification index `φ(p^(k+1))`. -/
theorem ramificationIdx_eq_totient (p k : ℕ) [Fact p.Prime] {F : Type*} [Field F]
    [Algebra K F] [IsCyclotomicExtension {p ^ (k + 1)} K F]
    (hur : ∀ (𝔮 : Ideal (𝓞 K)) [𝔮.IsPrime] [𝔮.LiesOver (Ideal.span {(p : ℤ)})],
      Algebra.IsUnramifiedAt ℤ 𝔮) (𝔔 : Ideal (𝓞 F)) [𝔔.IsPrime]
    [𝔔.LiesOver (Ideal.span {(p : ℤ)})] : 𝔔.ramificationIdx (𝓞 K) = (p ^ (k + 1)).totient :=
  IsCyclotomicExtension.ramificationIdx_eq_totient p k hur 𝔔

/-- **7.2(2) and 7.3, the intersections.** A field unramified at `q` meets the `q`-th cyclotomic
extension trivially: over `ℚ` this is `K ∩ ℚ(ζ_q) = ℚ`, over `K` it is `L ∩ K(ζ_q) = K`. -/
theorem inf_eq_bot_of_unramified {Ω : Type*} [Field Ω] [Algebra K Ω] (q : ℕ) (hq : q.Prime)
    (A B : IntermediateField K Ω) [NumberField A] [IsCyclotomicExtension {q} K B]
    (hur : ∀ (P : Ideal (𝓞 A)) [P.IsPrime] [P.LiesOver (Ideal.span {(q : ℤ)})],
      Algebra.IsUnramifiedAt ℤ P) :
    A ⊓ B = ⊥ :=
  IsCyclotomicExtension.inf_eq_bot_of_unramified q hq A B hur

/-- **7.2(3)** Unramifiedness, not an intersection, gives irreducibility of `Φ_q` over `K`. -/
theorem irreducible_cyclotomic_of_unramified (q : ℕ) (hq : q.Prime)
    (hur : ∀ (𝔮 : Ideal (𝓞 K)) [𝔮.IsPrime] [𝔮.LiesOver (Ideal.span {(q : ℤ)})],
      Algebra.IsUnramifiedAt ℤ 𝔮) : Irreducible (cyclotomic q K) :=
  IsCyclotomicExtension.irreducible_cyclotomic_of_unramified K q hq hur

/-- Hence `Gal(K(ζ_q)/K) ≃ (ZMod q)ˣ`, the full unit group. -/
noncomputable example (q : ℕ) [NeZero q] (hq : q.Prime) (F : Type*) [Field F] [Algebra K F]
    [IsCyclotomicExtension {q} K F]
    (hur : ∀ (𝔮 : Ideal (𝓞 K)) [𝔮.IsPrime] [𝔮.LiesOver (Ideal.span {(q : ℤ)})],
      Algebra.IsUnramifiedAt ℤ 𝔮) :
    (F ≃ₐ[K] F) ≃* (ZMod q)ˣ :=
  IsCyclotomicExtension.autEquivPow F (irreducible_cyclotomic_of_unramified q hq hur)

/-- Hence `[K(ζ_q) : K] = q - 1`. -/
theorem finrank_eq_sub_one_of_unramified (q : ℕ) [NeZero q] (hq : q.Prime) (F : Type*) [Field F]
    [Algebra K F] [IsCyclotomicExtension {q} K F]
    (hur : ∀ (𝔮 : Ideal (𝓞 K)) [𝔮.IsPrime] [𝔮.LiesOver (Ideal.span {(q : ℤ)})],
      Algebra.IsUnramifiedAt ℤ 𝔮) :
    Module.finrank K F = q - 1 := by
  rw [IsCyclotomicExtension.finrank F (irreducible_cyclotomic_of_unramified q hq hur),
    Nat.totient_prime hq]

/-- **7.2, the rejection witness** `K = ℚ(√5)`, `L = K(√2)`, `q = 5`: the intersection
`L ⊓ K(ζ₅)` is `⊥`, yet `[K(ζ₅) : K] = 2`, not `4`. -/
theorem adjoin_inf_adjoin_eq_bot_and_finrank_eq_two {Ω : Type*} [Field Ω] [CharZero Ω]
    {a b ζ : Ω} (ha : a ^ 2 = 2) (hb : b ^ 2 = 5) (hζ : IsPrimitiveRoot ζ 5) :
    (IntermediateField.adjoin ℚ⟮b⟯ {a} ⊓ IntermediateField.adjoin ℚ⟮b⟯ {ζ} :
        IntermediateField ℚ⟮b⟯ Ω) = ⊥ ∧
      Module.finrank ℚ⟮b⟯ (IntermediateField.adjoin ℚ⟮b⟯ {ζ}) = 2 :=
  ⟨TauCeti.NumberField.adjoin_inf_adjoin_eq_bot_of_sq_eq_two ha hb hζ,
    TauCeti.NumberField.finrank_adjoin_primitiveRoot_eq_two_of_sq_eq_five hb hζ⟩

/-- Over any field containing `√5`, the fifth cyclotomic polynomial is reducible. -/
theorem not_irreducible_cyclotomic_five_of_sq_eq_five {E : Type*} [Field E] [NeZero (2 : E)]
    (h5 : ∃ x : E, x ^ 2 = 5) : ¬ Irreducible (cyclotomic 5 E) :=
  Polynomial.not_irreducible_cyclotomic_five_of_sq_eq_five h5

section Compositum

variable (L M : Type*) [Field L] [NumberField L] [Field M] [Algebra K L] [Algebra K M]
  [Algebra L M] [IsScalarTower K L M] [IsGalois K L] (m : ℕ) [NeZero m]
  [IsCyclotomicExtension {m} L M]

/-- **7.4 The compositum** `M = L(μ_m)`: restriction to `L` and the cyclotomic character are
jointly an isomorphism `Gal(M/K) ≃* Gal(L/K) × (ZMod m)ˣ`. -/
noncomputable example (hcop : ((NumberField.discr L).natAbs).Coprime m) {ζ : M}
    (hζ : IsPrimitiveRoot ζ m) : (M ≃ₐ[K] M) ≃* (L ≃ₐ[K] L) × (ZMod m)ˣ :=
  IsCyclotomicExtension.galEquivProd K L M m hcop hζ

theorem galEquivProd_apply (hcop : ((NumberField.discr L).natAbs).Coprime m) {ζ : M}
    (hζ : IsPrimitiveRoot ζ m) (σ : M ≃ₐ[K] M) :
    IsCyclotomicExtension.galEquivProd K L M m hcop hζ σ =
      (σ.restrictNormal L, hζ.autToPow K σ) :=
  IsCyclotomicExtension.galEquivProd_apply K L M m hcop hζ σ

variable {L M m} [NumberField M] [IsGalois K M]

/-- **Frobenius compatibility, with no power**: the fibre of `(σ, τ)` is the fibre of `σ` over `L`
cut by `𝔑𝔭 ≡ τ (mod m)`. -/
theorem mem_frobeniusPrimeSet_galEquivProd_symm_iff
    (hcop : ((NumberField.discr L).natAbs).Coprime m) {𝔭 : HeightOneSpectrum (𝓞 K)}
    (hm : (m : 𝓞 K) ∉ 𝔭.asIdeal)
    (hur : ∀ (Q : Ideal (𝓞 M)) [Q.IsPrime] [Q.LiesOver 𝔭.asIdeal],
      Algebra.IsUnramifiedAt (𝓞 K) Q)
    {ζ : M} (hζ : IsPrimitiveRoot ζ m) (σ : L ≃ₐ[K] L) (τ : (ZMod m)ˣ) :
    𝔭 ∈ frobeniusPrimeSet K M
        (ConjClasses.mk ((IsCyclotomicExtension.galEquivProd K L M m hcop hζ).symm (σ, τ))) ↔
      𝔭 ∈ frobeniusPrimeSet K L (ConjClasses.mk σ) ∧ (τ : ZMod m) = Ideal.absNorm 𝔭.asIdeal :=
  NumberField.Chebotarev.mem_frobeniusPrimeSet_galEquivProd_symm_iff hcop hm hur hζ σ τ

omit [IsGalois K L] [NeZero m] [IsGalois K M] in
/-- A prime unramified in `M` is unramified in each intermediate field. -/
theorem ramifiedPrimes_subset_ramifiedPrimes : ramifiedPrimes K L ⊆ ramifiedPrimes K M :=
  NumberField.Chebotarev.ramifiedPrimes_subset_ramifiedPrimes

omit [IsGalois K L] [NeZero m] [IsGalois K M] in
/-- The primes ramified in `M` but not in `L` lie above `m`. -/
theorem ramifiedPrimes_subset_ramifiedPrimes_union_natCast_mem :
    (ramifiedPrimes K M : Set (HeightOneSpectrum (𝓞 K))) ⊆
      ramifiedPrimes K L ∪ {𝔭 | (m : 𝓞 K) ∈ 𝔭.asIdeal} :=
  NumberField.Chebotarev.ramifiedPrimes_subset_ramifiedPrimes_union_natCast_mem m

end Compositum

section Restriction

variable {L M : Type*} [Field L] [NumberField L] [Field M] [NumberField M] [Algebra K L]
  [Algebra K M] [Algebra L M] [IsScalarTower K L M] [IsGalois K L] {q : ℕ} [NeZero q]
  [IsCyclotomicExtension {q} L M]

/-- **7.4 The restriction isomorphism** `Gal(M/K) ≃ Gal(L/K) × Gal(K(ζ_q)/K)`: restriction to `L`
and to `K(ζ_q)` is jointly bijective, for `q` unramified in `K` and coprime to `disc L`. -/
theorem bijective_restrictNormalHom_prod_restrictNormalHom (hq : q.Prime)
    (hcop : ((NumberField.discr L).natAbs).Coprime q) {ζ : M} (hζ : IsPrimitiveRoot ζ q)
    (hur : ∀ (𝔮 : Ideal (𝓞 K)) [𝔮.IsPrime] [𝔮.LiesOver (Ideal.span {(q : ℤ)})],
      Algebra.IsUnramifiedAt ℤ 𝔮) :
    haveI := (hζ.intermediateField_adjoin_isCyclotomicExtension K).isGalois
    Function.Bijective ((AlgEquiv.restrictNormalHom (F := K) (K₁ := M) L).prod
      (AlgEquiv.restrictNormalHom (F := K) (K₁ := M) K⟮ζ⟯)) := by
  have := hζ.intermediateField_adjoin_isCyclotomicExtension K
  have := (hζ.intermediateField_adjoin_isCyclotomicExtension K).isGalois
  have hinj : Function.Injective ((AlgEquiv.restrictNormalHom (F := K) (K₁ := M) L).prod
      (AlgEquiv.restrictNormalHom (F := K) (K₁ := M) K⟮ζ⟯)) := by
    rw [injective_iff_map_eq_one]
    intro σ hσ
    rw [MonoidHom.prod_apply, Prod.mk_eq_one] at hσ
    apply (IsCyclotomicExtension.galEquivProd K L M q hcop hζ).injective
    rw [map_one, IsCyclotomicExtension.galEquivProd_apply, Prod.mk_eq_one]
    refine ⟨hσ.1, (hζ.autToPow_eq_one_iff σ).mpr ?_⟩
    have h := AlgEquiv.restrictNormal_commutes σ K⟮ζ⟯ ⟨ζ, mem_adjoin_simple_self K ζ⟩
    have h1 : σ.restrictNormal K⟮ζ⟯ = 1 := hσ.2
    rw [h1] at h
    exact h.symm
  refine (Nat.bijective_iff_injective_and_card _).mpr ⟨hinj, ?_⟩
  rw [Nat.card_prod, Nat.card_congr (IsCyclotomicExtension.galEquivProd K L M q hcop hζ).toEquiv,
    Nat.card_prod, IsGalois.card_aut_eq_finrank K K⟮ζ⟯,
    IsCyclotomicExtension.finrank K⟮ζ⟯ (irreducible_cyclotomic_of_unramified q hq hur),
    Nat.card_eq_fintype_card (α := (ZMod q)ˣ), ZMod.card_units_eq_totient]

/-- The restriction isomorphism, packaged. -/
noncomputable example (hq : q.Prime) (hcop : ((NumberField.discr L).natAbs).Coprime q) {ζ : M}
    (hζ : IsPrimitiveRoot ζ q)
    (hur : ∀ (𝔮 : Ideal (𝓞 K)) [𝔮.IsPrime] [𝔮.LiesOver (Ideal.span {(q : ℤ)})],
      Algebra.IsUnramifiedAt ℤ 𝔮) :
    haveI := (hζ.intermediateField_adjoin_isCyclotomicExtension K).isGalois
    (M ≃ₐ[K] M) ≃* (L ≃ₐ[K] L) × (K⟮ζ⟯ ≃ₐ[K] K⟮ζ⟯) :=
  MulEquiv.ofBijective _ (bijective_restrictNormalHom_prod_restrictNormalHom hq hcop hζ hur)

/-- **`cyclotomicCrossing_linearDisjoint`**: `L` and `K(ζ_q)` are linearly disjoint over `K`
inside `M`. -/
theorem cyclotomicCrossing_linearDisjoint (hq : q.Prime)
    (hcop : ((NumberField.discr L).natAbs).Coprime q) {ζ : M} (hζ : IsPrimitiveRoot ζ q)
    (hur : ∀ (𝔮 : Ideal (𝓞 K)) [𝔮.IsPrime] [𝔮.LiesOver (Ideal.span {(q : ℤ)})],
      Algebra.IsUnramifiedAt ℤ 𝔮) :
    (IsScalarTower.toAlgHom K L M).fieldRange.LinearDisjoint K⟮ζ⟯ := by
  have := (hζ.intermediateField_adjoin_isCyclotomicExtension K).isGalois
  have : IsGalois K M :=
    IsCyclotomicExtension.isGalois_of_isGalois_of_isCyclotomicExtension K L M q
  have : IsGalois K (IsScalarTower.toAlgHom K L M).fieldRange :=
    IsGalois.of_algEquiv (AlgEquiv.ofInjectiveField (IsScalarTower.toAlgHom K L M))
  have hinf := (AlgEquiv.restrictNormalHom_prod_restrictNormalHom_surjective_iff
    (F := K) (E := M) (K₁ := L) (K₂ := K⟮ζ⟯)).mp
      (bijective_restrictNormalHom_prod_restrictNormalHom hq hcop hζ hur).2
  have hval : (IsScalarTower.toAlgHom K K⟮ζ⟯ M).fieldRange = K⟮ζ⟯ := by
    ext x
    exact ⟨fun ⟨y, hy⟩ ↦ hy ▸ y.2, fun hx ↦ ⟨⟨x, hx⟩, rfl⟩⟩
  rw [hval] at hinf
  exact LinearDisjoint.of_inf_eq_bot hinf

end Restriction

/-- **7.5** `Z ⊓ (G × 1) = 1` exactly when `orderOf σ ∣ orderOf τ`. -/
theorem zpowers_inf_top_prod_bot_eq_bot_of_orderOf_dvd {G H : Type*} [Group G] [Group H]
    (σ : G) (τ : H) (hστ : orderOf σ ∣ orderOf τ) :
    Subgroup.zpowers ((σ, τ) : G × H) ⊓ (⊤ : Subgroup G).prod (⊥ : Subgroup H) = ⊥ :=
  Subgroup.zpowers_inf_top_prod_bot_eq_bot_of_orderOf_dvd σ τ hστ

section Tagged

variable (L M : Type*) [Field L] [NumberField L] [Field M] [Algebra K L] [Algebra K M]
  [Algebra L M] [IsScalarTower K L M] [IsGalois K L] (m : ℕ) [NeZero m]
  [IsCyclotomicExtension {m} L M]

/-- **The tagged fixed field `E_τ` carries the cyclotomic extension** `M = E_τ(ζ_m)`. -/
theorem fixedField_zpowers_isCyclotomicExtension
    (hcop : ((NumberField.discr L).natAbs).Coprime m) {ζ : M} (hζ : IsPrimitiveRoot ζ m)
    (σ : L ≃ₐ[K] L) (τ : (ZMod m)ˣ) (hστ : orderOf σ ∣ orderOf τ) :
    IsCyclotomicExtension {m}
      (fixedField (Subgroup.zpowers
        ((IsCyclotomicExtension.galEquivProd K L M m hcop hζ).symm (σ, τ)))) M :=
  TauCeti.fixedField_zpowers_isCyclotomicExtension K L M m hcop hζ σ τ hστ

/-- The group of `M / E_τ` is `Z`, of order `orderOf τ`. -/
theorem card_algEquiv_fixedField_zpowers_eq_orderOf
    (hcop : ((NumberField.discr L).natAbs).Coprime m) {ζ : M} (hζ : IsPrimitiveRoot ζ m)
    (σ : L ≃ₐ[K] L) (τ : (ZMod m)ˣ) (hστ : orderOf σ ∣ orderOf τ) :
    Nat.card (M ≃ₐ[fixedField (Subgroup.zpowers
        ((IsCyclotomicExtension.galEquivProd K L M m hcop hζ).symm (σ, τ)))] M) = orderOf τ :=
  TauCeti.card_algEquiv_fixedField_zpowers_eq_orderOf K L M m hcop hζ σ τ hστ

/-- **Tagged Frobenius fibres for distinct tags are disjoint.** -/
theorem disjoint_taggedFrobeniusPrimeSet
    (hcop : ((NumberField.discr L).natAbs).Coprime m) {ζ : M} (hζ : IsPrimitiveRoot ζ m)
    (σ₁ σ₂ : L ≃ₐ[K] L) {τ υ : (ZMod m)ˣ} (hτυ : τ ≠ υ) :
    Disjoint (taggedFrobeniusPrimeSet K L M m hcop hζ σ₁ τ)
      (taggedFrobeniusPrimeSet K L M m hcop hζ σ₂ υ) :=
  NumberField.Chebotarev.disjoint_taggedFrobeniusPrimeSet K L M m hcop hζ σ₁ σ₂ hτυ

theorem taggedFrobeniusPrimeSet_def [NumberField M] [IsGalois K M]
    (hcop : ((NumberField.discr L).natAbs).Coprime m) {ζ : M} (hζ : IsPrimitiveRoot ζ m)
    (σ : L ≃ₐ[K] L) (τ : (ZMod m)ˣ) :
    taggedFrobeniusPrimeSet K L M m hcop hζ σ τ =
      frobeniusPrimeSet K M
        (ConjClasses.mk ((IsCyclotomicExtension.galEquivProd K L M m hcop hζ).symm (σ, τ))) :=
  NumberField.Chebotarev.taggedFrobeniusPrimeSet_def K L M m hcop hζ σ τ

end Tagged

end Layer7

/-! ## Layer 8: the cyclic fixed-field fibre -/

section Layer8

/-- **8.1 at residue degree one**: over `L ^ ⟨σ⟩` the relative Frobenius restricts to `σ` itself,
unpowered. The general laws are the two transport lemmas of Layer 1. -/
theorem exists_isArithFrobAt_and_restrictScalars_eq {K L : Type*} [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L] [IsGalois K L] (Q : Ideal (𝓞 L)) [Q.IsPrime]
    [Algebra.IsUnramifiedAt (𝓞 K) Q] (σ : L ≃ₐ[K] L) (hσ : IsArithFrobAt (𝓞 K) σ Q) :
    ∃ τ : L ≃ₐ[↥(fixedField (Subgroup.zpowers σ))] L,
      IsArithFrobAt (𝓞 ↥(fixedField (Subgroup.zpowers σ))) τ Q ∧
        AlgEquiv.restrictScalars K τ = σ :=
  Ideal.exists_isArithFrobAt_and_restrictScalars_eq Q σ hσ

section Seventh

open TauCeti.NumberField

variable {L : Type*} [Field L] [NumberField L] [IsCyclotomicExtension {7} ℚ L]

/-- **The tower-exponent regression** `ℚ ⊂ ℚ(√-7) ⊂ ℚ(ζ₇)` at `p = 3`. Frobenius at `3` is
`σ_3 : ζ ↦ ζ ^ 3`, of order `6`. -/
theorem autToPow_frobeniusThreeSeven :
    ((IsCyclotomicExtension.zeta_spec 7 ℚ L).autToPow ℚ (frobeniusThreeSeven (L := L)) :
      ZMod 7) = 3 :=
  TauCeti.NumberField.autToPow_frobeniusThreeSeven

theorem orderOf_frobeniusThreeSeven : orderOf (frobeniusThreeSeven (L := L)) = 6 :=
  TauCeti.NumberField.orderOf_frobeniusThreeSeven

/-- Restriction to the normal quadratic subfield takes no power, and is nontrivial. -/
theorem isArithFrobAt_restrictNormal_frobeniusThreeSeven
    (𝔭 : HeightOneSpectrum (𝓞 ℚ)) (h𝔭 : Ideal.absNorm 𝔭.asIdeal = 3)
    (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver 𝔭.asIdeal] :
    IsArithFrobAt (𝓞 ℚ)
      ((frobeniusThreeSeven (L := L)).restrictNormal
        (seventhCyclotomicQuadraticSubfield (L := L)))
      (Q.under (𝓞 (seventhCyclotomicQuadraticSubfield (L := L)))) :=
  TauCeti.NumberField.Chebotarev.isArithFrobAt_restrictNormal_frobeniusThreeSeven 𝔭 h𝔭 Q

theorem restrictNormal_frobeniusThreeSeven_ne_one :
    (frobeniusThreeSeven (L := L)).restrictNormal
      (seventhCyclotomicQuadraticSubfield (L := L)) ≠ 1 :=
  TauCeti.NumberField.restrictNormal_frobeniusThreeSeven_ne_one

/-- So `3` is inert in the quadratic subfield: `f(𝔭₃/3) = 2`. -/
theorem inertiaDeg_under_seventhCyclotomicQuadraticSubfield
    (𝔭 : HeightOneSpectrum (𝓞 ℚ)) (h𝔭 : Ideal.absNorm 𝔭.asIdeal = 3)
    (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver 𝔭.asIdeal] :
    (Q.under (𝓞 ↥(seventhCyclotomicQuadraticSubfield (L := L)))).inertiaDeg (𝓞 ℚ) = 2 :=
  TauCeti.NumberField.Chebotarev.inertiaDeg_under_seventhCyclotomicQuadraticSubfield 𝔭 h𝔭 Q

open TauCeti.NumberField.Chebotarev in
/-- Raising the base to `ℚ(√-7)` gives `σ_3 ^ 2 = σ_2`, of order `3`; neither `σ_3` nor
`σ_3⁻¹`, both of order `6`, could be the answer. -/
theorem exists_isArithFrobAt_restrictScalars_eq_frobeniusThreeSeven_sq
    (𝔭 : HeightOneSpectrum (𝓞 ℚ)) (h𝔭 : Ideal.absNorm 𝔭.asIdeal = 3)
    (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver 𝔭.asIdeal] :
    ∃ τ : L ≃ₐ[(seventhCyclotomicQuadraticSubfield (L := L))] L,
      IsArithFrobAt (𝓞 (seventhCyclotomicQuadraticSubfield (L := L))) τ Q ∧
        AlgEquiv.restrictScalars ℚ τ = frobeniusThreeSeven (L := L) ^ 2 ∧
        orderOf τ = 3 :=
  exists_isArithFrobAt_and_restrictScalars_eq_frobeniusThreeSeven_sq_and_orderOf_eq_three 𝔭 h𝔭 Q

/-- The quadratic subfield is `M = ℚ(√-7)`, generated by a Gaussian period squaring to `-7`. -/
theorem seventhCyclotomicQuadraticSubfield_eq_adjoin_sqrt_neg_seven :
    seventhCyclotomicQuadraticSubfield (L := L) =
        ℚ⟮seventhCyclotomicSqrtNegSeven (L := L)⟯ ∧
      seventhCyclotomicSqrtNegSeven (L := L) ^ 2 = -7 :=
  ⟨seventhCyclotomicQuadraticSubfield_eq_adjoin_sqrtNegSeven, seventhCyclotomicSqrtNegSeven_sq⟩

/-- `σ_3 ^ 2 = σ_2 : ζ₇ ↦ ζ₇ ^ 2`. -/
theorem frobeniusThreeSeven_sq_apply_zeta :
    (frobeniusThreeSeven (L := L) ^ 2) (IsCyclotomicExtension.zeta 7 ℚ L) =
      IsCyclotomicExtension.zeta 7 ℚ L ^ 2 := by
  rw [← (IsCyclotomicExtension.zeta_spec 7 ℚ L).autToPow_spec ℚ (frobeniusThreeSeven ^ 2),
    autToPow_frobeniusThreeSeven_sq]
  rfl

open TauCeti.NumberField.Chebotarev in
/-- `f(Q/𝔭₃) = 3`, the order of the relative Frobenius `σ_2`. -/
theorem inertiaDeg_seventhCyclotomicQuadraticSubfield_eq_three
    (𝔭 : HeightOneSpectrum (𝓞 ℚ)) (h𝔭 : Ideal.absNorm 𝔭.asIdeal = 3)
    (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver 𝔭.asIdeal] :
    Q.inertiaDeg (𝓞 (seventhCyclotomicQuadraticSubfield (L := L))) = 3 := by
  have : IsGalois ℚ L := IsCyclotomicExtension.isGalois {7} ℚ L
  have : IsGalois (seventhCyclotomicQuadraticSubfield (L := L)) L := by
    rw [seventhCyclotomicQuadraticSubfield_def]
    exact IsGalois.of_fixed_field L (Subgroup.zpowers (frobeniusThreeSeven (L := L) ^ 2))
  have h7 : (7 : 𝓞 ℚ) ∉ 𝔭.asIdeal := fun h ↦ by
    have hdvd := (Rat.HeightOneSpectrum.natCast_mem_iff_absNorm_asIdeal_dvd 𝔭).mp h
    rw [h𝔭] at hdvd
    norm_num at hdvd
  have : Algebra.IsUnramifiedAt (𝓞 ℚ) Q :=
    IsCyclotomicExtension.isUnramifiedAt_of_natCast_notMem L 7 h7 Q
  have : Algebra.IsUnramifiedAt (𝓞 (seventhCyclotomicQuadraticSubfield (L := L))) Q :=
    Algebra.IsUnramifiedAt.of_restrictScalars (𝓞 ℚ) Q
  obtain ⟨τ, hτ, -, hord⟩ :=
    exists_isArithFrobAt_and_restrictScalars_eq_frobeniusThreeSeven_sq_and_orderOf_eq_three 𝔭 h𝔭 Q
  rw [← Ideal.orderOf_eq_inertiaDeg_of_isArithFrobAt Q
    (Ideal.ne_bot_of_liesOver_of_ne_bot 𝔭.ne_bot Q) hτ, hord]

end Seventh

variable {K L : Type*} [Field K] [NumberField K] [Field L] [NumberField L] [Algebra K L]
  [IsGalois K L]

omit [IsGalois K L] in
/-- **8.2** `L / L ^ ⟨σ⟩` is cyclic, generated by the restriction of `σ`. -/
theorem zpowers_toFixedFieldAlgEquiv_eq_top (σ : L ≃ₐ[K] L) :
    Subgroup.zpowers (σ.toFixedFieldAlgEquiv) = ⊤ :=
  AlgEquiv.zpowers_toFixedFieldAlgEquiv_eq_top σ

/-- **The residue degree is the least power landing in the subgroup**, so `f(𝔓/𝔭) = 1` exactly
when `Frob ∈ H`. -/
theorem isLeast_pow_mem_inertiaDeg_under_fixedField (Q : Ideal (𝓞 L)) [Q.IsPrime] (hQ : Q ≠ ⊥)
    [Algebra.IsUnramifiedAt (𝓞 K) Q] (H : Subgroup (L ≃ₐ[K] L)) {φ : L ≃ₐ[K] L}
    (hφ : IsArithFrobAt (𝓞 K) φ Q) :
    IsLeast {n : ℕ | 0 < n ∧ φ ^ n ∈ H}
      ((Q.under (𝓞 ↥(fixedField H))).inertiaDeg (𝓞 K)) :=
  Ideal.isLeast_pow_mem_inertiaDeg_under_fixedField Q hQ H hφ

theorem inertiaDeg_under_fixedField_eq_one_iff (Q : Ideal (𝓞 L)) [Q.IsPrime] (hQ : Q ≠ ⊥)
    [Algebra.IsUnramifiedAt (𝓞 K) Q] (H : Subgroup (L ≃ₐ[K] L)) {φ : L ≃ₐ[K] L}
    (hφ : IsArithFrobAt (𝓞 K) φ Q) :
    (Q.under (𝓞 ↥(fixedField H))).inertiaDeg (𝓞 K) = 1 ↔ φ ∈ H :=
  Ideal.inertiaDeg_under_fixedField_eq_one_iff Q hQ H hφ

/-- `#C · f ∣ #G`, so the fibre count below is an exact quotient. -/
theorem card_carrier_mul_orderOf_dvd {G : Type*} [Group G] (C : ConjClasses G) (σ : G)
    (hσ : σ ∈ C.carrier) : Nat.card C.carrier * orderOf σ ∣ Nat.card G :=
  ConjClasses.card_carrier_mul_orderOf_dvd C σ hσ

/-- **The fibre count**: over each prime of class `C ∋ σ` lie exactly `#G / (#C · f)` primes of
`L ^ ⟨σ⟩` with relative Frobenius `σ`. -/
theorem fixedField_frobenius_fiber_card
    (C : ConjClasses (L ≃ₐ[K] L)) (σ : L ≃ₐ[K] L) (hσ : σ ∈ C.carrier)
    (p : HeightOneSpectrum (𝓞 K)) (hp : p ∈ frobeniusPrimeSet K L C) :
    Nat.card {P : HeightOneSpectrum (𝓞 ↥(fixedField (Subgroup.zpowers σ))) //
      P.under (𝓞 K) = p ∧
        P ∈ frobeniusPrimeSet ↥(fixedField (Subgroup.zpowers σ)) L
          (ConjClasses.mk σ.toFixedFieldAlgEquiv)} =
      Nat.card (L ≃ₐ[K] L) / (Nat.card C.carrier * orderOf σ) :=
  NumberField.Chebotarev.fixedField_frobenius_fiber_card C σ hσ p hp

/-- Away from the ramified primes, a prime of the relative fibre has residue degree one exactly
when it lies above a prime of class `[σ]`, so the primes counted above have residue degree one. -/
theorem inertiaDeg_eq_one_iff_under_mem_frobeniusPrimeSet (σ : L ≃ₐ[K] L)
    {P : HeightOneSpectrum (𝓞 ↥(fixedField (Subgroup.zpowers σ)))}
    (hP : P ∈ frobeniusPrimeSet ↥(fixedField (Subgroup.zpowers σ)) L
      (ConjClasses.mk σ.toFixedFieldAlgEquiv))
    (hram : P.under (𝓞 K) ∉ ramifiedPrimes K L) :
    P.asIdeal.inertiaDeg (𝓞 K) = 1 ↔
      P.under (𝓞 K) ∈ frobeniusPrimeSet K L (ConjClasses.mk σ) :=
  NumberField.Chebotarev.inertiaDeg_eq_one_iff_under_mem_frobeniusPrimeSet σ hP hram

/-- **The cyclic-generator test**: the required fibre has one member. -/
theorem fixedField_frobenius_fiber_card_of_generator (σ : L ≃ₐ[K] L)
    (hσ : Subgroup.zpowers σ = ⊤) (p : HeightOneSpectrum (𝓞 K))
    (hp : p ∈ frobeniusPrimeSet K L (ConjClasses.mk σ)) :
    Nat.card {P : HeightOneSpectrum (𝓞 ↥(fixedField (Subgroup.zpowers σ))) //
      P.under (𝓞 K) = p ∧
        P ∈ frobeniusPrimeSet ↥(fixedField (Subgroup.zpowers σ)) L
          (ConjClasses.mk σ.toFixedFieldAlgEquiv)} = 1 :=
  NumberField.Chebotarev.fixedField_frobenius_fiber_card_of_generator σ hσ p hp

/-- **The cyclic-generator test, second half**: over the same prime the relative identity fibre
is empty, since the relative class is `σ`, not the identity. -/
theorem fixedField_frobenius_fiber_one_eq_empty_of_generator (σ : L ≃ₐ[K] L)
    (hσ : Subgroup.zpowers σ = ⊤) (hσ1 : σ ≠ 1) (p : HeightOneSpectrum (𝓞 K))
    (hp : p ∈ frobeniusPrimeSet K L (ConjClasses.mk σ)) :
    {P : HeightOneSpectrum (𝓞 ↥(fixedField (Subgroup.zpowers σ))) |
      P.under (𝓞 K) = p ∧ P ∈ frobeniusPrimeSet ↥(fixedField (Subgroup.zpowers σ)) L 1} = ∅ := by
  refine Set.eq_empty_iff_forall_notMem.mpr fun P ⟨hPp, hP⟩ ↦ ?_
  rw [ConjClasses.one_eq_mk_one] at hP
  obtain ⟨hur, -⟩ := mem_frobeniusPrimeSet_iff.mp hp
  obtain ⟨Q, hQ1⟩ := exists_isArithFrobAt_of_mem_frobeniusPrimeSet_mk hP
  have : Q.1.IsPrime := Q.2.1
  have hQK : Q.1.under (𝓞 K) = p.asIdeal := by
    rw [← Ideal.under_under (B := 𝓞 ↥(fixedField (Subgroup.zpowers σ))) Q.1,
      ← Q.2.2.over, ← HeightOneSpectrum.under_asIdeal, hPp]
  have : Q.1.LiesOver p.asIdeal := ⟨hQK.symm⟩
  have hQ0 : Q.1 ≠ ⊥ := Ideal.ne_bot_of_liesOver_of_ne_bot p.ne_bot Q.1
  have : Algebra.IsUnramifiedAt (𝓞 K) Q.1 := hur Q.1
  have : Algebra.IsUnramifiedAt (𝓞 ↥(fixedField (Subgroup.zpowers σ))) Q.1 :=
    Algebra.IsUnramifiedAt.of_restrictScalars (𝓞 K) Q.1
  -- An absolute Frobenius `φ` at `Q` lies in `⟨σ⟩ = G`, so `f(𝔓/𝔭) = 1` and `φ` is itself the
  -- relative Frobenius at `Q`, which is `1`; but `φ` is conjugate to `σ ≠ 1`.
  obtain ⟨φ, hφ⟩ := NumberField.exists_isArithFrobAt (K := K) Q.1 hQ0
  have hdeg : (Q.1.under (𝓞 ↥(fixedField (Subgroup.zpowers σ)))).inertiaDeg (𝓞 K) = 1 :=
    (Ideal.inertiaDeg_under_fixedField_eq_one_iff Q.1 hQ0 _ hφ).mpr (hσ ▸ Subgroup.mem_top φ)
  obtain ⟨τ, hτ, hτφ⟩ := NumberField.exists_isArithFrobAt_pow_inertiaDeg
    (fixedField (Subgroup.zpowers σ)) Q.1 _ p.asIdeal rfl hQK hur φ hφ
  have hφ1 : φ = 1 := by
    rw [hdeg, pow_one, NumberField.isArithFrobAt_eq_of_isUnramifiedAt hτ hQ1] at hτφ
    rw [← hτφ]
    rfl
  have hne : ConjClasses.mk (1 : L ≃ₐ[K] L) ≠ ConjClasses.mk σ := by
    rw [Ne, ConjClasses.mk_eq_mk_iff_isConj, isConj_one_right]
    exact hσ1
  exact Set.disjoint_left.mp (disjoint_frobeniusPrimeSet hne)
    (mem_frobeniusPrimeSet_mk_of_isArithFrobAt hur Q.1 (hφ1 ▸ hφ)) hp

/-- Above a split-completely prime the fibre of `σ ≠ 1` is empty. -/
theorem fixedField_frobenius_fiber_eq_empty_of_mem_frobeniusPrimeSet_one
    (σ : L ≃ₐ[K] L) (hσ : σ ≠ 1) (p : HeightOneSpectrum (𝓞 K))
    (hp : p ∈ frobeniusPrimeSet K L 1) :
    {P : HeightOneSpectrum (𝓞 ↥(fixedField (Subgroup.zpowers σ))) |
      P.under (𝓞 K) = p ∧
        P ∈ frobeniusPrimeSet ↥(fixedField (Subgroup.zpowers σ)) L
          (ConjClasses.mk σ.toFixedFieldAlgEquiv)} = ∅ :=
  NumberField.Chebotarev.fixedField_frobenius_fiber_eq_empty_of_mem_frobeniusPrimeSet_one σ hσ p hp

omit [IsGalois K L] in
/-- **8.3 The exceptional set** is the primes of `E` above `ramifiedPrimes K L`. -/
theorem mem_primesAboveRamifiedPrimes_iff {E : Type*} [Field E] [NumberField E] [Algebra K E]
    (𝔓 : HeightOneSpectrum (𝓞 E)) :
    𝔓 ∈ primesAboveRamifiedPrimes K L E ↔ 𝔓.under (𝓞 K) ∈ ramifiedPrimes K L :=
  NumberField.Chebotarev.mem_primesAboveRamifiedPrimes_iff 𝔓

/-- It is strictly larger than the set of primes of `E` ramifying in `L`: the `S₃` witness for
`X ^ 3 - 2` at `2`. -/
theorem exists_mem_primesAboveRamifiedPrimes_not_mem_ramifiedPrimes_X_pow_three_sub_two :
    let f : Polynomial ℚ := Polynomial.X ^ 3 - 2
    let L := f.SplittingField
    ∃ beta : L, beta ∈ f.rootSet L ∧
      let E := fixedField (MulAction.stabilizer (L ≃ₐ[ℚ] L) beta)
      ∃ P : HeightOneSpectrum (𝓞 E),
        P.asIdeal.under ℤ = Ideal.span {(2 : ℤ)} ∧
          P ∈ primesAboveRamifiedPrimes ℚ L E ∧ P ∉ ramifiedPrimes E L :=
  TauCeti.exists_mem_primesAboveRamifiedPrimes_not_mem_ramifiedPrimes_X_pow_three_sub_two

end Layer8

/-! ## Layer 9: abelian Chebotarev -/

section Layer9

variable {H : Type*} [Group H] [Fintype H]

/-- `H_{q,f}` is the set of elements of order divisible by `f`. -/
theorem mem_taggedElements_iff {f : ℕ} {τ : H} :
    τ ∈ TauCeti.NumberField.Chebotarev.taggedElements f ↔ f ∣ orderOf τ :=
  TauCeti.NumberField.Chebotarev.mem_taggedElements_iff

/-- **The exact cyclic count.** -/
theorem card_taggedElements_cyclic [IsCyclic H] (f : ℕ) (hf : f ∣ Nat.card H) :
    ((TauCeti.NumberField.Chebotarev.taggedElements (H := H) f).card : ℝ) =
      (Nat.card H : ℝ) * ∏ p ∈ f.primeFactors,
        (1 - (p : ℝ) ^ (-(((Nat.card H).factorization p - f.factorization p + 1 : ℕ) : ℤ))) :=
  TauCeti.NumberField.Chebotarev.card_taggedElements_cyclic f hf

/-- **The size inequality** that makes the level `r` matter. -/
theorem le_card_taggedElements_cyclic [IsCyclic H] (f r : ℕ) (hrpos : 0 < r)
    (hf : f ^ r ∣ Nat.card H) :
    (1 - (2 : ℝ) ^ (-(r : ℤ))) ^ f.primeFactors.card * (Nat.card H : ℝ) ≤
      ((TauCeti.NumberField.Chebotarev.taggedElements (H := H) f).card : ℝ) :=
  TauCeti.NumberField.Chebotarev.le_card_taggedElements_cyclic f r hrpos hf

variable (K L : Type*) [Field K] [Field L] [Algebra K L]

/-- The crossing constant `c_q = #H_{q,f} / (#G · #H_q)`. -/
theorem crossingConstant_def (f : ℕ) :
    TauCeti.NumberField.Chebotarev.crossingConstant K L (H := H) f =
      ((TauCeti.NumberField.Chebotarev.taggedElements (H := H) f).card : ℝ) /
        ((Nat.card (L ≃ₐ[K] L) : ℝ) * (Nat.card H : ℝ)) :=
  TauCeti.NumberField.Chebotarev.crossingConstant_def K L f

/-- `c_q ≥ (1 - 2 ^ (-r)) ^ #f.primeFactors / #G`. -/
theorem le_crossingConstant [IsCyclic H] (f r : ℕ) (hrpos : 0 < r) (hf : f ^ r ∣ Nat.card H) :
    (1 - (2 : ℝ) ^ (-(r : ℤ))) ^ f.primeFactors.card / (Nat.card (L ≃ₐ[K] L) : ℝ) ≤
      TauCeti.NumberField.Chebotarev.crossingConstant K L (H := H) f :=
  TauCeti.NumberField.Chebotarev.le_crossingConstant K L f r hrpos hf

omit [Fintype H] in
/-- **Acceptance test 8**: in `C₄` with `f = 2` three elements are tagged, not one. -/
theorem card_taggedElements_two_of_card_four {H : Type*} [Group H] [Fintype H] [IsCyclic H]
    (hH : Nat.card H = 4) : (TauCeti.NumberField.Chebotarev.taggedElements (H := H) 2).card = 3 :=
  TauCeti.NumberField.Chebotarev.card_taggedElements_two_of_card_four hH

variable {K L} [NumberField K] [NumberField L] [IsGalois K L]

/-- **Abelian Chebotarev.** -/
theorem hasDirichletDensity_abelianFrobenius (hab : ∀ σ τ : L ≃ₐ[K] L, σ * τ = τ * σ)
    (σ : L ≃ₐ[K] L) :
    NumberField.Set.HasDirichletDensity (frobeniusPrimeSet K L (ConjClasses.mk σ))
      (1 / (Nat.card (L ≃ₐ[K] L) : ℝ)) :=
  NumberField.Chebotarev.hasDirichletDensity_abelianFrobenius K L hab σ

end Layer9

/-! ## Layer 10: Dirichlet-density Chebotarev -/

section Layer10

variable {K L : Type*} [Field K] [NumberField K] [Field L] [NumberField L] [Algebra K L]
  [IsGalois K L]

/-- **The Chebotarev density theorem**, over every number field `K`. -/
theorem hasDirichletDensity_frobeniusPrimeSet (C : ConjClasses (L ≃ₐ[K] L)) :
    NumberField.Set.HasDirichletDensity (frobeniusPrimeSet K L C)
      ((Nat.card C.carrier : ℝ) / (Nat.card (L ≃ₐ[K] L) : ℝ)) :=
  NumberField.Chebotarev.hasDirichletDensity_frobeniusPrimeSet K L C

/-- The route: the relative fibre over `L ^ ⟨σ⟩`, of density `1 / f`, contracts to `#C / #G`. -/
theorem hasDirichletDensity_frobeniusPrimeSet_of_fixedField (C : ConjClasses (L ≃ₐ[K] L))
    (σ : L ≃ₐ[K] L) (hσ : σ ∈ C.carrier)
    (h : (frobeniusPrimeSet ↥(fixedField (Subgroup.zpowers σ)) L
      (ConjClasses.mk σ.toFixedFieldAlgEquiv)).HasDirichletDensity (1 / orderOf σ)) :
    (frobeniusPrimeSet K L C).HasDirichletDensity (Nat.card C.carrier / Nat.card (L ≃ₐ[K] L)) :=
  NumberField.Chebotarev.hasDirichletDensity_frobeniusPrimeSet_of_fixedField C σ hσ h

/-- The split-completely primes, derived from the class theorem. -/
theorem hasDirichletDensity_splitCompletely :
    NumberField.Set.HasDirichletDensity (frobeniusPrimeSet K L 1)
      (1 / (Nat.card (L ≃ₐ[K] L) : ℝ)) :=
  NumberField.Chebotarev.hasDirichletDensity_splitCompletely K L

theorem frobeniusPrimeSet_one_eq_setOf_ncard_primesOver_eq_finrank :
    frobeniusPrimeSet K L 1 = {𝔭 | (𝔭.asIdeal.primesOver (𝓞 L)).ncard = Module.finrank K L} :=
  NumberField.Chebotarev.frobeniusPrimeSet_one_eq_setOf_ncard_primesOver_eq_finrank

omit [NumberField L] [IsGalois K L] in
/-- The non-Galois statement, through the Galois closure. -/
theorem hasDirichletDensity_setOf_ncard_primesOver_eq_finrank {M : Type*} [Field M]
    [NumberField M] [Algebra K M] [IsGalois K M] (E : IntermediateField K M) :
    {𝔭 : HeightOneSpectrum (𝓞 K) |
      (𝔭.asIdeal.primesOver (𝓞 E)).ncard = Module.finrank K E}.HasDirichletDensity
        (1 / Module.finrank K (IntermediateField.normalClosure K E M)) :=
  NumberField.Chebotarev.hasDirichletDensity_setOf_ncard_primesOver_eq_finrank E

theorem infinite_frobeniusPrimeSet (C : ConjClasses (L ≃ₐ[K] L)) :
    (frobeniusPrimeSet K L C).Infinite :=
  NumberField.Chebotarev.infinite_frobeniusPrimeSet K L C

/-- Invariance under finite symmetric difference. -/
theorem hasDirichletDensity_iff_of_finite_symmDiff_frobeniusPrimeSet
    {S : Set (HeightOneSpectrum (𝓞 K))} {C : ConjClasses (L ≃ₐ[K] L)} {δ : ℝ}
    (hS : (symmDiff S (frobeniusPrimeSet K L C)).Finite) :
    NumberField.Set.HasDirichletDensity S δ ↔
      δ = (Nat.card C.carrier : ℝ) / (Nat.card (L ≃ₐ[K] L) : ℝ) :=
  NumberField.Chebotarev.hasDirichletDensity_iff_of_finite_symmDiff_frobeniusPrimeSet hS

end Layer10

/-! ## Layer 11: the Frobenius von Mangoldt coefficient and its summatory functions -/

section Layer11

variable {K L : Type*} [Field K] [NumberField K] [Field L] [NumberField L] [Algebra K L]
  [IsGalois K L]

/-- **11.1** `Λ_C(n)` is the sum over the ideals of norm `n` of their Frobenius weight. -/
theorem frobeniusVonMangoldtCoeff_apply (C : ConjClasses (L ≃ₐ[K] L)) (n : ℕ) :
    frobeniusVonMangoldtCoeff K L C n =
      ∑ I ∈ normFiber K n, frobeniusVonMangoldtWeight K L C I :=
  NumberField.Chebotarev.frobeniusVonMangoldtCoeff_apply C n

/-- The weight vanishes off prime powers. -/
theorem frobeniusVonMangoldtWeight_eq_zero_of_not_isPrimePow (C : ConjClasses (L ≃ₐ[K] L))
    {I : (Ideal (𝓞 K))⁰} (hI : ¬ IsPrimePow (I : Ideal (𝓞 K))) :
    frobeniusVonMangoldtWeight K L C I = 0 :=
  NumberField.Chebotarev.frobeniusVonMangoldtWeight_eq_zero_of_not_isPrimePow C hI

/-- At `𝔭 ^ j` the weight is `log 𝔑𝔭` when the `j`-th power of the Artin class is `C`, else
`0`. -/
theorem frobeniusVonMangoldtWeight_idealPrimePower (C : ConjClasses (L ≃ₐ[K] L))
    (A : IdealPrimePower K) :
    frobeniusVonMangoldtWeight K L C (A : (Ideal (𝓞 K))⁰) =
      (frobeniusPrimePowerSet K L C).indicator
        (fun B ↦ Real.log (Ideal.absNorm (primePowerBase B).asIdeal)) A :=
  NumberField.Chebotarev.frobeniusVonMangoldtWeight_idealPrimePower C A

theorem mem_frobeniusPrimePowerSet_iff {A : IdealPrimePower K} {C : ConjClasses (L ≃ₐ[K] L)} :
    A ∈ frobeniusPrimePowerSet K L C ↔
      ∃ hur : ∀ (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver (primePowerBase A).asIdeal],
          Algebra.IsUnramifiedAt (𝓞 K) Q,
        artinSymbol (primePowerBase A).asIdeal hur ^ primePowerExponent A = C :=
  NumberField.Chebotarev.mem_frobeniusPrimePowerSet_iff

theorem frobeniusVonMangoldtCoeff_nonneg (C : ConjClasses (L ≃ₐ[K] L)) (n : ℕ) :
    0 ≤ frobeniusVonMangoldtCoeff K L C n :=
  NumberField.Chebotarev.frobeniusVonMangoldtCoeff_nonneg C n

theorem LSeriesSummable_frobeniusVonMangoldtCoeff (C : ConjClasses (L ≃ₐ[K] L)) {s : ℂ}
    (hs : 1 < s.re) : LSeriesSummable (fun n ↦ (frobeniusVonMangoldtCoeff K L C n : ℂ)) s :=
  NumberField.Chebotarev.LSeriesSummable_frobeniusVonMangoldtCoeff C hs

/-- **The degree-four regression** over `ℚ(ζ₅)`, Galois group `C₄ = ⟨g⟩` with `g ↦ 2`: the prime
`2` has Frobenius `g`, and its square `4` lies in the `g²` fibre, not the `g` fibre. -/
theorem frobeniusVonMangoldtCoeff_cyclotomic_five_of_galEquivZMod_eq_two
    (F : Type*) [Field F] [NumberField F] [IsCyclotomicExtension {5} ℚ F] [IsGalois ℚ F]
    {g : F ≃ₐ[ℚ] F} (hg : (IsCyclotomicExtension.Rat.galEquivZMod 5 F g : ZMod 5) = 2) :
    orderOf g = 4 ∧
      frobeniusVonMangoldtCoeff ℚ F (ConjClasses.mk g) 2 = Real.log 2 ∧
      frobeniusVonMangoldtCoeff ℚ F (ConjClasses.mk g) 4 = 0 ∧
      frobeniusVonMangoldtCoeff ℚ F (ConjClasses.mk g ^ 2) 4 = Real.log 2 :=
  NumberField.Chebotarev.frobeniusVonMangoldtCoeff_cyclotomic_five_of_galEquivZMod_eq_two F hg

/-- **11.2** `ψ_C(x) = ∑_{n ≤ x} Λ_C(n)`. -/
theorem frobeniusPsi_eq_sum_range (C : ConjClasses (L ≃ₐ[K] L)) (x : ℝ) :
    frobeniusPsi K L C x = ∑ n ∈ Finset.range (⌊x⌋₊ + 1), frobeniusVonMangoldtCoeff K L C n :=
  NumberField.Chebotarev.frobeniusPsi_eq_sum_range C x

/-- `ϑ_C` is the prime sum over the fibre, on the canonical prime subtype. -/
theorem frobeniusTheta_def (C : ConjClasses (L ≃ₐ[K] L)) (x : ℝ) :
    frobeniusTheta K L C x = primeTheta K (frobeniusPrimeSet K L C) x :=
  NumberField.Chebotarev.frobeniusTheta_def C x

/-- `0 ≤ ψ_C - ϑ_C`. -/
theorem frobeniusTheta_le_frobeniusPsi (C : ConjClasses (L ≃ₐ[K] L)) (x : ℝ) :
    frobeniusTheta K L C x ≤ frobeniusPsi K L C x :=
  NumberField.Chebotarev.frobeniusTheta_le_frobeniusPsi C x

/-- **11.3(1)** The prime powers `j ≥ 2` are bounded termwise by the all-prime tail. -/
theorem frobeniusPsi_sub_frobeniusTheta_le (C : ConjClasses (L ≃ₐ[K] L)) (x : ℝ) :
    frobeniusPsi K L C x - frobeniusTheta K L C x ≤
      primePsi K (Set.univ : Set (HeightOneSpectrum (𝓞 K))) x -
        primeTheta K (Set.univ : Set (HeightOneSpectrum (𝓞 K))) x :=
  NumberField.Chebotarev.frobeniusPsi_sub_frobeniusTheta_le C x

/-- So the prime powers `j ≥ 2` contribute `o(x)`. -/
theorem frobeniusPsi_sub_frobeniusTheta_isLittleO (C : ConjClasses (L ≃ₐ[K] L)) :
    (fun x ↦ frobeniusPsi K L C x - frobeniusTheta K L C x) =o[atTop] fun x : ℝ ↦ x :=
  NumberField.Chebotarev.frobeniusPsi_sub_frobeniusTheta_isLittleO C

omit [NumberField L] [IsGalois K L] in
/-- **11.3(2)** There are `O(√x)` primes of residue degree above one and norm at most `x`. -/
theorem primeCount_higherDegreePrimes_isBigO :
    primeCount K (higherDegreePrimes K) =O[atTop] Real.sqrt :=
  TauCeti.primeCount_higherDegreePrimes_isBigO

omit [NumberField L] [IsGalois K L] in
/-- Their weighted sum is `o(x)`. -/
theorem primeTheta_higherDegreePrimes_isLittleO :
    primeTheta K (higherDegreePrimes K) =o[atTop] fun x : ℝ ↦ x :=
  TauCeti.primeTheta_higherDegreePrimes_isLittleO K

omit [NumberField L] [IsGalois K L] in
/-- The absolute statement covers the relative one. -/
theorem mem_higherDegreePrimes_of_one_lt_inertiaDeg {E : Type*} [Field E] [Algebra K E]
    {𝔓 : HeightOneSpectrum (𝓞 E)} (h : 1 < 𝔓.asIdeal.inertiaDeg (𝓞 K)) :
    𝔓 ∈ higherDegreePrimes E :=
  TauCeti.mem_higherDegreePrimes_of_one_lt_inertiaDeg h

omit [NumberField L] [IsGalois K L] in
/-- **11.3(3)** A finite set of primes contributes at most `#T · log x`, so `O(log x)`. -/
theorem primePsi_le_ncard_mul_log {S : Set (HeightOneSpectrum (𝓞 K))} {x : ℝ} (hS : S.Finite)
    (hx : 1 ≤ x) : primePsi K S x ≤ S.ncard * Real.log x :=
  TauCeti.primePsi_le_ncard_mul_log hS hx

omit [NumberField L] [IsGalois K L] in
theorem primePsi_isBigO_log_of_finite {S : Set (HeightOneSpectrum (𝓞 K))} (hS : S.Finite) :
    primePsi K S =O[atTop] Real.log :=
  TauCeti.primePsi_isBigO_log_of_finite hS

/-- **11.3(4)** The total discarded error, as one theorem. -/
theorem frobeniusDiscard_isLittleO (C : ConjClasses (L ≃ₐ[K] L))
    (T : Finset (HeightOneSpectrum (𝓞 K))) :
    (fun x : ℝ ↦ frobeniusPsi K L C x - frobeniusTheta K L C x +
        primeTheta K (higherDegreePrimes K) x +
        primePsi K (T : Set (HeightOneSpectrum (𝓞 K))) x) =o[atTop] fun x : ℝ ↦ x :=
  NumberField.Chebotarev.frobeniusDiscard_isLittleO C T

/-- **11.4 The character expansion** of the canonical coefficient, inverse on the tag. -/
theorem LSeries_frobeniusVonMangoldtCoeff_eq_sum_logDeriv [IsMulCommutative (L ≃ₐ[K] L)]
    (σ : L ≃ₐ[K] L) {s : ℂ} (hs : 1 < s.re) :
    LSeries (fun n ↦ (frobeniusVonMangoldtCoeff K L (ConjClasses.mk σ) n : ℂ)) s =
      (Nat.card (L ≃ₐ[K] L) : ℂ)⁻¹ * ∑ χ : (L ≃ₐ[K] L) →* ℂˣ, (((χ σ)⁻¹ : ℂˣ) : ℂ) *
        -logDeriv (LSeries (normCoeff K
          (MonoidHom.galoisCharacterWeight (L := L) χ).toIdealArithmeticFunction)) s :=
  NumberField.Chebotarev.LSeries_frobeniusVonMangoldtCoeff_eq_sum_logDeriv σ hs

end Layer11

/-! ## Layer 12: the weighted transfer package and the Tauberian theorem -/

section Layer12

variable {K L : Type*} [Field K] [NumberField K] [Field L] [NumberField L] [Algebra K L]
  [IsGalois K L]

omit [NumberField L] [IsGalois K L] in
/-- **12.1 The ramified Euler correction**: the deleted factors are nonzero at `s = 1`. -/
theorem prod_one_sub_absNorm_cpow_neg_ne_zero (S : Finset (HeightOneSpectrum (𝓞 K))) {s : ℂ}
    (hs : 0 < s.re) : ∏ P ∈ S, (1 - (Ideal.absNorm P.asIdeal : ℂ) ^ (-s)) ≠ 0 :=
  TauCeti.prod_one_sub_absNorm_cpow_neg_ne_zero S hs

/-- So `L_1` has the simple pole of `ζ_K`, with the corrected residue. -/
theorem tendsto_sub_one_mul_LSeries_galoisCharacterWeight_one :
    Tendsto (fun s : ℝ ↦ (s - 1) * LSeries (normCoeff K
        (MonoidHom.galoisCharacterWeight (L := L)
          (1 : (L ≃ₐ[K] L) →* ℂˣ)).toIdealArithmeticFunction) s) (𝓝[>] 1)
      (𝓝 (dedekindZeta_residue K *
        ∏ P ∈ ramifiedPrimes K L, (1 - (Ideal.absNorm P.asIdeal : ℂ) ^ (-1 : ℂ)))) := by
  rw [MonoidHom.galoisCharacterWeight_one]
  exact TauCeti.tendsto_sub_one_mul_LSeries_ofBadPrimes (ramifiedPrimes K L)

/-- `G_1 = -L_1'/L_1 - 1/(s-1)` extends continuously to `Re s ≥ 1`. -/
theorem exists_continuousOn_eq_neg_logDeriv_galoisCharacterWeight_one_sub :
    ∃ G : ℂ → ℂ, ContinuousOn G {s | 1 ≤ s.re} ∧ ∀ s : ℂ, 1 < s.re →
      G s = -logDeriv (LSeries (normCoeff K
        (MonoidHom.galoisCharacterWeight (L := L)
          (1 : (L ≃ₐ[K] L) →* ℂˣ)).toIdealArithmeticFunction)) s - 1 / (s - 1) :=
  NumberField.Chebotarev.exists_continuousOn_eq_neg_logDeriv_galoisCharacterWeight_one_sub K L

/-- For nontrivial `χ`, `-L_χ'/L_χ` is already continuous on `Re s ≥ 1`. -/
theorem continuousOn_logDeriv_cyclotomicCharacterSeriesC (m : ℕ) [NeZero m]
    [IsCyclotomicExtension {m} K L] (χ : (L ≃ₐ[K] L) →* ℂˣ) (hχ : χ ≠ 1) :
    ContinuousOn (logDeriv (cyclotomicCharacterSeriesC K L χ)) {s | 1 ≤ s.re} :=
  NumberField.Chebotarev.continuousOn_logDeriv_cyclotomicCharacterSeriesC K L m χ hχ

/-- **12.2 The cyclotomic weighted theorem**, by Wiener–Ikehara on the nonnegative `Λ_σ`. -/
theorem frobeniusPsi_asymptotic_of_isCyclotomicExtension (m : ℕ) [NeZero m]
    [IsCyclotomicExtension {m} K L] (σ : L ≃ₐ[K] L) :
    (fun x : ℝ ↦ frobeniusPsi K L (ConjClasses.mk σ) x -
      (1 / Nat.card (L ≃ₐ[K] L) : ℝ) * x) =o[atTop] fun x : ℝ ↦ x :=
  NumberField.Chebotarev.frobeniusPsi_asymptotic_of_isCyclotomicExtension K L m σ

omit [NumberField L] [IsGalois K L] in
open scoped Classical in
/-- **`ψ_K(x) / x → 1`**. Tau Ceti proves it by summing 12.2 over `Gal(K(μ₃)/K)`, in the private
`TauCeti.NumberField.Chebotarev.primePsi_univ_asymptotic`; here it is the counting theorem for the
trivial extension `K / K`, whose single fibre accounts for `ψ_K` up to `O(log x)`. -/
theorem tendsto_primePsi_univ :
    Tendsto (fun x : ℝ ↦ primePsi K Set.univ x / x) atTop (𝓝 1) := by
  have h1 := NumberField.Chebotarev.tendsto_frobeniusPsi K K 1
  rw [ConjClasses.one_eq_mk_one, TauCeti.ConjClasses.card_carrier_mk_one, Nat.card_unique,
    Nat.cast_one, div_one] at h1
  have h2 := (NumberField.Chebotarev.primePsi_univ_sub_sum_frobeniusPsi_isBigO_log K K
    |>.trans_isLittleO Real.isLittleO_log_id_atTop).tendsto_div_nhds_zero
  have hsum (x : ℝ) : ∑ C : ConjClasses (K ≃ₐ[K] K), frobeniusPsi K K C x =
      frobeniusPsi K K (ConjClasses.mk 1) x := by
    refine Fintype.sum_eq_single (ConjClasses.mk 1) fun C hC ↦ (hC ?_).elim
    obtain ⟨g, rfl⟩ := ConjClasses.mk_surjective C
    rw [Subsingleton.elim g 1]
  simpa only [hsum, id, sub_div, sub_add_cancel, zero_add] using h2.add h1

/-- **12.3 The exact residue-degree-one contraction**, with no error term. -/
theorem primeTheta_fixedField_eq_mul_frobeniusTheta (C : ConjClasses (L ≃ₐ[K] L))
    (σ : L ≃ₐ[K] L) (hσ : σ ∈ C.carrier) (x : ℝ) :
    primeTheta ↥(fixedField (Subgroup.zpowers σ))
        {P | P ∈ frobeniusPrimeSet ↥(fixedField (Subgroup.zpowers σ)) L
            (ConjClasses.mk σ.toFixedFieldAlgEquiv) ∧
          P ∉ primesAboveRamifiedPrimes K L ↥(fixedField (Subgroup.zpowers σ)) ∧
          P.asIdeal.inertiaDeg (𝓞 K) = 1} x =
      ((Nat.card (L ≃ₐ[K] L) / (Nat.card C.carrier * orderOf σ) : ℕ) : ℝ) *
        frobeniusTheta K L C x :=
  NumberField.Chebotarev.primeTheta_fixedField_eq_mul_frobeniusTheta C σ hσ x

/-- **The `ψ` transfer up to `o(x)`**, prime powers removed on both sides. -/
theorem frobeniusPsi_fixedField_sub_mul_frobeniusPsi_isLittleO (C : ConjClasses (L ≃ₐ[K] L))
    (σ : L ≃ₐ[K] L) (hσ : σ ∈ C.carrier) :
    (fun x : ℝ ↦
      frobeniusPsi ↥(fixedField (Subgroup.zpowers σ)) L
          (ConjClasses.mk σ.toFixedFieldAlgEquiv) x -
        ((Nat.card (L ≃ₐ[K] L) / (Nat.card C.carrier * orderOf σ) : ℕ) : ℝ) *
          frobeniusPsi K L C x) =o[atTop] fun x : ℝ ↦ x :=
  NumberField.Chebotarev.frobeniusPsi_fixedField_sub_mul_frobeniusPsi_isLittleO C σ hσ

/-- **The degree-five example of 12.3**: in a cyclic extension of degree five with `G = ⟨g⟩`, a
prime with Frobenius `g³` is outside the fibre of `g`, but its square term is counted by `Λ_g`,
because `(g³)² = g`. -/
theorem frobeniusVonMangoldtWeight_sq_of_mem_frobeniusPrimeSet_pow_three {g : L ≃ₐ[K] L}
    (hg : Subgroup.zpowers g = ⊤) (h5 : Nat.card (L ≃ₐ[K] L) = 5)
    {𝔭 : HeightOneSpectrum (𝓞 K)} (h𝔭 : 𝔭 ∈ frobeniusPrimeSet K L (ConjClasses.mk (g ^ 3))) :
    𝔭 ∉ frobeniusPrimeSet K L (ConjClasses.mk g) ∧
      frobeniusVonMangoldtWeight K L (ConjClasses.mk g)
          (𝔭.idealPrimePowerOf 1 : (Ideal (𝓞 K))⁰) =
        Real.log (Ideal.absNorm 𝔭.asIdeal) := by
  have hord : orderOf g = 5 := by rw [orderOf_eq_card_of_zpowers_eq_top hg, h5]
  refine ⟨fun h ↦ ?_, ?_⟩
  · have hne : ConjClasses.mk (g ^ 3) ≠ ConjClasses.mk g := by
      have : IsCyclic (L ≃ₐ[K] L) := isCyclic_iff_exists_zpowers_eq_top.mpr ⟨g, hg⟩
      rw [Ne, ConjClasses.mk_eq_mk_iff_isConj, isConj_iff]
      rintro ⟨c, hc⟩
      rw [IsCyclic.commGroup.mul_comm c, mul_inv_cancel_right, pow_succ] at hc
      have h2 : g ^ 2 = 1 := by simpa using hc
      have := orderOf_dvd_of_pow_eq_one h2
      rw [hord] at this
      norm_num at this
    exact Set.disjoint_left.mp (disjoint_frobeniusPrimeSet hne) h𝔭 h
  · obtain ⟨hur, hart⟩ := mem_frobeniusPrimeSet_iff.mp h𝔭
    have hmem : 𝔭.idealPrimePowerOf 1 ∈ frobeniusPrimePowerSet K L (ConjClasses.mk g) := by
      rw [mem_frobeniusPrimePowerSet_iff, HeightOneSpectrum.primePowerBase_idealPrimePowerOf]
      refine ⟨hur, ?_⟩
      rw [hart, HeightOneSpectrum.primePowerExponent_idealPrimePowerOf, ConjClasses.mk_pow,
        ← pow_mul, show 3 * (1 + 1) = 5 + 1 by rfl, pow_succ, ← hord, pow_orderOf_eq_one, one_mul]
    rw [NumberField.Chebotarev.frobeniusVonMangoldtWeight_idealPrimePower,
      frobeniusPrimePowerWeight_of_mem hmem, primePowerWeight,
      HeightOneSpectrum.primePowerBase_idealPrimePowerOf]

/-- **12.4 The weighted crossing.** The prime-power terms of distinct classes above `C` are counted
by `ψ_C` disjointly. -/
theorem sum_frobeniusPsi_le_frobeniusPsi {M : Type*} [Field M] [NumberField M] [Algebra K M]
    [Algebra M L] [IsScalarTower K M L] [IsGalois K M] (C : ConjClasses (M ≃ₐ[K] M))
    (S : Finset (ConjClasses (L ≃ₐ[K] L)))
    (hS : ∀ D ∈ S, ConjClasses.map (AlgEquiv.restrictNormalHom M) D = C) (x : ℝ) :
    ∑ D ∈ S, frobeniusPsi K L D x ≤ frobeniusPsi K M C x :=
  NumberField.Chebotarev.sum_frobeniusPsi_le_frobeniusPsi C S hS x

open scoped Classical in
/-- The fibres account for `ψ_K` up to `O(log x)`. -/
theorem primePsi_univ_sub_sum_frobeniusPsi_isBigO_log :
    (fun x : ℝ ↦ primePsi K Set.univ x - ∑ C : ConjClasses (L ≃ₐ[K] L), frobeniusPsi K L C x)
      =O[atTop] Real.log :=
  NumberField.Chebotarev.primePsi_univ_sub_sum_frobeniusPsi_isBigO_log K L

/-- The squeeze gives the abelian weighted theorem. -/
theorem frobeniusPsi_asymptotic_of_mul_comm (hab : ∀ σ τ : L ≃ₐ[K] L, σ * τ = τ * σ)
    (σ : L ≃ₐ[K] L) :
    (fun x : ℝ ↦ frobeniusPsi K L (ConjClasses.mk σ) x -
      (1 / Nat.card (L ≃ₐ[K] L) : ℝ) * x) =o[atTop] fun x : ℝ ↦ x :=
  NumberField.Chebotarev.frobeniusPsi_asymptotic_of_mul_comm hab σ

/-- **12.5 The general theorem**, by contraction from `L / L ^ ⟨σ⟩`. -/
theorem frobeniusPsi_asymptotic_of_fixedField (C : ConjClasses (L ≃ₐ[K] L))
    (σ : L ≃ₐ[K] L) (hσ : σ ∈ C.carrier)
    (h : (fun x : ℝ ↦ frobeniusPsi ↥(fixedField (Subgroup.zpowers σ)) L
        (ConjClasses.mk σ.toFixedFieldAlgEquiv) x - 1 / orderOf σ * x)
          =o[atTop] (fun x : ℝ ↦ x)) :
    (fun x : ℝ ↦ frobeniusPsi K L C x -
      (Nat.card C.carrier / Nat.card (L ≃ₐ[K] L) : ℝ) * x) =o[atTop] (fun x : ℝ ↦ x) :=
  NumberField.Chebotarev.frobeniusPsi_asymptotic_of_fixedField C σ hσ h

/-- `ψ_C(x) / x → #C / #G`. -/
theorem tendsto_frobeniusPsi (C : ConjClasses (L ≃ₐ[K] L)) :
    Tendsto (fun x : ℝ ↦ frobeniusPsi K L C x / x) atTop
      (𝓝 ((Nat.card C.carrier : ℝ) / (Nat.card (L ≃ₐ[K] L) : ℝ))) :=
  NumberField.Chebotarev.tendsto_frobeniusPsi K L C

end Layer12

/-! ## Layer 13: `ϑ_C` and `π_C` -/

section Layer13

variable {K L : Type*} [Field K] [NumberField K] [Field L] [NumberField L] [Algebra K L]
  [IsGalois K L]

theorem tendsto_frobeniusTheta (C : ConjClasses (L ≃ₐ[K] L)) :
    Tendsto (fun x : ℝ ↦ frobeniusTheta K L C x / x) atTop
      (𝓝 ((Nat.card C.carrier : ℝ) / Nat.card (L ≃ₐ[K] L))) :=
  NumberField.Chebotarev.tendsto_frobeniusTheta K L C

/-- `π_C(x)` counts the primes of the fibre on the canonical prime subtype. -/
theorem frobeniusPrimeCount_eq_card (C : ConjClasses (L ≃ₐ[K] L)) (x : ℝ) :
    frobeniusPrimeCount K L C x =
      Nat.card {𝔭 : HeightOneSpectrum (𝓞 K) //
        𝔭 ∈ frobeniusPrimeSet K L C ∧ (Ideal.absNorm 𝔭.asIdeal : ℝ) ≤ x} :=
  NumberField.Chebotarev.frobeniusPrimeCount_eq_card C x

theorem tendsto_frobeniusPrimeCount (C : ConjClasses (L ≃ₐ[K] L)) :
    Tendsto (fun x : ℝ ↦ (frobeniusPrimeCount K L C x : ℝ) / (x / Real.log x))
      atTop (𝓝 ((Nat.card C.carrier : ℝ) / Nat.card (L ≃ₐ[K] L))) :=
  NumberField.Chebotarev.tendsto_frobeniusPrimeCount K L C

/-- The logarithmic-integral form. -/
theorem frobeniusPrimeCount_isEquivalent_logIntegral (C : ConjClasses (L ≃ₐ[K] L)) :
    (fun x : ℝ ↦ (frobeniusPrimeCount K L C x : ℝ)) ~[atTop]
      (fun x ↦ ((Nat.card C.carrier : ℝ) / Nat.card (L ≃ₐ[K] L)) * Real.logIntegral x) :=
  NumberField.Chebotarev.frobeniusPrimeCount_isEquivalent_logIntegral K L C

end Layer13

/-! ## Layer 14: natural density and consistency theorems -/

section Layer14

variable {K L : Type*} [Field K] [NumberField K] [Field L] [NumberField L] [Algebra K L]
  [IsGalois K L]

/-- **Natural density** is the ratio to the all-prime count. -/
example (S : Set (HeightOneSpectrum (𝓞 K))) (δ : ℝ) :
    NumberField.Set.HasNaturalDensity S δ ↔
      Tendsto (fun x : ℝ ↦ primeCount K S x /
        primeCount K (Set.univ : Set (HeightOneSpectrum (𝓞 K))) x) atTop (𝓝 δ) :=
  Iff.rfl

omit [NumberField L] [IsGalois K L] in
/-- **The prime ideal theorem for `K`**, the denominator, from the counting theorem for `K / K`,
as the private `TauCeti.NumberField.Chebotarev.tendsto_primeCount_univ` does. -/
theorem tendsto_primeCount_univ :
    Tendsto (fun x : ℝ ↦ primeCount K Set.univ x / (x / Real.log x)) atTop (𝓝 1) := by
  simpa only [natCast_frobeniusPrimeCount, TauCeti.NumberField.Chebotarev.frobeniusPrimeSet_self,
    ConjClasses.one_eq_mk_one, TauCeti.ConjClasses.card_carrier_mk_one, Nat.card_unique,
    Nat.cast_one, div_one] using NumberField.Chebotarev.tendsto_frobeniusPrimeCount K K 1

/-- **Natural-density Chebotarev**, from the counting theorem, not from Layer 10. -/
theorem hasNaturalDensity_frobeniusPrimeSet (C : ConjClasses (L ≃ₐ[K] L)) :
    NumberField.Set.HasNaturalDensity (frobeniusPrimeSet K L C)
      ((Nat.card C.carrier : ℝ) / Nat.card (L ≃ₐ[K] L)) :=
  NumberField.Chebotarev.hasNaturalDensity_frobeniusPrimeSet K L C

/-- **Agreement over `ℚ(ζ₅)`**: every class has density `1 / 4`, in both senses; Frobenius sends
`ζ₅ ↦ ζ₅ ^ p` by `isArithFrobAt_iff_galEquivZMod_eq_absNorm` at `n = 5`. -/
theorem hasDirichletDensity_frobeniusPrimeSet_cyclotomic_five
    (F : Type*) [Field F] [NumberField F] [IsCyclotomicExtension {5} ℚ F] [IsGalois ℚ F]
    (a : (ZMod 5)ˣ) :
    NumberField.Set.HasDirichletDensity
      (frobeniusPrimeSet ℚ F
        (ConjClasses.mk ((IsCyclotomicExtension.Rat.galEquivZMod 5 F).symm a))) (1 / 4) :=
  NumberField.Chebotarev.hasDirichletDensity_frobeniusPrimeSet_cyclotomic_five F a

theorem hasNaturalDensity_frobeniusPrimeSet_cyclotomic_five
    (F : Type*) [Field F] [NumberField F] [IsCyclotomicExtension {5} ℚ F] [IsGalois ℚ F]
    (a : (ZMod 5)ˣ) :
    NumberField.Set.HasNaturalDensity
      (frobeniusPrimeSet ℚ F
        (ConjClasses.mk ((IsCyclotomicExtension.Rat.galEquivZMod 5 F).symm a))) (1 / 4) :=
  NumberField.Chebotarev.hasNaturalDensity_frobeniusPrimeSet_cyclotomic_five F a

/-- **Agreement for the identity class**: the split-completely density `1 / [L : K]`. -/
theorem hasNaturalDensity_frobeniusPrimeSet_one :
    NumberField.Set.HasNaturalDensity (frobeniusPrimeSet K L 1)
      (1 / (Module.finrank K L : ℝ)) :=
  NumberField.Chebotarev.hasNaturalDensity_frobeniusPrimeSet_one K L

omit [IsGalois K L] in
/-- **Agreement under deletion of the ramified set.** -/
theorem hasNaturalDensity_compl_ramifiedPrimes :
    NumberField.Set.HasNaturalDensity
      ((↑(ramifiedPrimes K L) : Set (HeightOneSpectrum (𝓞 K)))ᶜ) 1 :=
  NumberField.Chebotarev.hasNaturalDensity_compl_ramifiedPrimes K L

theorem hasNaturalDensity_iff_of_finite_symmDiff_frobeniusPrimeSet
    {S : Set (HeightOneSpectrum (𝓞 K))} {C : ConjClasses (L ≃ₐ[K] L)} {δ : ℝ}
    (hS : (symmDiff S (frobeniusPrimeSet K L C)).Finite) :
    NumberField.Set.HasNaturalDensity S δ ↔
      δ = (Nat.card C.carrier : ℝ) / (Nat.card (L ≃ₐ[K] L) : ℝ) :=
  NumberField.Chebotarev.hasNaturalDensity_iff_of_finite_symmDiff_frobeniusPrimeSet hS

/-- **Compatibility of the Dirichlet and natural densities** on Frobenius fibres. -/
theorem hasNaturalDensity_frobeniusPrimeSet_iff_hasDirichletDensity
    (C : ConjClasses (L ≃ₐ[K] L)) {δ : ℝ} :
    NumberField.Set.HasNaturalDensity (frobeniusPrimeSet K L C) δ ↔
      NumberField.Set.HasDirichletDensity (frobeniusPrimeSet K L C) δ :=
  NumberField.Chebotarev.hasNaturalDensity_frobeniusPrimeSet_iff_hasDirichletDensity C

end Layer14

/-! ## Acceptance tests not stated above

Tests 1, 4, 6, 8, 9, 11, 12, 13 and 14 are statements of the corresponding layers. Tests 2, 3 and
10 are properties of those statements' types and proofs: cancellation is proved from ray-class
counts, the public API takes `HeightOneSpectrum`, and the auxiliary prime is fixed inside the
proofs of `hasDirichletDensity_abelianFrobenius` and `frobeniusPsi_asymptotic_of_mul_comm` while
the `x`-limit is taken. -/

/-- **Test 5**: no class is assigned at a ramified prime. -/
theorem frobeniusPrimeSet_subset_compl_ramifiedPrimes {K L : Type*} [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L] [IsGalois K L] (C : ConjClasses (L ≃ₐ[K] L)) :
    frobeniusPrimeSet K L C ⊆ (↑(ramifiedPrimes K L))ᶜ :=
  NumberField.Chebotarev.frobeniusPrimeSet_subset_compl_ramifiedPrimes C

/-- **Test 7, abelianity.** Column orthogonality fails on `S₃`: at the tag `1` and the
three-cycle, the character sum is not the indicator. -/
theorem sum_inv_mul_monoidHom_apply_finRotate_three_ne_ite :
    ∑ χ : Equiv.Perm (Fin 3) →* ℂˣ,
        (((χ 1)⁻¹ : ℂˣ) : ℂ) * ((χ (finRotate 3) : ℂˣ) : ℂ) ≠
      if finRotate 3 = (1 : Equiv.Perm (Fin 3)) then (Nat.card (Equiv.Perm (Fin 3)) : ℂ) else 0 :=
  TauCeti.sum_inv_mul_monoidHom_apply_finRotate_three_ne_ite ℂ

end TauCetiRoadmap.Chebotarev
