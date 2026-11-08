module

public import Mathlib
public import TauCeti.NumberTheory.HeckeRing.Associativity
public import TauCeti.NumberTheory.ModularForms.Newforms.Newform
public import TauCeti.NumberTheory.NumberField.Global.RayClass.Modulus
public import TauCeti.RepresentationTheory.CharacterTwist
public import TauCeti.RepresentationTheory.ClassicalGroups.SymmetricPower

/-!
# GL₂ automorphic representations and transfer: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These are suggested statements of substantive results on the pinned
Mathlib and Tau Ceti carriers; proving them does not finish the roadmap.

The statements cover Chevalley's congruence theorem and full-local finite Hecke
character prescription (R16.1.7–R16.1.8), projectivity of supercuspidals with fixed
central character (R16.2.10), quaternion ramification realization and its local-global
isomorphism criterion (R17.1.5), finite-image arithmetic projective lifting
(R17.5.4), Fong–Swan lifting with an actual residual module in every rank
(R17.5.12), and the solvable characteristic-two projective-image classification
(R17.6.6). Two endpoint statements give odd solvable Artin modularity over ℚ
(R17.5.9) and solvable characteristic-two residual modularity (R17.6.13) by the
arithmetic Frobenius traces and determinants of actual weight-one newforms.
Finite Galois quotients express finite-image Galois representations; the residual
statement supplies an integral coefficient field and a residue map above two.

The classical quaternionic forms of R17.3.8a–R17.3.8d are stated with five
definitions: the weight-`(n, s)` slash `algWeightSlash` on polynomials of bounded
degree and its right action `algWeightAction` of `∏ GL₂(K)`, the diagonal embedding
`quaternionDiagonal` of `Dˣ` in the finite adelic units, the level-form module
`quaternionLevelForms`, and `GL₂` of a local valuation ring (`gl2Integral`). The statements
give the action law and the symmetric-power comparison of the coefficient modules, finiteness
of level forms at open levels for every quaternion algebra over every number field, the
dimension of classical forms with trivial stabilizer action, and, in the local Hecke ring
of `GL₂(𝒪)` inside any monoid containing it, the good-place relation
`T_v² = T_{v²} + (q_v + 1) S_v` and the inversion formulas `[K η⁻¹ K] = S_v⁻¹ T_v` and
`[K ϖ⁻¹ K] = S_v⁻¹`.

The pinned libraries have algebraic representations, matrix groups, number-field
completions, idele classes and classical newforms. They do not have the local
Weil–Deligne and admissible smooth representation classifications needed for the
finite-place Langlands correspondence and conductor/factor comparisons
(R16.0, R16.2–R16.3). The projectivity statement instead spells out smoothness,
admissibility and compact support modulo the centre on Mathlib representations.

Cuspidal adelic classes, their central-character L² and restricted tensor
realizations, local Whittaker models and quaternionic automorphic spectra are
absent at the pins. Thus the global dictionary and analytic recognition results
(R16.4–R16.6), local/global Jacquet–Langlands and trace comparisons
(R17.1–R17.3, apart from R17.3.8a–R17.3.8d), all-place cyclic, solvable and cubic base change, automorphic
induction and the Gelbart–Jacquet lift (R17.4), and the all-place Langlands–Tunnell theorem over arbitrary number fields (R17.5)
have no statements here. The classical Frobenius statement does not express
exact Artin conductor or ramified local-factor equality.

The remaining R17.6 conclusions require modular-curve coefficient cohomology,
constructible ℓ-adic correspondence traces, Katz forms, Artin conductors and
Galois attachments of eigenforms, none of which has the required carrier at the
pins. Rohrlich–Tunnell's exact-weight and exact-level theorem, unramified Katz
weight one, ramified conductor comparison and compatible-system automorphic
descent therefore have no statements here. The residual Frobenius statement
expresses the good-prime coefficient criterion without a Galois-attachment carrier. Matrix identities and abstract character-twist
lemmas do not state these conclusions.
-/

public section

namespace TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer

open _root_.Matrix

/-! ## Layer R16.1: Local and adelic groups -/

section ArithmeticCharacterPrescription

open NumberField IsDedekindDomain TauCeti.GlobalNumberFields
open scoped NumberField

variable {K : Type*} [Field K] [NumberField K]

/-- R16.1.7: Chevalley's theorem detects powers in a finitely generated
multiplicative subgroup by congruences avoiding any prescribed finite set. -/
theorem chevalley_power_congruence (E : Subgroup Kˣ) [Group.FG E]
    (n : ℕ) (hn : 0 < n) (T : Finset (HeightOneSpectrum (𝓞 K))) :
    ∃ m : Modulus K, m.infinitePart = ∅ ∧ Disjoint m.support T ∧
      ∀ x : E, IsCongrOne m (x : Kˣ) → ∃ y : E, y ^ n = x := by sorry

/-- R16.1.8: finite characters of full multiplicative local fields extend to a
finite Hecke character trivial at infinity, allowing auxiliary ramification. -/
theorem finite_hecke_full_local_prescription
    (S : Finset (HeightOneSpectrum (𝓞 K)))
    (χ : ∀ v : S, ContinuousMonoidHom (v.val.adicCompletion K)ˣ ℂˣ)
    (hχ : ∀ v : S, (Set.range (χ v)).Finite) :
    ∃ Ψ : ContinuousMonoidHom (IdeleClassGroup (𝓞 K) K) ℂˣ,
      (Set.range Ψ).Finite ∧
      (∀ v : S, Ψ.toMonoidHom.comp
        (IdeleClassGroup.ofAdicCompletion (𝓞 K) K v.val) = (χ v).toMonoidHom) ∧
      (∀ w : InfinitePlace K, Ψ.toMonoidHom.comp
        (IdeleClassGroup.ofCompletion (𝓞 K) K w) = 1) := by sorry

end ArithmeticCharacterPrescription

/-! ## Layer R16.2: Local representations and newvectors -/

section SupercuspidalProjectivity

/-- R16.2/supercuspidal-projective on the existing representation carriers, over
any nonarchimedean local field `F`, of either characteristic.
Smoothness means open vector stabilizers, admissibility means finite-dimensional
compact-open invariants, and supercuspidality uses compact-mod-center matrix
coefficients against the smooth dual. The latter two conditions are required
only of π. Every representation has the same scalar central character ω.
The conclusion lifts an equivariant linear map through a surjective equivariant
linear map. There is no topology on the coefficient modules in this smooth
category. The separate L-coefficient DLB descent interface is not asserted here. -/
theorem supercuspidalProjective
    {F : Type*} [Field F] [ValuativeRel F] [TopologicalSpace F]
    [IsNonarchimedeanLocalField F]
    {V W X : Type*} [AddCommGroup V] [Module ℂ V]
    [AddCommGroup W] [Module ℂ W] [AddCommGroup X] [Module ℂ X]
    (π : Representation ℂ (GeneralLinearGroup (Fin 2) F) V)
    (σ : Representation ℂ (GeneralLinearGroup (Fin 2) F) W)
    (τ : Representation ℂ (GeneralLinearGroup (Fin 2) F) X)
    [Representation.IsIrreducible π]
    (ω : Fˣ →* ℂˣ) (hω : IsOpen (ω.ker : Set Fˣ))
    (hπsm : ∀ v : V, IsOpen {g | π g v = v})
    (hσsm : ∀ w : W, IsOpen {g | σ g w = w})
    (hτsm : ∀ x : X, IsOpen {g | τ g x = x})
    (hπcent : ∀ z v, π (GeneralLinearGroup.scalar (Fin 2) z) v = (ω z : ℂ) • v)
    (hσcent : ∀ z w, σ (GeneralLinearGroup.scalar (Fin 2) z) w = (ω z : ℂ) • w)
    (hτcent : ∀ z x, τ (GeneralLinearGroup.scalar (Fin 2) z) x = (ω z : ℂ) • x)
    (hπadm : ∀ K : Subgroup (GeneralLinearGroup (Fin 2) F),
      IsCompact (K : Set (GeneralLinearGroup (Fin 2) F)) →
      IsOpen (K : Set (GeneralLinearGroup (Fin 2) F)) →
      FiniteDimensional ℂ (Representation.invariants (π.comp K.subtype)))
    (hπcusp : ∀ (v : V) (ell : V →ₗ[ℂ] ℂ),
      IsOpen {g : GeneralLinearGroup (Fin 2) F | ∀ w, ell (π g w) = ell w} →
      IsCompact (closure ((QuotientGroup.mk : GeneralLinearGroup (Fin 2) F →
        GeneralLinearGroup (Fin 2) F ⧸ Subgroup.center (GeneralLinearGroup (Fin 2) F)) ''
          {g | ell (π g v) ≠ 0})))
    (q : Representation.IntertwiningMap σ τ) (hq : Function.Surjective q)
    (f : Representation.IntertwiningMap π τ) :
    ∃ lift : Representation.IntertwiningMap π σ, q.comp lift = f := by sorry

end SupercuspidalProjectivity

/-! ## Layer R17.1: Quaternionic local transfer -/

section QuaternionRamification
open NumberField IsDedekindDomain
open scoped NumberField
variable {K : Type*} [Field K] [NumberField K]

/-- R17.1.5: quaternion ramification is realizable exactly for an even set
of finite and real places. -/
theorem existsQuaternionRamification_iff
    (Sf : Finset (HeightOneSpectrum (𝓞 K))) (Si : Finset (InfinitePlace K)) :
    (∃ a b : Kˣ,
      (∀ v : HeightOneSpectrum (𝓞 K),
        Nonempty (QuaternionAlgebra (v.adicCompletion K)
          (algebraMap K (v.adicCompletion K) (a : K)) 0
          (algebraMap K (v.adicCompletion K) (b : K)) ≃ₐ[v.adicCompletion K]
          Matrix (Fin 2) (Fin 2) (v.adicCompletion K)) ↔ v ∉ Sf) ∧
      (∀ w : InfinitePlace K,
        Nonempty (QuaternionAlgebra w.Completion
          (algebraMap K w.Completion (a : K)) 0
          (algebraMap K w.Completion (b : K)) ≃ₐ[w.Completion]
          Matrix (Fin 2) (Fin 2) w.Completion) ↔ w ∉ Si)) ↔
    (∀ w ∈ Si, w.IsReal) ∧ Even (Sf.card + Si.card) := by sorry

/-- R17.1.5: the local-global isomorphism criterion for quaternion algebras. -/
theorem nonempty_quaternionAlgEquiv_of_localSplitting (a b c d : Kˣ)
    (hf : ∀ v : HeightOneSpectrum (𝓞 K),
      Nonempty (QuaternionAlgebra (v.adicCompletion K)
        (algebraMap K (v.adicCompletion K) (a : K)) 0
        (algebraMap K (v.adicCompletion K) (b : K)) ≃ₐ[v.adicCompletion K]
        Matrix (Fin 2) (Fin 2) (v.adicCompletion K)) ↔
      Nonempty (QuaternionAlgebra (v.adicCompletion K)
        (algebraMap K (v.adicCompletion K) (c : K)) 0
        (algebraMap K (v.adicCompletion K) (d : K)) ≃ₐ[v.adicCompletion K]
        Matrix (Fin 2) (Fin 2) (v.adicCompletion K)))
    (hi : ∀ w : InfinitePlace K,
      Nonempty (QuaternionAlgebra w.Completion
        (algebraMap K w.Completion (a : K)) 0
        (algebraMap K w.Completion (b : K)) ≃ₐ[w.Completion]
        Matrix (Fin 2) (Fin 2) w.Completion) ↔
      Nonempty (QuaternionAlgebra w.Completion
        (algebraMap K w.Completion (c : K)) 0
        (algebraMap K w.Completion (d : K)) ≃ₐ[w.Completion]
        Matrix (Fin 2) (Fin 2) w.Completion)) :
    Nonempty (QuaternionAlgebra K (a : K) 0 (b : K) ≃ₐ[K]
      QuaternionAlgebra K (c : K) 0 (d : K)) := by sorry

end QuaternionRamification

/-! ## Layer R17.3: Global Jacquet–Langlands -/

section AlgebraicCoefficients

open MvPolynomial

variable {K : Type*} [CommRing K] {ι : Type*} [Fintype ι]

/-- R17.3.8a: the right slash of `γ = (γ_i)_i ∈ ∏_i GL₂(K)` in weight `(n, s)`, polynomial
convention: on monomials,
`z^m ↦ ∏_i det(γ_i)^{s_i} (a_i z_i + b_i)^{m_i} (c_i z_i + d_i)^{n_i - m_i}`, which on the
polynomials of degree at most `n_i` in `z_i` is
`P ↦ ∏_i det(γ_i)^{s_i} (c_i z_i + d_i)^{n_i} · P((a_i z_i + b_i)/(c_i z_i + d_i))`. -/
noncomputable def algWeightSlash (n : ι → ℕ) (s : ι → ℤ) (γ : ι → GL (Fin 2) K) :
    MvPolynomial ι K →ₗ[K] MvPolynomial ι K :=
  (basisMonomials ι K).constr K fun m =>
    C (∏ i, ((GeneralLinearGroup.det (γ i) ^ s i : Kˣ) : K)) *
      ∏ i, (C ((γ i : Matrix (Fin 2) (Fin 2) K) 0 0) * X i +
          C ((γ i : Matrix (Fin 2) (Fin 2) K) 0 1)) ^ m i *
        (C ((γ i : Matrix (Fin 2) (Fin 2) K) 1 0) * X i +
          C ((γ i : Matrix (Fin 2) (Fin 2) K) 1 1)) ^ (n i - m i)

/-- R17.3.8a: the weight-`(n, s)` slash preserves the polynomials of degree at most `n_i` in
each variable `z_i`. -/
theorem algWeightSlash_mem (n : ι → ℕ) (s : ι → ℤ) (γ : ι → GL (Fin 2) K)
    {P : MvPolynomial ι K} (hP : P ∈ restrictSupport K {m : ι →₀ ℕ | ∀ i, m i ≤ n i}) :
    algWeightSlash n s γ P ∈ restrictSupport K {m : ι →₀ ℕ | ∀ i, m i ≤ n i} := by sorry

/-- R17.3.8a: on polynomials of bounded degree the slash is a right action,
`P|(γδ) = (P|γ)|δ`. -/
theorem algWeightSlash_mul (n : ι → ℕ) (s : ι → ℤ) (γ δ : ι → GL (Fin 2) K)
    {P : MvPolynomial ι K} (hP : P ∈ restrictSupport K {m : ι →₀ ℕ | ∀ i, m i ≤ n i}) :
    algWeightSlash n s (γ * δ) P = algWeightSlash n s δ (algWeightSlash n s γ P) := by sorry

/-- R17.3.8a: the identity acts trivially on polynomials of bounded degree. -/
theorem algWeightSlash_one (n : ι → ℕ) (s : ι → ℤ)
    {P : MvPolynomial ι K} (hP : P ∈ restrictSupport K {m : ι →₀ ℕ | ∀ i, m i ≤ n i}) :
    algWeightSlash n s 1 P = P := by sorry

/-- R17.3.8a: the algebraic coefficient module `L_{n,s}(K)` of polynomials of degree at most
`n_i` in `z_i`, with the right action of `∏_i GL₂(K)` by the weight-`(n, s)` slash. -/
noncomputable def algWeightAction (n : ι → ℕ) (s : ι → ℤ) :
    (ι → GL (Fin 2) K)ᵐᵒᵖ →*
      Module.End K (restrictSupport K {m : ι →₀ ℕ | ∀ i, m i ≤ n i}) where
  toFun γ := (algWeightSlash n s γ.unop).restrict fun _ hP => algWeightSlash_mem n s γ.unop hP
  map_one' := LinearMap.ext fun P => Subtype.ext (algWeightSlash_one n s P.2)
  map_mul' γ δ := LinearMap.ext fun P => Subtype.ext (algWeightSlash_mul n s δ.unop γ.unop P.2)

end AlgebraicCoefficients

section SymmetricPowerComparison

open MvPolynomial
open scoped TensorProduct

/-- R17.3.8a: in one variable, over every commutative ring, `L_{n,s}(K)` with the left action
`g ↦ (·)|g⁻¹` is the `n`th symmetric power of the standard representation twisted by
`det^{-n-s}`. -/
theorem algWeight_equiv_symPowerRep (K : Type) [CommRing K] (n : ℕ) (s : ℤ) :
    ∃ e : restrictSupport K {m : Unit →₀ ℕ | ∀ i, m i ≤ n} ≃ₗ[K] Sym[K]^n (Fin 2 → K),
      ∀ (g : GL (Fin 2) K) (P : restrictSupport K {m : Unit →₀ ℕ | ∀ i, m i ≤ n}),
        e (algWeightAction (fun _ => n) (fun _ => s) (MulOpposite.op fun _ => g⁻¹) P) =
          Representation.charTwist
            ((zpowGroupHom (-(n : ℤ) - s)).comp GeneralLinearGroup.det)
            (TauCeti.symPowerRep K 2 n) g (e P) := by sorry

end SymmetricPowerComparison

section QuaternionicForms

open IsDedekindDomain NumberField
open scoped NumberField TensorProduct

variable {F : Type*} [Field F] [NumberField F] {D : Type*} [Ring D] [Algebra F D]

/-- R17.3.8b: the diagonal embedding of `Dˣ` in the finite adelic units
`(𝔸_{F,f} ⊗_F D)ˣ`. -/
noncomputable def quaternionDiagonal :
    Dˣ →* (FiniteAdeleRing (𝓞 F) F ⊗[F] D)ˣ :=
  Units.map (Algebra.TensorProduct.includeRight : D →ₐ[F] FiniteAdeleRing (𝓞 F) F ⊗[F] D)

/-- R17.3.8b: quaternionic level forms of level `U` with values in a right `Δ`-module `A`:
functions `φ` on the finite adelic units with `φ(γ g u) = φ(g)|u` for `γ ∈ Dˣ`, `u ∈ U`. -/
def quaternionLevelForms {R A : Type*} [CommRing R] [AddCommGroup A] [Module R A]
    (Δ : Submonoid (FiniteAdeleRing (𝓞 F) F ⊗[F] D)ˣ) (ρ : Δᵐᵒᵖ →* Module.End R A)
    (U : Subgroup (FiniteAdeleRing (𝓞 F) F ⊗[F] D)ˣ) (hU : U.toSubmonoid ≤ Δ) :
    Submodule R ((FiniteAdeleRing (𝓞 F) F ⊗[F] D)ˣ → A) where
  carrier := {φ | ∀ (γ : Dˣ) (g : (FiniteAdeleRing (𝓞 F) F ⊗[F] D)ˣ) (u : U),
    φ (quaternionDiagonal γ * g * (u : (FiniteAdeleRing (𝓞 F) F ⊗[F] D)ˣ)) =
      ρ (MulOpposite.op ⟨u, hU u.2⟩) (φ g)}
  add_mem' {φ ψ} hφ hψ γ g u := by
    simp only [Pi.add_apply, map_add, hφ γ g u, hψ γ g u]
  zero_mem' γ g u := by simp
  smul_mem' c φ hφ γ g u := by
    simp only [Pi.smul_apply, map_smul, hφ γ g u]

/-- R17.3.8b: at an open level, compact or not, quaternionic level forms with finite
coefficients over a Noetherian ring form a finite module, for every quaternion algebra over
every number field and every right coefficient action. -/
theorem quaternionLevelForms_finite [Algebra.IsCentral F D] [IsSimpleRing D]
    (hD : Module.finrank F D = 4)
    [TopologicalSpace (FiniteAdeleRing (𝓞 F) F ⊗[F] D)]
    [IsModuleTopology (FiniteAdeleRing (𝓞 F) F) (FiniteAdeleRing (𝓞 F) F ⊗[F] D)]
    {R A : Type*} [CommRing R] [IsNoetherianRing R] [AddCommGroup A] [Module R A]
    [Module.Finite R A]
    (Δ : Submonoid (FiniteAdeleRing (𝓞 F) F ⊗[F] D)ˣ) (ρ : Δᵐᵒᵖ →* Module.End R A)
    (U : Subgroup (FiniteAdeleRing (𝓞 F) F ⊗[F] D)ˣ) (hU : U.toSubmonoid ≤ Δ)
    (hUo : IsOpen (U : Set (FiniteAdeleRing (𝓞 F) F ⊗[F] D)ˣ)) :
    Module.Finite R (quaternionLevelForms Δ ρ U hU) := by sorry

/-- R17.3.8c: classical quaternionic forms with coefficients `L_{n,s}(K)`, acted on through
any homomorphism `τ` of the finite adelic units to `∏_i GL₂(K)`, at an open level whose
arithmetic stabilizers act trivially, are finite-dimensional of dimension
`#Cl(U) · ∏_i (n_i + 1)`. -/
theorem classicalForms_finrank [Algebra.IsCentral F D] [IsSimpleRing D]
    (hD : Module.finrank F D = 4)
    [TopologicalSpace (FiniteAdeleRing (𝓞 F) F ⊗[F] D)]
    [IsModuleTopology (FiniteAdeleRing (𝓞 F) F) (FiniteAdeleRing (𝓞 F) F ⊗[F] D)]
    {K ι : Type*} [Field K] [Fintype ι] (n : ι → ℕ) (s : ι → ℤ)
    (τ : (FiniteAdeleRing (𝓞 F) F ⊗[F] D)ˣ →* (ι → GL (Fin 2) K))
    (U : Subgroup (FiniteAdeleRing (𝓞 F) F ⊗[F] D)ˣ)
    (hUo : IsOpen (U : Set (FiniteAdeleRing (𝓞 F) F ⊗[F] D)ˣ))
    (htriv : ∀ x u : (FiniteAdeleRing (𝓞 F) F ⊗[F] D)ˣ, u ∈ U →
      x * u * x⁻¹ ∈ (quaternionDiagonal (F := F) (D := D)).range →
      algWeightAction n s (MulOpposite.op (τ u)) = 1) :
    Module.Finite K (quaternionLevelForms ⊤
        ((algWeightAction n s).comp ((MonoidHom.op τ).comp
          (MonoidHom.op (⊤ : Submonoid (FiniteAdeleRing (𝓞 F) F ⊗[F] D)ˣ).subtype)))
        U le_top) ∧
      Module.finrank K (quaternionLevelForms ⊤
        ((algWeightAction n s).comp ((MonoidHom.op τ).comp
          (MonoidHom.op (⊤ : Submonoid (FiniteAdeleRing (𝓞 F) F ⊗[F] D)ˣ).subtype)))
        U le_top) =
        Nat.card (DoubleCoset.Quotient
          ((quaternionDiagonal (F := F) (D := D)).range :
            Set (FiniteAdeleRing (𝓞 F) F ⊗[F] D)ˣ)
          (U : Set (FiniteAdeleRing (𝓞 F) F ⊗[F] D)ˣ)) * ∏ i, (n i + 1) := by sorry

end QuaternionicForms

section LocalHecke

open ValuativeRel
open scoped HeckeCosetModule

variable (L : Type*) [Field L] [ValuativeRel L] [TopologicalSpace L]
  [IsNonarchimedeanLocalField L]

/-- R17.3.8d: `GL₂` of the valuation ring, as a subgroup of `GL₂(L)`. -/
noncomputable def gl2Integral : Subgroup (GL (Fin 2) L) :=
  (GeneralLinearGroup.map (𝒪[L]).subtype).range

/-- R17.3.8d: every element of `GL₂(L)` commensurates `GL₂(𝒪)`, so any submonoid containing
`GL₂(𝒪)`, such as the invertible matrices with entries in `𝒪` or all of `GL₂(L)`, forms a Hecke
pair with it. -/
theorem gl2Integral_isHeckeTriple {Δ : Submonoid (GL (Fin 2) L)}
    (hΔ : (gl2Integral L).toSubmonoid ≤ Δ) :
    IsHeckeTriple Δ (gl2Integral L) (gl2Integral L) := by sorry

/-- R17.3.8d: the good-place relation `T_v² = T_{v²} + (q_v + 1) S_v` in the Hecke ring of
`GL₂(𝒪)` inside any submonoid containing the three double cosets, for a uniformizer `ϖ` and
residue field of cardinality `q_v`. -/
theorem gl2_hecke_T_sq (Δ : Submonoid (GL (Fin 2) L))
    [IsHeckeTriple Δ (gl2Integral L) (gl2Integral L)]
    (ϖ : Lˣ) (hϖ : ∃ h : (ϖ : L) ∈ 𝒪[L], Irreducible (⟨ϖ, h⟩ : 𝒪[L]))
    (t t₂ z : Δ)
    (ht : ((t : GL (Fin 2) L) : Matrix (Fin 2) (Fin 2) L) = !![(ϖ : L), 0; 0, 1])
    (ht₂ : ((t₂ : GL (Fin 2) L) : Matrix (Fin 2) (Fin 2) L) = !![(ϖ : L) ^ 2, 0; 0, 1])
    (hz : ((z : GL (Fin 2) L) : Matrix (Fin 2) (Fin 2) L) = !![(ϖ : L), 0; 0, (ϖ : L)]) :
    HeckeCosetModule.single ℤ (HeckeCoset.mk (gl2Integral L) (gl2Integral L) t) 1 *
        HeckeCosetModule.single ℤ (HeckeCoset.mk (gl2Integral L) (gl2Integral L) t) 1 =
      HeckeCosetModule.single ℤ (HeckeCoset.mk (gl2Integral L) (gl2Integral L) t₂) 1 +
        ((Nat.card 𝓀[L] + 1 : ℕ) : ℤ) •
          HeckeCosetModule.single ℤ (HeckeCoset.mk (gl2Integral L) (gl2Integral L) z) 1 := by
  sorry

/-- R17.3.8d: the inversion formulas `[K η⁻¹ K] = S_v⁻¹ T_v` and `[K ϖ⁻¹ K] = S_v⁻¹`, with
`η = diag(ϖ, 1)` and `S_v = [K ϖ K]`, in the Hecke ring of `K = GL₂(𝒪)` inside any submonoid
containing these double cosets, for instance all of `GL₂(L)`. -/
theorem gl2_hecke_inv (Δ : Submonoid (GL (Fin 2) L))
    [IsHeckeTriple Δ (gl2Integral L) (gl2Integral L)]
    (ϖ : Lˣ) (hϖ : ∃ h : (ϖ : L) ∈ 𝒪[L], Irreducible (⟨ϖ, h⟩ : 𝒪[L]))
    (t t' z z' : Δ)
    (ht : ((t : GL (Fin 2) L) : Matrix (Fin 2) (Fin 2) L) = !![(ϖ : L), 0; 0, 1])
    (ht' : ((t' : GL (Fin 2) L) : Matrix (Fin 2) (Fin 2) L) = !![((ϖ⁻¹ : Lˣ) : L), 0; 0, 1])
    (hz : ((z : GL (Fin 2) L) : Matrix (Fin 2) (Fin 2) L) = !![(ϖ : L), 0; 0, (ϖ : L)])
    (hz' : ((z' : GL (Fin 2) L) : Matrix (Fin 2) (Fin 2) L) =
      !![((ϖ⁻¹ : Lˣ) : L), 0; 0, ((ϖ⁻¹ : Lˣ) : L)]) :
    HeckeCosetModule.single ℤ (HeckeCoset.mk (gl2Integral L) (gl2Integral L) t') 1 =
        HeckeCosetModule.single ℤ (HeckeCoset.mk (gl2Integral L) (gl2Integral L) z') 1 *
          HeckeCosetModule.single ℤ (HeckeCoset.mk (gl2Integral L) (gl2Integral L) t) 1 ∧
      HeckeCosetModule.single ℤ (HeckeCoset.mk (gl2Integral L) (gl2Integral L) z') 1 *
          HeckeCosetModule.single ℤ (HeckeCoset.mk (gl2Integral L) (gl2Integral L) z) 1 =
        1 := by
  sorry

end LocalHecke

/-! ## Layer R17.5: Automorphic induction and solvable Artin representations -/

open IsDedekindDomain NumberField
open scoped NumberField

/-- R17.5.4: every finite continuous complex projective rank-two Galois
representation of a number field has a finite continuous linear lift.
An open kernel expresses factorization through a finite continuous quotient. -/
theorem finite_projective_lift (F : Type*) [Field F] [NumberField F]
    (r : Field.absoluteGaloisGroup F →* ProjGenLinGroup (Fin 2) ℂ)
    (hr : IsOpen (r.ker : Set (Field.absoluteGaloisGroup F))) :
    ∃ ρ : Field.absoluteGaloisGroup F →* GeneralLinearGroup (Fin 2) ℂ,
      IsOpen (ρ.ker : Set (Field.absoluteGaloisGroup F)) ∧ Set.Finite (Set.range ρ) ∧
        ProjGenLinGroup.mk.comp ρ = r := by sorry

/-- R17.5.9: odd solvable Artin representations over ℚ have weight-one newforms
with their arithmetic Frobenius traces and determinants. -/
theorem odd_solvable_artin_weight_one
    (E : Type*) [Field E] [NumberField E] [IsGalois ℚ E]
    (ι : E →+* ℂ) (c : E ≃ₐ[ℚ] E)
    (hc : ∀ x : E, ι (c x) = star (ι x))
    (ρ : (E ≃ₐ[ℚ] E) →* GeneralLinearGroup (Fin 2) ℂ)
    (hsolv : Group.IsSolvable (ProjGenLinGroup.mk.comp ρ).range)
    (hirr : Representation.IsIrreducible
      ((Units.coeHom (Module.End ℂ (Fin 2 → ℂ))).comp
        (GeneralLinearGroup.toLin.toMonoidHom.comp ρ)))
    (hodd : GeneralLinearGroup.det (ρ c) = -1) :
    ∃ (N : ℕ) (_ : NeZero N) (f : HeckeRing.GL2.Newform N 1),
      ∀ (p : ℕ) (_ : Fact p.Prime), p.Coprime N →
        ∀ (Q : Ideal (𝓞 E)) (_ : Q.IsPrime)
          (_ : Q.LiesOver (Ideal.span {(p : ℤ)}))
          (_ : Algebra.IsUnramifiedAt ℤ Q)
          (σ : E ≃ₐ[ℚ] E), IsArithFrobAt ℤ σ Q →
          (UpperHalfPlane.qExpansion 1 f.toCuspForm).coeff p = (ρ σ).val.trace ∧
          f.dirichletLift p = (GeneralLinearGroup.det (ρ σ) : ℂ) := by sorry

/-- R17.5.12: Fong–Swan lifting in every rank, with a free stable lattice
whose reduction is the specified irreducible residual representation. -/
theorem solvable_finite_image_integral_lift
    (Γ : Type*) [Group Γ] [Finite Γ] (hsolv : Group.IsSolvable Γ)
    (p : ℕ) [Fact p.Prime]
    (k : Type*) [Field k] [CharP k p] [IsAlgClosed k]
    (n : ℕ) (r : Γ →* GeneralLinearGroup (Fin n) k)
    (hirr : Representation.IsIrreducible
      ((Units.coeHom (Module.End k (Fin n → k))).comp
        (GeneralLinearGroup.toLin.toMonoidHom.comp r))) :
    ∃ (E : Type) (_ : Field E) (_ : NumberField E)
      (v : HeightOneSpectrum (𝓞 E)),
      ∃ (f : Localization.AtPrime v.asIdeal →+* k)
        (ρ : Γ →* GeneralLinearGroup (Fin n) (Localization.AtPrime v.asIdeal))
        (P : GeneralLinearGroup (Fin n) k),
        (p : 𝓞 E) ∈ v.asIdeal ∧
        RingHom.ker f = IsLocalRing.maximalIdeal (Localization.AtPrime v.asIdeal) ∧
        ∀ g : Γ, r g = P * GeneralLinearGroup.map f (ρ g) * P⁻¹ := by sorry

/-! ## Layer R17.6: Characteristic two and residual modularity -/

/-- R17.6.6: a finite irreducible rank-two representation in characteristic
two with solvable projective image has odd dihedral projective image. -/
theorem solvable_characteristicTwo_projective_dihedral
    {G k : Type*} [Group G] [Field k] [CharP k 2] [IsAlgClosed k]
    (r : G →* GeneralLinearGroup (Fin 2) k)
    (hfinite : Set.Finite (Set.range r))
    (hsolv : Group.IsSolvable (ProjGenLinGroup.mk.comp r).range)
    (hirr : Representation.IsIrreducible
      ((Units.coeHom (Module.End k (Fin 2 → k))).comp
        (GeneralLinearGroup.toLin.toMonoidHom.comp r))) :
    ∃ n : ℕ, 3 ≤ n ∧ Odd n ∧
      Nonempty ((ProjGenLinGroup.mk.comp r).range ≃* DihedralGroup n) := by sorry

/-- R17.6.13: solvable residual representations in characteristic two arise from
weight-one newforms, expressed by integral good-prime coefficients. -/
theorem characteristicTwo_solvable_weight_one
    (E : Type*) [Field E] [NumberField E] [IsGalois ℚ E]
    (k : Type*) [Field k] [CharP k 2] [IsAlgClosed k]
    (r : (E ≃ₐ[ℚ] E) →* GeneralLinearGroup (Fin 2) k)
    (hsolv : Group.IsSolvable (ProjGenLinGroup.mk.comp r).range)
    (hirr : Representation.IsIrreducible
      ((Units.coeHom (Module.End k (Fin 2 → k))).comp
        (GeneralLinearGroup.toLin.toMonoidHom.comp r))) :
    ∃ (N : ℕ) (_ : NeZero N) (f : HeckeRing.GL2.Newform N 1)
      (L : Type) (_ : Field L) (_ : NumberField L)
      (ι : L →+* ℂ) (v : IsDedekindDomain.HeightOneSpectrum (𝓞 L)),
      ∃ red : 𝓞 L →+* k,
        (2 : 𝓞 L) ∈ v.asIdeal ∧
        RingHom.ker red = v.asIdeal ∧
        ∀ (p : ℕ) (_ : Fact p.Prime), p.Coprime (2 * N) →
          ∀ (Q : Ideal (𝓞 E)) (_ : Q.IsPrime)
            (_ : Q.LiesOver (Ideal.span {(p : ℤ)}))
            (_ : Algebra.IsUnramifiedAt ℤ Q)
            (σ : E ≃ₐ[ℚ] E), IsArithFrobAt ℤ σ Q →
            ∃ a d : 𝓞 L,
              ι (a : L) = (UpperHalfPlane.qExpansion 1 f.toCuspForm).coeff p ∧
              ι (d : L) = f.dirichletLift p ∧
              red a = (r σ).val.trace ∧
              red d = (GeneralLinearGroup.det (r σ) : k) := by sorry

end TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer

end
