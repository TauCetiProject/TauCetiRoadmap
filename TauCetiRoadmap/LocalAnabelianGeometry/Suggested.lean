import Mathlib
import TauCeti.FieldTheory.Galois.AbsoluteGaloisGroup.Cyclotomic.Character
import TauCeti.NumberTheory.ClassFieldTheory.Local.ArtinMap
import TauCeti.NumberTheory.LocalField.DeepUnits.Basic
import TauCeti.NumberTheory.LocalField.Unramified.Inertia.Basic
import TauCeti.NumberTheory.LocalField.WildInertia
import TauCeti.Topology.Algebra.Group.Transfer

/-!
# Anabelian geometry of `p`-adic local fields: suggested signatures

These signatures are suggested forms, not an exhaustive checklist. `README.md` is the definitive
specification.

The file states what can be stated against the pinned Mathlib and Tau Ceti: the tools of Layer 0
(the continuous transfer, its reciprocity form, the logarithm on principal units, and the
spanning lemma), the unfiltered recovery of the numerical invariants (Layer 1), of the
cyclotomic character (Layer 2) and of inertia (Layer 3) in their `G_K` forms, and uniformizing
characters (Layer 7.1–7.2).

The solvable quotients `G_K^m`, filtrations, filtered isomorphisms and `Out_Filt` are those of the
filtered local Galois groups roadmap (TauCetiProject/TauCetiRoadmap#1795), and `ℂ_p` with its
Galois action and Hodge–Tate weights are those of TauCetiProject/TauCetiRoadmap#940 and
TauCetiProject/TauCetiRoadmap#879; none has a declaration at the pins. The `m`-step forms of
Layers 2–4, and Layers 5, 6, 7.3–7.4 and 8, are stated in `README.md` only.

Suggested home: `TauCeti/NumberTheory/LocalField/Anabelian/`.
-/

open ValuativeRel IsNonarchimedeanLocalField NormedSpace TauCeti TauCeti.ClassFieldTheory

namespace TauCetiRoadmap.LocalAnabelianGeometry

/-! ## Layer 0.2: the continuous transfer -/

section Transfer

variable {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
  (H : Subgroup G) [H.FiniteIndex]

/-- The **continuous transfer** `Ver : G^ab → H^ab` of an open subgroup: Mathlib's
`MonoidHom.transfer` of `H → H^ab`, continuous by `TauCeti.continuous_transfer`, descended to the
topological abelianization of `G`. -/
noncomputable def topologicalTransfer (hH : IsOpen (H : Set G)) :
    TopologicalAbelianization G →* TopologicalAbelianization H :=
  sorry

theorem topologicalTransfer_mk (hH : IsOpen (H : Set G)) (g : G) :
    topologicalTransfer H hH (g : TopologicalAbelianization G) =
      MonoidHom.transfer (QuotientGroup.mk' _ : H →* TopologicalAbelianization H) g :=
  sorry

theorem continuous_topologicalTransfer (hH : IsOpen (H : Set G)) :
    Continuous (topologicalTransfer H hH) :=
  sorry

end Transfer

/-! ## Layer 0.3: reciprocity and the transfer -/

section ArtinTransfer

variable (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  (L : Type) [Field L] [Algebra K L] [FiniteDimensional K L] [ValuativeRel L] [TopologicalSpace L]
  [IsNonarchimedeanLocalField L] [ValuativeExtension K L]

/-- The transfer `G_K^ab → G_L^ab`: `topologicalTransfer` of the open subgroup
`(absoluteGaloisGroupExtend K L iota).range`, read in `G_L^ab` through
`absoluteGaloisGroupExtend K L iota`, which is injective with that range. -/
noncomputable def absoluteTransfer (iota : L →ₐ[K] SeparableClosure K) :
    Field.absoluteGaloisGroupAbelianization K →* Field.absoluteGaloisGroupAbelianization L :=
  sorry

/-- **Reciprocity and the transfer**: `Ver(Art_K(x)) = Art_L(x)`, the absolute form of
`ClassFormation.artinMap_groundInclusion`. -/
theorem absoluteTransfer_artinMap (iota : L →ₐ[K] SeparableClosure K) (x : Kˣ) :
    absoluteTransfer K L iota (artinMap K x) =
      artinMap L (Units.map (algebraMap K L).toMonoidHom x) :=
  sorry

end ArtinTransfer

/-! ## Layers 0.5–0.6: the logarithm and the spanning lemma -/

section Units

variable {p : ℕ} [Fact p.Prime] {K : Type*} [Field K] [ValuativeRel K] [TopologicalSpace K]
  [IsNonarchimedeanLocalField K] [FinitePadicExtension K p]

/-- **The logarithm is a homomorphism on `U(K,1)`**, reduced to the deep case
`log_mul_of_mem_unitFiltration` by a `p`-power. -/
theorem log_mul_of_mem_unitFiltration_one {u w : Kˣ} (hu : u ∈ unitFiltration K 1)
    (hw : w ∈ unitFiltration K 1) :
    log ((u : K) * w) = log (u : K) + log (w : K) :=
  sorry

/-- The kernel of the logarithm on `U(K,1)` is the group of `p`-power roots of unity. -/
theorem log_eq_zero_iff {u : Kˣ} (hu : u ∈ unitFiltration K 1) :
    log (u : K) = 0 ↔ ∃ n : ℕ, u ^ p ^ n = 1 :=
  sorry

/-- **An open subgroup of units spans** [Mochizuki 1997, Lem. 4.1]. -/
theorem span_units_eq_top (I : Subgroup 𝒪[K]ˣ) (hI : IsOpen (I : Set 𝒪[K]ˣ)) :
    Submodule.span ℚ_[p] ((fun u : 𝒪[K]ˣ => ((u : 𝒪[K]) : K)) '' I) = ⊤ :=
  sorry

/-- Two `ℚ_p`-algebra homomorphisms agreeing on an open subgroup of units are equal. -/
theorem algHom_ext_of_eqOn_units {Ω : Type*} [Field Ω] [Algebra ℚ_[p] Ω]
    (I : Subgroup 𝒪[K]ˣ) (hI : IsOpen (I : Set 𝒪[K]ˣ)) (f g : K →ₐ[ℚ_[p]] Ω)
    (hfg : ∀ u ∈ I, f ((u : 𝒪[K]) : K) = g ((u : 𝒪[K]) : K)) : f = g :=
  sorry

/-- **Ring homomorphisms between finite extensions of `ℚ_p` are `ℚ_p`-linear.** -/
theorem algebraMap_comp_ringHom {K' : Type*} [Field K'] [ValuativeRel K'] [TopologicalSpace K']
    [IsNonarchimedeanLocalField K'] [FinitePadicExtension K' p] (f : K →+* K') :
    f.comp (algebraMap ℚ_[p] K) = algebraMap ℚ_[p] K' :=
  sorry

end Units

/-! ## Layers 1–3: unfiltered recovery -/

section Recovery

variable {p p' : ℕ} [Fact p.Prime] [Fact p'.Prime]
  {K : Type} [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  [FinitePadicExtension K p]
  {K' : Type} [Field K'] [ValuativeRel K'] [TopologicalSpace K'] [IsNonarchimedeanLocalField K']
  [FinitePadicExtension K' p']

/-- **The numerical invariants from `G^ab`** [Hyeon 2025, Prop. 3.1]: the residue characteristic,
the degree, the residue field size and the absolute ramification index. -/
theorem eq_of_continuousMulEquiv_abelianization
    (α : Field.absoluteGaloisGroupAbelianization K ≃ₜ* Field.absoluteGaloisGroupAbelianization K') :
    p = p' ∧ Module.finrank ℚ_[p] K = Module.finrank ℚ_[p'] K' ∧
      Nat.card 𝓀[K] = Nat.card 𝓀[K'] ∧
      absoluteRamificationIndex K p = absoluteRamificationIndex K' p' :=
  sorry

/-- **Inertia is recovered from `G_K`** [Mochizuki 1997, Cor. 1.3], through the `m`-step form
[Hyeon 2025, Lem. 4.1]. -/
theorem map_inertiaSubgroup (α : Field.absoluteGaloisGroup K ≃ₜ* Field.absoluteGaloisGroup K') :
    (inertiaSubgroup K).map α.toMulEquiv.toMonoidHom = inertiaSubgroup K' :=
  sorry

theorem map_wildInertiaSubgroup
    (α : Field.absoluteGaloisGroup K ≃ₜ* Field.absoluteGaloisGroup K') :
    (wildInertiaSubgroup K).map α.toMulEquiv.toMonoidHom = wildInertiaSubgroup K' :=
  sorry

end Recovery

section Cyclotomic

variable {p : ℕ} [Fact p.Prime]
  {K : Type} [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  [FinitePadicExtension K p]
  {K' : Type} [Field K'] [ValuativeRel K'] [TopologicalSpace K'] [IsNonarchimedeanLocalField K']
  [FinitePadicExtension K' p]

/-- **The cyclotomic character is recovered from `G_K`** [Mochizuki 1997, Prop. 1.1], through
`G_K^2` [Hyeon 2025, Prop. 3.2]. The common prime is forced by
`eq_of_continuousMulEquiv_abelianization`. -/
theorem localCyclotomicCharacter_comp_continuousMulEquiv
    (α : Field.absoluteGaloisGroup K ≃ₜ* Field.absoluteGaloisGroup K') :
    (localCyclotomicCharacter p K').comp α.toMulEquiv.toMonoidHom = localCyclotomicCharacter p K :=
  sorry

end Cyclotomic

/-! ## Layer 7: uniformizing characters -/

section Uniformizing

variable (p : ℕ) [Fact p.Prime]
  (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  [FinitePadicExtension K p]
  (E : Type) [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
  [FinitePadicExtension E p]

/-- A character `ρ : G_K^ab → Eˣ` is **uniformizing** [Hyeon 2025, §5; Mochizuki 1997, Def. 3.2]
if on an open subgroup of units it is a field embedding read through the Artin map. -/
def IsUniformizing (ρ : Field.absoluteGaloisGroupAbelianization K →* Eˣ) : Prop :=
  ∃ I : Subgroup 𝒪[K]ˣ, IsOpen (I : Set 𝒪[K]ˣ) ∧ ∃ ι : K →ₐ[ℚ_[p]] E, ∀ u ∈ I,
    (ρ (artinMap K (Units.map (algebraMap 𝒪[K] K).toMonoidHom u)) : E) = ι ((u : 𝒪[K]) : K)

/-- **Existence** [Hyeon 2025, Ex. 5.4]: for `K ⊆ E`, the transfer to `G_E^ab`, the projection to
the image of inertia, and `Art_E⁻¹` give a continuous character equal to the inclusion on all of
`𝒪_K^×`. -/
theorem exists_isUniformizing [Algebra K E] [IsScalarTower ℚ_[p] K E] :
    ∃ ρ : Field.absoluteGaloisGroupAbelianization K →* Eˣ, Continuous ρ ∧
      IsUniformizing p K E ρ ∧ ∀ u : 𝒪[K]ˣ,
        (ρ (artinMap K (Units.map (algebraMap 𝒪[K] K).toMonoidHom u)) : E) =
          algebraMap K E ((u : 𝒪[K]) : K) :=
  sorry

end Uniformizing

end TauCetiRoadmap.LocalAnabelianGeometry
