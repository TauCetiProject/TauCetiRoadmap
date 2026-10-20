import Mathlib
import TauCeti.Geometry.Hodge.Dimension
import TauCeti.Geometry.Hodge.Dual
import TauCeti.Geometry.Hodge.Prod
import TauCeti.Geometry.Hodge.Tate.Basic
import TauCeti.Geometry.Hodge.Tate.Twist
import TauCeti.Topology.Algebra.Group.Profinite.CompletedGroupAlgebra.Map

/-!
# Selmer groups and Iwasawa cohomology: suggested Lean forms

**This file is not the roadmap and it is not exhaustive.** `README.md` is definitive, and §k.n
below refers to its subsections. The file records light definitions with real bodies over
carriers that exist in the pinned Mathlib and Tau Ceti, the end theorems and layer milestones
that can be stated against them, and checks that fix the conventions. Theorems are stated with
`sorry` proofs; nothing here is claimed formalised, and proving every item does not by itself
complete a layer.

Design choices made explicit here:

* ArithmeticGaloisDuality §§R02.3.0a–R02.3.0c supply multiplicative completion and S-units;
  §§D7.7.1–D7.7.6 supply pairings, annihilators and mapping-fibre duality.
* The algebraic Selmer diagram `SelmerData` takes actual global and local modules and maps; its
  identification with continuous Galois cohomology is a README target.
* The Selmer-complex carrier takes an explicitly supplied local diagram. Its ordinary instance
  uses continuous cochains at every place; its modified instance uses finite-place cochains,
  complete Tate cochains at real places and zero at complex places, with localization composed
  with the ordinary-to-Tate maps. Arithmetic compact support and derived duality use the
  modified instance, identified with the supplier’s Tate-modified `Ĉ_c`. Its comparison with
  the finite-place `GaloisCohomology.compactCochains` is a quasi-isomorphism when the real
  Tate terms are acyclic, in particular under (P). The H⁰ correction uses the chosen diagram,
  and the archimedean comparison retains the difference between the two fibres even at odd p.
* ℤ_p-corank is computed on a compact dual (`corankFromDual`); Iwasawa corank is computed on
  each finite compact component dual (`iwasawaCorankFromComponentDual`).
* PadicPeriodRings §§1.1–1.5, 2–3, 4.1–4.3 supply the period carriers, functors and fixed fields.
  FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P2–R07.P5a supply finite-K comparisons,
  additional sequences, continuous sections, boundary maps and integral crystalline predicates;
  the aliases `localIsTorsionCrystalline(R,a,b)` and `localIsIntegralCrystalline(R,a,b)`
  pass interval `[-b,-a]` to the supplier’s positive Hodge–Tate convention, for the local
  convention `HT(ℚ_p(1)) = -1`. Section R07.3.3a supplies filtered Frobenius modules.
  Local Tate duality sends `[-b-1,-a-1]` to supplier interval `[a+1,b+1]`.
* Archimedean realizations extend Tau Ceti's opposed Hodge filtrations by a complex-linear
  Betti involution; the L-function Tate line has Hodge–Tate index `-n` and Gamma factor `Γℝ(s - n)`.

Selmer complexes, Iwasawa cohomology, determinant lines, étale cohomology of `Spec 𝒪_{F,S}`,
Selmer groups of elliptic curves and Hida families are not available at the pins; their targets
are stated in the README only (closing comment).
-/

noncomputable section

open scoped TensorProduct NumberField

namespace TauCetiRoadmap.SelmerIwasawaCohomology

/-- §3.0: the Iwasawa involution induced by group inversion through `domCongr`. -/
def iwasawaInvolution (O Γ : Type*) [CommRing O] [CommGroup Γ] [TopologicalSpace Γ]
    [IsTopologicalGroup Γ] :
    TauCeti.completedGroupAlgebra O Γ ≃ₐ[O] TauCeti.completedGroupAlgebra O Γ :=
  TauCeti.completedGroupAlgebra.domCongr O
    { Equiv.inv Γ with
      map_mul' := fun a b => mul_inv a b
      continuous_toFun := continuous_inv
      continuous_invFun := continuous_inv }

example (O Γ : Type*) [CommRing O] [CommGroup Γ] [TopologicalSpace Γ]
    [IsTopologicalGroup Γ] (γ : Γ) :
    iwasawaInvolution O Γ (TauCeti.completedGroupAlgebra.of O Γ γ) =
      TauCeti.completedGroupAlgebra.of O Γ γ⁻¹ :=
  TauCeti.completedGroupAlgebra.domCongr_of O _ γ

/-! ## Layer 0: Completions and coefficient limits -/

section WeakSemisimplicity

variable {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]

/-- §0.12: the natural map from fixed vectors to coinvariants of an endomorphism. -/
def invariantCoinvariantMap (σ : M →ₗ[R] M) :
    LinearMap.ker (σ - LinearMap.id) →ₗ[R] M ⧸ LinearMap.range (σ - LinearMap.id) :=
  (LinearMap.range (σ - LinearMap.id)).mkQ.comp (LinearMap.ker (σ - LinearMap.id)).subtype

/-- §0.12: weak semisimplicity at eigenvalue one means bijectivity of invariants to
coinvariants. -/
def IsWeaklySemisimple (σ : M →ₗ[R] M) : Prop := Function.Bijective (invariantCoinvariantMap σ)

/-- §0.12: the invariant and image submodules are complementary exactly when the natural map is
bijective. -/
theorem weaklySemisimple_iff_split (σ : M →ₗ[R] M) :
    IsWeaklySemisimple σ ↔ IsCompl (LinearMap.ker (σ - LinearMap.id))
      (LinearMap.range (σ - LinearMap.id)) := sorry

/-- §0.12: equivariant linear equivalences preserve weak semisimplicity. -/
theorem weaklySemisimple_congr {N : Type*} [AddCommGroup N] [Module R N]
    (σ : M →ₗ[R] M) (τ : N →ₗ[R] N) (e : M ≃ₗ[R] N)
    (h : e.toLinearMap.comp σ = τ.comp e.toLinearMap) :
    IsWeaklySemisimple σ ↔ IsWeaklySemisimple τ := sorry

/-- §0.12: weak semisimplicity holds on a product exactly when it holds on each factor. -/
theorem weaklySemisimple_sum {N : Type*} [AddCommGroup N] [Module R N]
    (σ : M →ₗ[R] M) (τ : N →ₗ[R] N) :
    IsWeaklySemisimple (σ.prodMap τ) ↔ IsWeaklySemisimple σ ∧ IsWeaklySemisimple τ := sorry

/-- §0.13: on a Noetherian module, surjectivity of the invariant-to-coinvariant map
already gives weak semisimplicity. -/
theorem weaklySemisimple_of_surjective [IsNoetherian R M] (σ : M →ₗ[R] M)
    (h : Function.Surjective (invariantCoinvariantMap σ)) : IsWeaklySemisimple σ := sorry

end WeakSemisimplicity

section IntegralLifting

variable {O K M : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [Field K] [Algebra O K] [IsFractionRing O K] [AddCommGroup M] [Module O M]
    [Module.Free O M] [Module.Finite O M]

/-- §0.13, integral lifting: residual weak semisimplicity and the invariant-dimension
inequality give integral weak semisimplicity and equality of the two dimensions. -/
theorem weaklySemisimple_integral_lift (σ : M →ₗ[O] M)
    (hres : IsWeaklySemisimple (σ.baseChange (IsLocalRing.ResidueField O)))
    (hdim : Module.finrank (IsLocalRing.ResidueField O)
        (LinearMap.ker (σ.baseChange (IsLocalRing.ResidueField O) - LinearMap.id)) ≤
      Module.finrank K (LinearMap.ker (σ.baseChange K - LinearMap.id))) :
    IsWeaklySemisimple σ ∧
      Module.finrank K (LinearMap.ker (σ.baseChange K - LinearMap.id)) =
        Module.finrank (IsLocalRing.ResidueField O)
          (LinearMap.ker (σ.baseChange (IsLocalRing.ResidueField O) - LinearMap.id)) := sorry

end IntegralLifting

namespace Tests

/-- The size-two Jordan operator with a given rational eigenvalue. -/
def jordan (a : ℚ) : (ℚ × ℚ) →ₗ[ℚ] (ℚ × ℚ) where
  toFun x := (a * x.1 + x.2, a * x.2)
  map_add' := by intros; ext <;> simp <;> ring
  map_smul' := by intros; ext <;> simp <;> ring

/-- §0.12: the unipotent Jordan block sends its invariant line to zero in coinvariants. -/
theorem not_weaklySemisimple_jordan_one : ¬ IsWeaklySemisimple (jordan 1) := by
  intro h
  let e₁ : LinearMap.ker (jordan 1 - LinearMap.id) :=
    ⟨(1, 0), by simp [LinearMap.mem_ker, jordan]⟩
  have he₁ : invariantCoinvariantMap (jordan 1) e₁ = 0 := by
    change (LinearMap.range (jordan 1 - LinearMap.id)).mkQ (1, 0) = 0
    apply (Submodule.Quotient.mk_eq_zero _).mpr
    exact ⟨(0, 1), by simp [jordan]⟩
  have hz : e₁ = 0 := h.injective (he₁.trans (map_zero _).symm)
  have : (1 : ℚ) = 0 := congrArg (fun x => x.val.1) hz
  norm_num at this

end Tests

/-! ## Layer 2: Selmer structures and complexes -/

section SelmerKernel

variable {R : Type*} [CommRing R] {ι : Type*}

/-- §2.1: global and local modules with localisation maps and local conditions
(Mazur–Rubin, Definitions 1.1 and 2.1). -/
structure SelmerData (R : Type*) [CommRing R] (ι : Type*) where
  /-- The global cohomology module, e.g. `H¹(G_{K,Σ}, M)`. -/
  glob : Type*
  [instAdd : AddCommGroup glob]
  [instMod : Module R glob]
  /-- The local cohomology modules, e.g. `H¹(K_v, M)`. -/
  loc : ι → Type*
  [instAddLoc : ∀ v, AddCommGroup (loc v)]
  [instModLoc : ∀ v, Module R (loc v)]
  /-- The localisation maps. -/
  res : ∀ v, glob →ₗ[R] loc v
  /-- The local conditions. -/
  cond : ∀ v, Submodule R (loc v)

attribute [instance] SelmerData.instAdd SelmerData.instMod SelmerData.instAddLoc
  SelmerData.instModLoc

namespace SelmerData

variable (D : SelmerData R ι)

/-- §2.2: the Selmer module `{c | res_v c ∈ L_v for all v}`. -/
def selmer : Submodule R D.glob := ⨅ v, (D.cond v).comap (D.res v)

/-- §2.2: membership in the Selmer module. -/
theorem mem_selmer (c : D.glob) : c ∈ D.selmer ↔ ∀ v, D.res v c ∈ D.cond v := by
  simp [selmer, Submodule.mem_iInf]

/-- §2.2: the Selmer module is the kernel of the product of the maps to `H¹(K_v)/L_v`. -/
theorem selmer_eq_ker :
    D.selmer = LinearMap.ker (LinearMap.pi fun v => (D.cond v).mkQ ∘ₗ D.res v) := sorry

/-- §2.1: the Selmer data with the conditions replaced. -/
def withCond (L : ∀ v, Submodule R (D.loc v)) : SelmerData R ι :=
  { D with cond := L }

/-- §2.2: monotonicity in the local conditions. -/
theorem selmer_mono {L L' : ∀ v, Submodule R (D.loc v)} (h : ∀ v, L v ≤ L' v) :
    (D.withCond L).selmer ≤ (D.withCond L').selmer := sorry

/-- §2.1: the relaxed condition at a set `B` of places. -/
def relax (B : Set ι) [DecidablePred (· ∈ B)] : SelmerData R ι :=
  D.withCond fun v => if v ∈ B then ⊤ else D.cond v

/-- §2.1: the strict condition at a set `A` of places. -/
def strict (A : Set ι) [DecidablePred (· ∈ A)] : SelmerData R ι :=
  D.withCond fun v => if v ∈ A then ⊥ else D.cond v

/-- §2.1: strict ≤ given ≤ relaxed. -/
theorem selmer_strict_le_le_relax (S : Set ι) [DecidablePred (· ∈ S)] :
    (D.strict S).selmer ≤ D.selmer ∧ D.selmer ≤ (D.relax S).selmer := sorry

/-- §2.3: the local quotient map from the larger Selmer module to `∏ L'_v/L_v`. -/
def changeConditionMap {L L' : ∀ v, Submodule R (D.loc v)} (_h : ∀ v, L v ≤ L' v) :
    (D.withCond L').selmer →ₗ[R]
      (∀ v, (L' v) ⧸ (L v).comap (L' v).subtype) :=
  LinearMap.pi fun v => ((L v).comap (L' v).subtype).mkQ.comp
    (LinearMap.codRestrict (L' v) ((D.res v).domRestrict (D.withCond L').selmer)
      (fun c => ((D.withCond L').mem_selmer c.val).mp c.property v))

/-- §2.3: exactness at the larger Selmer module; no surjectivity onto the local quotient is
claimed. -/
theorem exact_change_of_conditions {L L' : ∀ v, Submodule R (D.loc v)}
    (h : ∀ v, L v ≤ L' v) :
    LinearMap.ker (D.changeConditionMap h) =
      ((D.withCond L).selmer).comap ((D.withCond L').selmer).subtype := sorry

/-- §2.4: a map of Selmer data (compatible global and local maps sending conditions into
conditions) maps Selmer modules into Selmer modules. -/
theorem map_selmer_le (D' : SelmerData R ι) (f : D.glob →ₗ[R] D'.glob)
    (fv : ∀ v, D.loc v →ₗ[R] D'.loc v) (hcomm : ∀ v c, fv v (D.res v c) = D'.res v (f c))
    (hcond : ∀ v, (D.cond v).map (fv v) ≤ D'.cond v) :
    D.selmer.map f ≤ D'.selmer := sorry

end SelmerData

/-- §2.5: forward propagation of a local condition along a coefficient map, by image
(quotients `T ↠ T/IT`, `V → W`). -/
def propagateImage {X Y : Type*} [AddCommGroup X] [Module R X] [AddCommGroup Y] [Module R Y]
    (g : X →ₗ[R] Y) (L : Submodule R X) : Submodule R Y := L.map g

/-- §2.5: backward propagation by inverse image (submodules `T[I] ↪ T`, `T → V`). -/
def propagatePreimage {X Y : Type*} [AddCommGroup X] [Module R X] [AddCommGroup Y] [Module R Y]
    (g : X →ₗ[R] Y) (L : Submodule R Y) : Submodule R X := L.comap g

/-- §2.5: the relaxed condition propagates forwards along a surjection to the relaxed one. -/
theorem propagateImage_top {X Y : Type*} [AddCommGroup X] [Module R X] [AddCommGroup Y]
    [Module R Y] (g : X →ₗ[R] Y) (hg : Function.Surjective g) :
    propagateImage g (⊤ : Submodule R X) = ⊤ := sorry

/-- §2.5: the strict condition propagates backwards to the kernel. -/
theorem propagatePreimage_bot {X Y : Type*} [AddCommGroup X] [Module R X] [AddCommGroup Y]
    [Module R Y] (g : X →ₗ[R] Y) :
    propagatePreimage g (⊥ : Submodule R Y) = LinearMap.ker g := sorry

/-- §2.5: image and preimage form a Galois connection. -/
theorem propagate_gc {X Y : Type*} [AddCommGroup X] [Module R X] [AddCommGroup Y] [Module R Y]
    (g : X →ₗ[R] Y) (L₀ : Submodule R X) (L : Submodule R Y) :
    propagateImage g L₀ ≤ L ↔ L₀ ≤ propagatePreimage g L := Submodule.map_le_iff_le_comap

/-- §2.6: the preimage of a fraction-field subspace under an `O`-linear map is saturated
for every nonzero element of the domain `O`. -/
theorem saturated_preimage {O E X Y : Type*} [CommRing O] [IsDomain O] [Field E]
    [Algebra O E] [IsFractionRing O E] [AddCommGroup X] [Module O X]
    [AddCommGroup Y] [Module O Y] [Module E Y] [IsScalarTower O E Y]
    (g : X →ₗ[O] Y) (LV : Submodule E Y) (n : O) (hn : n ≠ 0) (x : X)
    (hx : n • x ∈ propagatePreimage g (LV.restrictScalars O)) :
    x ∈ propagatePreimage g (LV.restrictScalars O) := sorry

end SelmerKernel

section Conditions

variable {R : Type*} [CommRing R] {H HI HQ : Type*} [AddCommGroup H] [Module R H]
  [AddCommGroup HI] [Module R HI] [AddCommGroup HQ] [Module R HQ]

/-- §2.7: `H¹_ur = ker(H¹(G, M) → H¹(I, M))` (Rubin Definition I.3.1). -/
def unramified (resI : H →ₗ[R] HI) : Submodule R H := LinearMap.ker resI

/-- §2.7: with injective inflation from the Frobenius coinvariants `B/(σ - 1)B` of the inertia
invariants (the procyclic calculation), the unramified condition is these coinvariants. -/
theorem unramified_equiv_coinvariants {B : Type*} [AddCommGroup B] [Module R B]
    (σ : B →ₗ[R] B) (inf : (B ⧸ LinearMap.range (σ - LinearMap.id)) →ₗ[R] H)
    (hinf : Function.Injective inf) (resI : H →ₗ[R] HI) (hexact : Function.Exact inf resI) :
    Nonempty (unramified resI ≃ₗ[R] B ⧸ LinearMap.range (σ - LinearMap.id)) := sorry

/-- §2.8: `ker(H¹(G, M) → H¹(I, M/F⁺M))` for a `G`-stable `F⁺M`; stability is required under the
decomposition group only. -/
def greenberg (resQ : H →ₗ[R] HQ) : Submodule R H := LinearMap.ker resQ

/-- §2.8: transport through the cohomology isomorphism induced by `M → M/0` identifies
the Greenberg condition for `F⁺M = 0` with the unramified condition. -/
theorem greenberg_zero (resI : H →ₗ[R] HI) (e : HI ≃ₗ[R] HQ) :
    greenberg (e.toLinearMap ∘ₗ resI) = unramified resI :=
  e.ker_comp resI

/-- §2.8: with `F⁺M = M` (so `H¹(I, M/F⁺M) = 0`) the Greenberg condition is relaxed. -/
theorem greenberg_top (resQ : H →ₗ[R] HQ) [Subsingleton HQ] : greenberg resQ = ⊤ := sorry

/-- §2.8: `H¹_ur ⊆ H¹_Gr` when `resQ` factors through `resI`. -/
theorem unramified_le_greenberg (resI : H →ₗ[R] HI) (resQ : H →ₗ[R] HQ) (π : HI →ₗ[R] HQ)
    (hπ : π ∘ₗ resI = resQ) : unramified resI ≤ greenberg resQ := sorry

end Conditions

section Ordinary

variable {E G V : Type*} [Field E] [Group G] [AddCommGroup V] [Module E V]
    [FiniteDimensional E V]

/-- §2.8a: a finite decreasing stable filtration whose inertia graded actions are the indexed
powers of the supplied cyclotomic character. -/
structure OrdinaryFiltration (ρ : Representation E G V) (I : Subgroup G) (χ : G →* Eˣ) where
  F : ℤ → Submodule E V
  antitone : Antitone F
  exhaustive : ∃ a, F a = ⊤
  separated : ∃ b, F b = ⊥
  stable : ∀ i g, (F i).map (ρ g) ≤ F i
  inertia : ∀ i (g : I) (x : F i),
    ρ (g : G) (x : V) - ((χ (g : G) ^ i : Eˣ) : E) • (x : V) ∈ F (i + 1)

/-- §2.8a: existence of an ordinary filtration on the given representation. -/
def IsOrdinary (ρ : Representation E G V) (I : Subgroup G) (χ : G →* Eˣ) : Prop :=
  Nonempty (OrdinaryFiltration ρ I χ)

/-- §2.8a: the positive ordinary subspace is the first filtration step. -/
def OrdinaryFiltration.plus {ρ : Representation E G V} {I : Subgroup G} {χ : G →* Eˣ}
    (D : OrdinaryFiltration ρ I χ) : Submodule E V := D.F 1

/-- §2.8a: the line of character `χ^n` has its filtration jump at `n`. -/
theorem ordinaryFiltration_character (ρ : Representation E G E) (I : Subgroup G) (χ : G →* Eˣ) (n : ℤ)
    (hρ : ∀ g x, ρ g x = ((χ g ^ n : Eˣ) : E) * x) :
    ∃ D : OrdinaryFiltration ρ I χ, ∀ i, D.F i = if i ≤ n then ⊤ else ⊥ := sorry

end Ordinary

/-! Pontryagin characters and coranks (§§2.10–2.11). -/

section Dual

/-- §2.10: the contragredient action `(g • f)(x) = f(g⁻¹ • x)`. -/
def contragredient {G M : Type*} [Group G] [TopologicalSpace M] [CommGroup M]
    [MulDistribMulAction G M] (hcont : ∀ g : G, Continuous fun x : M => g • x) (g : G)
    (f : PontryaginDual M) : PontryaginDual M :=
  ContinuousMonoidHom.comp f ⟨MulDistribMulAction.toMonoidHom M g⁻¹, hcont g⁻¹⟩

/-- §2.10: the contragredient action is a left action. -/
theorem contragredient_mul {G M : Type*} [Group G] [TopologicalSpace M] [CommGroup M]
    [MulDistribMulAction G M] (hcont : ∀ g : G, Continuous fun x : M => g • x) (g h : G)
    (f : PontryaginDual M) :
    contragredient hcont (g * h) f = contragredient hcont g (contragredient hcont h f) := sorry

/-- §2.11: the `ℤ_p`-corank `dim_{ℚ_p}(M^∨ ⊗ ℚ_p)` of a cofinitely generated discrete
`ℤ_p`-module, computed on its compact dual `N = M^∨`. -/
def corankFromDual (p : ℕ) [Fact p.Prime] (N : Type*) [AddCommGroup N] [Module ℤ_[p] N] : ℕ :=
  Module.finrank ℚ_[p] (ℚ_[p] ⊗[ℤ_[p]] N)

/-- §2.11: finite modules have corank zero. -/
theorem corankFromDual_finite (p : ℕ) [Fact p.Prime] (N : Type*) [AddCommGroup N]
    [Module ℤ_[p] N] [Finite N] : corankFromDual p N = 0 := sorry

/-- §2.11: additivity in short exact sequences of finitely generated modules. -/
theorem corankFromDual_add (p : ℕ) [Fact p.Prime] {N N' N'' : Type*} [AddCommGroup N]
    [Module ℤ_[p] N] [AddCommGroup N'] [Module ℤ_[p] N'] [AddCommGroup N''] [Module ℤ_[p] N'']
    [Module.Finite ℤ_[p] N'] (f : N →ₗ[ℤ_[p]] N') (g : N' →ₗ[ℤ_[p]] N'')
    (hf : Function.Injective f) (hg : Function.Surjective g) (hfg : Function.Exact f g) :
    corankFromDual p N' = corankFromDual p N + corankFromDual p N'' := sorry

/-- §2.11: the compact dual `ℤ_p^r` computes the corank `r` of `(ℚ_p/ℤ_p)^r`. -/
theorem corankFromDual_pi_padicInt (p : ℕ) [Fact p.Prime] (r : ℕ) :
    corankFromDual p (Fin r → ℤ_[p]) = r := sorry

end Dual

section DualStructure

variable {R : Type*} [CommRing R] {ι : Type*} {Y : Type*} [AddCommGroup Y] [Module R Y]

namespace SelmerData

/-- §2.13: the dual local conditions on `D'` (e.g. the data for `T^*`) under local pairings
`b v : H¹(K_v, T) × H¹(K_v, T^*) → Y`. -/
def dualCond (D D' : SelmerData R ι) (b : ∀ v, D.loc v →ₗ[R] D'.loc v →ₗ[R] Y) :
    ∀ v, Submodule R (D'.loc v) :=
  fun v => Submodule.orthogonalBilin (b v) (D.cond v)

/-- §2.13: the dual Selmer data: the global module and localisations of `D'` with the dual
conditions. -/
def dualOf (D D' : SelmerData R ι) (b : ∀ v, D.loc v →ₗ[R] D'.loc v →ₗ[R] Y) :
    SelmerData R ι :=
  D'.withCond (dualCond D D' b)

/-- §2.13: relaxing at `B` dualises to the strict condition at `B`, for perfect pairings into the
base ring. -/
theorem dualCond_relax (D D' : SelmerData R ι) (b : ∀ v, D.loc v →ₗ[R] D'.loc v →ₗ[R] R)
    (hb : ∀ v, (b v).IsPerfPair) (B : Set ι) [DecidablePred (· ∈ B)] (v : ι) (hv : v ∈ B) :
    dualCond (D.relax B) D' b v = ⊥ := sorry

/-- §2.13: dualising twice returns the conditions, for finite local modules. -/
theorem dualCond_dualCond {n : ℕ} [NeZero n] (D D' : SelmerData (ZMod n) ι)
    (b : ∀ v, D.loc v →ₗ[ZMod n] D'.loc v →ₗ[ZMod n] ZMod n)
    (hb : ∀ v, (b v).IsPerfPair) [∀ v, Finite (D.loc v)] [∀ v, Finite (D'.loc v)] (v : ι) :
    Submodule.orthogonalBilin (b v).flip (dualCond D D' b v) = D.cond v := sorry

end SelmerData

end DualStructure

namespace SelmerChecks

variable {R ι : Type*} [CommRing R]

/-- All relaxed conditions give the full global module. -/
example (D : SelmerData R ι) : (D.withCond fun _ => ⊤).selmer = ⊤ := by
  change (⨅ v, (⊤ : Submodule R (D.loc v)).comap (D.res v)) = ⊤
  simp only [Submodule.comap_top, iInf_top]

/-- All strict conditions give the intersection of localization kernels. -/
example (D : SelmerData R ι) :
    (D.withCond fun _ => ⊥).selmer = ⨅ v, LinearMap.ker (D.res v) := by
  change (⨅ v, (⊥ : Submodule R (D.loc v)).comap (D.res v)) = _
  simp only [Submodule.comap_bot]

end SelmerChecks

/-! ## Layer 2A: Arithmetic Selmer comparisons and deformation tangents -/

namespace Adjoint

variable (k : Type*) [Field k] (n : Type*) [Fintype n] [DecidableEq n]

/-- §2A.4: the determinant derivative is the trace, including rank zero:
`det(1 + εX) = 1 + ε tr X` over `k[ε]`. -/
theorem det_one_add_eps (X : Matrix n n k) :
    ((1 : Matrix n n (DualNumber k)) +
        (DualNumber.eps : DualNumber k) • X.map (algebraMap k (DualNumber k))).det =
      1 + DualNumber.eps * algebraMap k (DualNumber k) X.trace := by
  rw [Matrix.det_one_add_smul]
  simp [pow_two, DualNumber.eps_mul_eps, mul_comm, Matrix.trace]

end Adjoint

/-! ## Layer 3: Iwasawa cohomology, control and determinants

The Iwasawa cohomology and determinant targets are stated in the README. -/

/-! ## Layer 4: Finite conditions and arithmetic applications -/

section Archimedean

/-- §4.13: Tau Ceti's opposed Hodge structure together with a complex-linear real Betti involution
commuting with the coefficient conjugation and exchanging the Hodge pieces. -/
structure ArchimedeanRealization (W : Type*) [AddCommGroup W] [Module ℂ W]
    [FiniteDimensional ℂ W] (ω : TauCeti.Hodge.Conjugation W) (w : ℤ) where
  /-- The Hodge structure. -/
  hodge : TauCeti.Hodge.HodgeStructureOn W ω w
  /-- The Betti involution `F∞`. -/
  FInfty : W ≃ₗ[ℂ] W
  involutive : Function.Involutive FInfty
  commute : ∀ x, FInfty (ω.toEquiv x) = ω.toEquiv (FInfty x)
  exchange : ∀ a, (hodge.piece a).map FInfty.toLinearMap = hodge.piece (w - a)

variable {W : Type*} [AddCommGroup W] [Module ℂ W] [FiniteDimensional ℂ W]
  {ω : TauCeti.Hodge.Conjugation W} {w : ℤ}

/-- §4.13: the factorwise conjugation of a product, as required by Tau Ceti's
`TauCeti.Hodge.HodgeStructureOn.prod`. -/
def productConjugation {U : Type*} [AddCommGroup U] [Module ℂ U]
    (ω : TauCeti.Hodge.Conjugation W) (ω' : TauCeti.Hodge.Conjugation U) :
    TauCeti.Hodge.Conjugation (W × U) where
  toEquiv := {
    toFun := fun x => (ω.toEquiv x.1, ω'.toEquiv x.2)
    invFun := fun x => (ω.toEquiv.symm x.1, ω'.toEquiv.symm x.2)
    left_inv := by intro x; ext <;> simp
    right_inv := by intro x; ext <;> simp
    map_add' := by intro x y; ext <;> simp
    map_smul' := by
      intro r x
      exact Prod.ext (LinearMap.map_smulₛₗ ω.toEquiv.toLinearMap r x.1)
        (LinearMap.map_smulₛₗ ω'.toEquiv.toLinearMap r x.2) }
  involutive := by intro x; ext <;> simp

/-- §4.13: the direct sum carries Tau Ceti's product Hodge structure and the product of the two
Betti involutions. -/
theorem archRealization_sum {U : Type*} [AddCommGroup U] [Module ℂ U] [FiniteDimensional ℂ U]
    {ω' : TauCeti.Hodge.Conjugation U} (A : ArchimedeanRealization W ω w)
    (B : ArchimedeanRealization U ω' w) :
    ∃ C : ArchimedeanRealization (W × U) (productConjugation ω ω') w,
      C.hodge = A.hodge.prod B.hodge (fun _ => rfl) ∧
      C.FInfty = A.FInfty.prodCongr B.FInfty := sorry

/-- §4.13: the Tate dual uses Tau Ceti's Hodge dual and Tate twist and the negative transpose of
the Betti involution. -/
theorem archRealization_tateDual (A : ArchimedeanRealization W ω w) :
    ∃ D : ArchimedeanRealization (Module.Dual ℂ W) ω.dual (2 - w),
      HEq D.hodge (A.hodge.dual.tateTwist (-1)) ∧
      D.FInfty.toLinearMap = -A.FInfty.dualMap.toLinearMap := sorry

/-- §4.13: forget the Betti involution. -/
def archRealization_hodgeCarrier (A : ArchimedeanRealization W ω w) :
    TauCeti.Hodge.HodgeStructureOn W ω w :=
  A.hodge

/-- §4.13: multiplicity of the eigenvalue `(-1)^(a+ε)` on the diagonal Hodge piece. -/
def archRealization_diagonalMultiplicity (A : ArchimedeanRealization W ω w) (a : ℤ)
    (ε : Fin 2) : ℕ :=
  Module.finrank ℂ ((A.hodge.piece a ⊓ LinearMap.ker
    (A.FInfty.toLinearMap - ((-1 : ℂ) ^ (a + ε.val)) • LinearMap.id)) : Submodule ℂ W)

/-- §4.14: a real or complex Deligne Gamma factor with its integral shift. -/
inductive ShiftedGamma where
  | real (shift : ℤ)
  | complex (shift : ℤ)
  deriving DecidableEq

/-- §4.14: the real-place factors from paired off-diagonal pieces and the two diagonal Betti
eigenspaces. -/
def hodgeGammaFactors (A : ArchimedeanRealization W ω w) : List (ShiftedGamma × ℕ) := by
  classical
  exact A.hodge.finite_setOf_hodgeNumber_ne_zero.toFinset.toList.flatMap fun a =>
    if a < w - a then [(.complex (-a), A.hodge.hodgeNumber a)]
    else if 2 * a = w then
      [(.real (-a), archRealization_diagonalMultiplicity A a 0),
       (.real (1 - a), archRealization_diagonalMultiplicity A a 1)]
    else []

/-- §4.14: the complex-place factors, one per Hodge type with shift minus its smaller index. -/
def complexHodgeGammaFactors (H : TauCeti.Hodge.HodgeStructureOn W ω w) :
    List (ShiftedGamma × ℕ) := by
  classical
  exact H.finite_setOf_hodgeNumber_ne_zero.toFinset.toList.map fun a =>
    (.complex (-min a (w - a)), H.hodgeNumber a)

/-- §4.14: expand weighted integral shifts into separate complex-shift multisets,
retaining the `s + shift` sign. -/
def hodgeGammaShifts (factors : List (ShiftedGamma × ℕ)) : Multiset ℂ × Multiset ℂ :=
  factors.foldr (fun f shifts =>
    match f.1 with
    | .real a => (Multiset.replicate f.2 (a : ℂ) + shifts.1, shifts.2)
    | .complex a => (shifts.1, Multiset.replicate f.2 (a : ℂ) + shifts.2)) (0, 0)

/-- §4.14: the product of weighted real and complex Gamma factors with integral shifts. -/
def hodgeGammaFactor (factors : List (ShiftedGamma × ℕ)) (s : ℂ) : ℂ :=
  (factors.map fun f =>
    (match f.1 with
     | .real a => Complex.Gammaℝ (s + (a : ℂ))
     | .complex a => Complex.Gammaℂ (s + (a : ℂ))) ^ f.2).prod

/-- §4.14: the integer pole count for a weighted integral Hodge factor list. -/
def gammaPoleOrder (factors : List (ShiftedGamma × ℕ)) (m : ℤ) : ℕ :=
  (factors.map fun f =>
    match f.1 with
    | .real a => if m + a ≤ 0 ∧ (m + a) % 2 = 0 then f.2 else 0
    | .complex a => if m + a ≤ 0 then f.2 else 0).sum

/-- §4.14: concatenating weighted lists multiplies their Gamma products. -/
theorem gammaFactor_sum (f g : List (ShiftedGamma × ℕ)) (s : ℂ) :
    hodgeGammaFactor (f ++ g) s = hodgeGammaFactor f s * hodgeGammaFactor g s := sorry

/-- §4.14: concatenating weighted lists adds their integer pole counts. -/
theorem gammaPoleOrder_sum (f g : List (ShiftedGamma × ℕ)) (m : ℤ) :
    gammaPoleOrder (f ++ g) m = gammaPoleOrder f m + gammaPoleOrder g m := sorry

/-- §4.14: the real-place Hodge product has analytic order equal to the negative integer pole
count. -/
theorem gammaPoleOrder_hodge_analytic (A : ArchimedeanRealization W ω w) (m : ℤ) :
    meromorphicOrderAt (hodgeGammaFactor (hodgeGammaFactors A)) (m : ℂ) =
      (-(gammaPoleOrder (hodgeGammaFactors A) m : ℤ) : WithTop ℤ) := sorry

/-- §4.14: the complex-place Hodge product has analytic order equal to the negative integer
pole count. -/
theorem gammaPoleOrder_complexHodge_analytic
    (H : TauCeti.Hodge.HodgeStructureOn W ω w) (m : ℤ) :
    meromorphicOrderAt (hodgeGammaFactor (complexHodgeGammaFactors H)) (m : ℂ) =
      (-(gammaPoleOrder (complexHodgeGammaFactors H) m : ℤ) : WithTop ℤ) := sorry

/-- §4.13: Tau Ceti's lattice conjugation on the Tate line. -/
abbrev standardConjugation : TauCeti.Hodge.Conjugation ℂ :=
  TauCeti.Hodge.latticeConjugation TauCeti.Hodge.isBaseChange_tateLatticeMap

/-- §4.13: RJW's L-function convention uses Tau Ceti's Hodge Tate object with index `-n`; only
the weight transport is new. -/
def tateHodge (n : ℤ) : TauCeti.Hodge.HodgeStructureOn ℂ standardConjugation (2 * n) := by
  have h : -2 * (-n) = 2 * n := by ring
  exact h ▸ (TauCeti.Hodge.tate (-n))

/-- §4.13: the transported Tate object has its sole Hodge type `(n, n)`. -/
theorem tateHodge_number (n a : ℤ) :
    (tateHodge n).hodgeNumber a = if a = n then 1 else 0 := sorry

/-- §4.13: complex-linear multiplication by `(-1)^n` is the real Betti involution of the Tate
line. -/
def tateArchimedean (n : ℤ) : ArchimedeanRealization ℂ standardConjugation (2 * n) where
  hodge := tateHodge n
  FInfty := LinearEquiv.ofInvolutive
    (((-1 : ℂ) ^ n) • (LinearMap.id : ℂ →ₗ[ℂ] ℂ)) (by
      intro x
      simp [neg_one_zpow_eq_ite]
      split <;> simp)
  involutive := by
    intro x
    change (-1 : ℂ) ^ n • ((-1 : ℂ) ^ n • x) = x
    simp [neg_one_zpow_eq_ite]
    split <;> simp
  commute := by
    intro x
    change (-1 : ℂ) ^ n • standardConjugation.toEquiv x =
      standardConjugation.toEquiv ((-1 : ℂ) ^ n • x)
    by_cases h : Even n <;> simp [neg_one_zpow_eq_ite, h]
  exchange := by
    intro a
    change ((tateHodge n).piece a).map
      (((-1 : ℂ) ^ n) • (LinearMap.id : ℂ →ₗ[ℂ] ℂ)) = (tateHodge n).piece (2 * n - a)
    rw [Submodule.map_smul _ _ _ (zpow_ne_zero n (by norm_num)), Submodule.map_id]
    by_cases h : a = n
    · subst a
      congr 1
      omega
    · have h' : 2 * n - a ≠ n := by omega
      have ha : (tateHodge n).piece a = ⊥ := Submodule.finrank_eq_zero.mp (by
        simpa [TauCeti.Hodge.HodgeStructureOn.hodgeNumber_def, h] using tateHodge_number n a)
      have hb : (tateHodge n).piece (2 * n - a) = ⊥ := Submodule.finrank_eq_zero.mp (by
        simpa [TauCeti.Hodge.HodgeStructureOn.hodgeNumber_def, h'] using
          tateHodge_number n (2 * n - a))
      rw [ha, hb]

/-- §4.14: the real-place Hodge product of the Tate line is `Γℝ(s - n)`. -/
theorem gamma_tate_factor (n : ℤ) (s : ℂ) :
    hodgeGammaFactor (hodgeGammaFactors (tateArchimedean n)) s = Complex.Gammaℝ (s - n) := sorry

/-- §4.15: the pole count at one for the real-place Hodge realization. -/
def poleOrderAtOne (A : ArchimedeanRealization W ω w) : ℕ :=
  gammaPoleOrder (hodgeGammaFactors A) 1

/-- §4.14: the Tate-dual factors computed from the primal Hodge pieces and signs: an off-diagonal
`(a, b)` with `a < b` dualizes to `(1 - b, 1 - a)`, and a diagonal sign `ε` stays `ε`. -/
def tateDualHodgeGammaFactors (A : ArchimedeanRealization W ω w) :
    List (ShiftedGamma × ℕ) := by
  classical
  exact A.hodge.finite_setOf_hodgeNumber_ne_zero.toFinset.toList.flatMap fun a =>
    if a < w - a then [(.complex (w - a - 1), A.hodge.hodgeNumber a)]
    else if 2 * a = w then
      [(.real (a - 1), archRealization_diagonalMultiplicity A a 0),
       (.real a, archRealization_diagonalMultiplicity A a 1)]
    else []

/-- §4.14: the computed dual factors agree, up to order, with the actual Tate-dual realization. -/
theorem tateDualHodgeGammaFactors_eq (A : ArchimedeanRealization W ω w)
    (D : ArchimedeanRealization (Module.Dual ℂ W) ω.dual (2 - w))
    (hH : HEq D.hodge (A.hodge.dual.tateTwist (-1)))
    (hF : D.FInfty.toLinearMap = -A.FInfty.dualMap.toLinearMap) :
    (hodgeGammaFactors D).Perm (tateDualHodgeGammaFactors A) := sorry

/-- §4.15: Greenberg criticality: no pole at `s = 1` for the realization and its Tate dual. -/
def IsGreenbergCritical (A : ArchimedeanRealization W ω w) : Prop :=
  poleOrderAtOne A = 0 ∧ gammaPoleOrder (tateDualHodgeGammaFactors A) 1 = 0

/-- §4.15: the Gamma factor computed from the explicit Hodge and Betti realization. -/
def gammaFactor (A : ArchimedeanRealization W ω w) (s : ℂ) : ℂ :=
  hodgeGammaFactor (hodgeGammaFactors A) s

/-- §4.15: the Tate line has a pole at one exactly for positive odd twists. -/
theorem poleOrderAtOne_tateTwist (n : ℤ) :
    poleOrderAtOne (tateArchimedean n) = if n % 2 = 1 ∧ 1 ≤ n then 1 else 0 := sorry

/-- §4.15: Tate criticality is positive even or negative odd, excluding the trivial twist. -/
theorem isGreenbergCritical_tateTwist_iff (n : ℤ) :
    IsGreenbergCritical (tateArchimedean n) ↔
      ((n % 2 = 0 ∧ 2 ≤ n) ∨ (n % 2 = 1 ∧ n ≤ -1)) := sorry

/-- §4.13: negate the Betti involution on the same Hodge filtration. -/
def oppositeRealSign (A : ArchimedeanRealization W ω w) :
    ArchimedeanRealization W ω w where
  hodge := A.hodge
  FInfty := LinearEquiv.ofInvolutive (-A.FInfty.toLinearMap) (by
    intro x
    simp only [LinearMap.neg_apply, LinearEquiv.coe_coe, map_neg, neg_neg]
    exact A.involutive x)
  involutive := by
    intro x
    change -A.FInfty (-A.FInfty x) = x
    simp only [map_neg, neg_neg]
    exact A.involutive x
  commute := by
    intro x
    change -A.FInfty (ω.toEquiv x) = ω.toEquiv (-A.FInfty x)
    rw [map_neg, A.commute]
  exchange := by
    intro a
    change (A.hodge.piece a).map (-A.FInfty.toLinearMap) = _
    rw [Submodule.map_neg, A.exchange]

end Archimedean

section IwasawaCorank

variable (Λ Q : Type*) [CommRing Λ] [IsDomain Λ] [Field Q] [Algebra Λ Q]
    [IsFractionRing Λ Q]

/-- §4.21: the Iwasawa corank of a discrete module on one domain component, computed from its
finitely generated compact dual `N` by extension to that component's fraction field. -/
def iwasawaCorankFromComponentDual (N : Type*) [AddCommGroup N] [Module Λ N]
    [Module.Finite Λ N] : ℕ :=
  Module.finrank Q (Q ⊗[Λ] N)

/-- §4.21: the compact dual equal to its Iwasawa component has corank one. -/
theorem iwasawaCorankFromComponentDual_self :
    iwasawaCorankFromComponentDual Λ Q Λ = 1 := sorry

/-- §4.21: a finitely generated torsion compact dual has Iwasawa corank zero on its component. -/
theorem iwasawaCorankFromComponentDual_torsion (N : Type*) [AddCommGroup N] [Module Λ N]
    [Module.Finite Λ N] (hN : ∀ x : N, ∃ a : Λ, a ≠ 0 ∧ a • x = 0) :
    iwasawaCorankFromComponentDual Λ Q N = 0 := sorry

end IwasawaCorank

section CongruentNumber

variable (p : ℕ) [Fact p.Prime]

/-- §4.29: the image of `E′_n(ℚ_p)` under the coboundary of the 2-isogeny
`E_n : y² = x³ - n²x → E′_n : Y² = X³ + 4n²X` in `ℚ_p^×/ℚ_p^{×2}`: `(X, Y) ↦ X` for `X ≠ 0`, and
the classes of `O` and `(0, 0)` (which is `4n² ≡ 1`). -/
def congruentLocalKummerImage (n : ℤ) :
    Set (ℚ_[p]ˣ ⧸ (powMonoidHom 2 : ℚ_[p]ˣ →* ℚ_[p]ˣ).range) :=
  {1} ∪ {c | ∃ (X : ℚ_[p]ˣ) (Y : ℚ_[p]), Y ^ 2 = (X : ℚ_[p]) ^ 3 + 4 * (n : ℚ_[p]) ^ 2 * X ∧
    c = QuotientGroup.mk X}

/-- §4.29: at an odd prime of good reduction the image has order `2 = #ker φ`. -/
theorem congruentLocalKummerImage_ncard_of_not_dvd (hp : p ≠ 2) (n : ℤ) (hn : Squarefree n)
    (hpn : ¬ (p : ℤ) ∣ n) :
    (congruentLocalKummerImage p n).ncard = 2 := sorry

/-- §4.29: at an odd prime dividing `n` the image has order `2` or `1` as `p ≡ 1` or `3 (mod 4)`,
so the local sign is the Legendre symbol `(-1/p)`. -/
theorem congruentLocalKummerImage_ncard_of_dvd (hp : p ≠ 2) (n : ℤ) (hn : Squarefree n)
    (hpn : (p : ℤ) ∣ n) :
    (congruentLocalKummerImage p n).ncard = if p % 4 = 1 then 2 else 1 := sorry

/-- §4.29: at `2` the image has order `4`, `2` or `1` as `n ≡ ±1`, `n ≡ ±3 (mod 8)` or `n` even. -/
theorem congruentLocalKummerImage_two_ncard (n : ℤ) (hn : Squarefree n) :
    (congruentLocalKummerImage 2 n).ncard =
      if 2 ∣ n then 1 else if n % 8 = 1 ∨ n % 8 = 7 then 4 else 2 := sorry

end CongruentNumber

end TauCetiRoadmap.SelmerIwasawaCohomology

/-
Targets stated in `README.md` only, because their carriers are not at the pins: the limit Kummer
map `kummerLimit` and its API (§0.6); Galois Selmer groups on continuous cochains, `corank` on a
discrete p-primary module, `SelmerStructure` and its dual (§§2.9–2.13);
`selmerComplex` (parametric in the supplied local complexes),
`selmerComplexOrd`, `selmerComplexMod`, `selmerComplex_globalTriangle`,
`selmerComplex_compactTriangle` (the strict fibre for the same diagram, arithmetic compact
support for the modified instance), `selmerComplex_map`, `selmerComplex_quasiIso`,
`selmerArchimedeanCone` and `selmerComplex_archimedeanTriangle` (§2.21). The latter compares the
ordinary fibre with its modified fibre using the same condition complexes and maps composed
with the local comparison. Its third vertex is the sum of the archimedean cones shifted by −1;
for a module it has H⁰ equal to the archimedean coinvariants and no positive cohomology, but at
dyadic real places it can have lower negative Tate cohomology. Section 2.22 uses the local H⁰
groups of the specified diagram: ordinary invariants, or modified real Tate groups and zero
complex-place groups. For trivial `𝔽_p` over `ℚ`, `S = {p, ∞}` and odd p, the strict ordinary
H⁰ map has cokernel `𝔽_p`, while the modified map has zero cokernel;
the arithmetic compact-support identification with the supplied Tate-modified `Ĉ_c` and
Selmer H¹ correction (§2A.1); for trivial `𝔽₂` over `ℚ` with `S = {2, ∞}`, this fibre has
`H^i = 𝔽₂` for every `i < 0`, while the finite-place compact fibre has no negative cohomology;
function-field Greenberg–Wiles (§2A.2), Selmer and deformation tangent comparison (§2A.3),
the positive-rank cohomological determinant fibres and their ordinary/modified trace sequences
(§2A.4, `n ≥ 1`); the determinant derivative above also holds for an empty matrix index type,
and derived coefficient change with its Tor spectral sequence (§2A.5);
`ellipticSelmerInfinity` (§2.12); the abelian adapters `AbelianVariety.Points`,
`AbelianVariety.torsion`, `abelianKummer`, `kummerSelmerStructure`, `abelianSelmerGroup`,
`abelianSha` (the specialization of Mathlib's `ContinuousCohomology.tateShafarevich`),
`abelian_localH1_comparison`, `abelianDescent_exact`, `abelianSelmerGroup_finite`,
`finiteCotype_primaryDecomposition`, `KummerLocal`, `KummerLocal.dual_annihilator` and
`KummerLocal.globalPlusLocal` (§2.12a), for arbitrary number-field abelian varieties and
isogenies, including the conjugation adapter for complex lattice uniformization, its
compatibility with lattice torsion and Poincaré duality, and all real two-primary Kummer
conditions; Iwasawa algebra coordinates and character twists for `ℤ_p^d × Δ` (§3.0);
`iwasawaComplex`, `iwasawaCohomology`,
`iwasawaSelmerComplex`, `discreteInfiniteSelmerComplex`, `localSpecializationError`,
`selmerDeterminant` (§§3.1–3.14, with Iwasawa fibres for the chosen diagram and arithmetic
duality on the modified instance). Finite errors disappear at height one for `d ≥ 1`; for
`d = 0`, the finite module `O/λ` survives at `(λ)` and contributes characteristic factor `(λ)`;
the étale comparison `restrictedRamification_finiteEtale_equiv`,
`etaleCohomology_Gm_restrictedRamification`, `etaleGalois_comparison_restrictedRamification`,
`etaleGalois_comparison_lattice` (including the finite-S ordinary-limit simplification),
`etale_jStar_stalk`, `etale_jStar_degreeOne` (injection with image unramified at every removed
place), `etale_jStar_iwasawa` (infinite decomposition groups at every removed place, §3.15);
`semilocalCoind_restriction` (§3.6); `GreenbergStructureHypotheses` (§3.18);
the small-weight crystalline realization and extension exactness (§4.7), using the reindexed
aliases `localIsTorsionCrystalline` and `localIsIntegralCrystalline` (§§4.7–4.11);
`crystallineNonsingular` (§4.8); the finite crystalline exact O-linear annihilators (§4.11),
including ramified coefficient fields, with the inverse-different generator used only for the
normalized-trace comparison in the proof; `blochKatoCondition`, `blochKatoCondition_T`,
`blochKatoStructure` (§4.9); `pRamifiedModule`, `unramifiedModule`, `closedGlobalUnitTower`,
`arithmeticPlusMinus` (§4.16); `PadicLFunctionDatum` and the main-conjecture propositions
(§§4.21–4.23), with `iwasawaCorank` the tuple of the component coranks above;
the record comparison `hodgeGammaFactor_eq_gammaFactor` with
LFunctions Layer 0's `AnalyticLFunctionData.gammaFactor` (§4.14), under equality of the record's
real and complex shift multisets with `hodgeGammaShifts` of the supplied integral factor list;
`localAnnihilation_uniform` (§4.25); `elliptic_dDeRham_tangent`, `elliptic_exponential_kummer`,
`elliptic_local_comparison_descent` (§4.26); the parity theorems
`selmerComplex_skewPairing` (the untwisted degree-three O-module adjoint for the modified fibre),
`skewSymmetric_filtration_parity` (O-bilinear, with 2 invertible), `selmerParity_perfectComplex`,
`selmerFamily_baseChange` (the common modified arithmetic diagram with strict ordinary
conditions at p, unramified conditions at other finite places, zero archimedean conditions and
its localized coefficient contract), `selmerParity_family`, `selmerParity_quadraticTwist` (exponent two),
`selmerParity_oddAbelian` (odd degree, with `H⁰(E′, V) = 0`),
`ordinaryModular_selmerParity_family` (§4.28) and
the general abelian pairing `CasselsTate : Ш(A/K) × Ш(A∨/K) → ℚ/ℤ`, with
`CasselsTate.finiteCoefficient_formula` (global-minus-local cocycles with the G_m correction),
`CasselsTate.isogeny_adjoint`, `CasselsTate.annihilator_nTorsion`, `CasselsTate.left_radical`,
`CasselsTate.right_radical`, `CasselsTate.reduced_primary_perfect`; the carrier comparison
`ellipticSha_equiv_abelianSha`, the positive-(O)-polarization comparison
`casselsTate_pairing_eq_abelian`, and `casselsTate_pairing` (the alternating elliptic pullback
with divisible radicals and square-order reduced primary groups), `selmerParity_twoIsogeny`,
`congruentNumber_selmerParity` (§4.29). General abelian pairings carry no unconditional
alternation assertion.
-/
