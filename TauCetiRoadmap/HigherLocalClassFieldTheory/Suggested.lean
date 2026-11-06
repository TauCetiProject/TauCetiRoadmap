import Mathlib
import TauCeti.NumberTheory.ClassFieldTheory.Local.ArtinMap

/-!
# Higher local class field theory: suggested signatures

These signatures are suggested forms, not an exhaustive checklist. `README.md` is the definitive
specification.

The file pins the carriers: `IsHigherLocalField n F`, the standard fields `LaurentField K` (a type
synonym of `K⸨X⸩` with no topology instance), the higher topology `higherTopology` on `F`
and `unitsTopology` on `Fˣ`, the topological Milnor K-group `TopologicalMilnorK F n` as the
quotient of `K_n(F)` by `⋂_{l ≥ 1} l K_n(F)`, Fesenko's sequential topology `lambdaTopology` and
the comparison `sequentialKernel_eq`, the degree map `degreeMap`, norm subgroups `normSubgroup`,
and the reciprocity map `reciprocityMap` under the class field hypothesis `char 𝓀[F] = p`, with
its finite-level, existence, separation, injectivity and dimension-one statements.

Milnor K-theory is TauCetiProject/TauCetiRoadmap#1302 §5.4 and Kato's norm is its §10.24. Neither
has a declaration at the pins, so the section `MilnorKStandIn` restates the §5.4 carrier as that
roadmap's `Suggested.lean` writes it, and the norm as a `sorry`. Replace both by the Tau Ceti
declarations once they exist.

Suggested home: `TauCeti/NumberTheory/HigherLocalField/`.
-/

open ValuativeRel
open scoped WithZero

namespace TauCetiRoadmap.HigherLocalClassFieldTheory

/-! ## Stand-in for TauCetiProject/TauCetiRoadmap#1302 §5.4 and §10.24 -/

section MilnorKStandIn

variable (F : Type) [Field F]

/-- The relation generating the Steinberg ideal of the tensor algebra (#1302 §5.4). -/
def milnorRel : TensorAlgebra ℤ (Additive Fˣ) → TensorAlgebra ℤ (Additive Fˣ) → Prop :=
  fun x y => ∃ a b : Fˣ, (a : F) + b = 1 ∧
    x = TensorAlgebra.ι ℤ (Additive.ofMul a) * TensorAlgebra.ι ℤ (Additive.ofMul b) ∧ y = 0

/-- Milnor K-theory `K_*(F)` (#1302 §5.4). -/
abbrev MilnorK : Type := RingQuot (milnorRel F)

variable {F}

/-- The degree-one class of a unit (#1302 §5.4). -/
def MilnorK.ofUnit (a : Fˣ) : MilnorK F :=
  RingQuot.mkRingHom (milnorRel F) (TensorAlgebra.ι ℤ (Additive.ofMul a))

/-- The symbol `{a₁, …, aₙ}` (#1302 §5.4). -/
def MilnorK.symbol (l : List Fˣ) : MilnorK F :=
  (l.map MilnorK.ofUnit).prod

variable (F)

/-- The degree-`n` part `K_n(F)` (#1302 §5.4). -/
def MilnorK.degree (n : ℕ) : Submodule ℤ (MilnorK F) :=
  Submodule.map (RingQuot.mkRingHom (milnorRel F)).toIntAlgHom.toLinearMap
    ((TensorAlgebra.ι ℤ : Additive Fˣ →ₗ[ℤ] TensorAlgebra ℤ (Additive Fˣ)).range ^ n)

variable {F}

theorem MilnorK.symbol_mem_degree {n : ℕ} (a : Fin n → Fˣ) :
    MilnorK.symbol (List.ofFn a) ∈ MilnorK.degree F n :=
  sorry

/-- The symbol `{a₁, …, aₙ}` as an element of `K_n(F)`. -/
def MilnorK.symbolDeg {n : ℕ} (a : Fin n → Fˣ) : MilnorK.degree F n :=
  ⟨MilnorK.symbol (List.ofFn a), MilnorK.symbol_mem_degree a⟩

variable (F)

/-- Kato's norm `N_{L/F} : K_n(L) → K_n(F)` for a finite extension (#1302 §10.24). -/
noncomputable def milnorNorm (L : Type) [Field L] [Algebra F L] [FiniteDimensional F L] (n : ℕ) :
    MilnorK.degree L n →ₗ[ℤ] MilnorK.degree F n :=
  sorry

end MilnorKStandIn

/-! ## Layer 0: higher local fields -/

section Layer0

/-- `F` is an **`n`-dimensional local field** for its valuative relation. Dimension `0` is a finite
field. In dimension `n + 1` the valuation is discrete and nontrivial of rank one, `F` is complete
for its valuation uniformity, and the residue field `𝓀[F]` is an `n`-dimensional local field for
some valuative relation, which is unique (`existsUnique_residue_valuativeRel`). The valuation
uniformity is not an instance on `F`: in dimension at least two the topology of `F` is
`higherTopology`, not the valuation topology. -/
def IsHigherLocalField : ℕ → (F : Type) → [Field F] → [ValuativeRel F] → Prop
  | 0, F, _, _ => Finite F
  | n + 1, F, _, _ =>
      IsDiscrete F ∧ IsNontrivial F ∧ IsRankLeOne F ∧
        @CompleteSpace F (Valued.mk' (valuation F)).toUniformSpace ∧
        ∃ _ : ValuativeRel 𝓀[F], IsHigherLocalField n 𝓀[F]

variable {F : Type} [Field F] [ValuativeRel F]

/-- The valuative relation on the residue field is unique (F. K. Schmidt). -/
theorem existsUnique_residue_valuativeRel {n : ℕ} (h : IsHigherLocalField (n + 1) F) :
    ∃! _ : ValuativeRel 𝓀[F], IsHigherLocalField n 𝓀[F] :=
  sorry

/-- **Dimension one** is a nonarchimedean local field. -/
theorem isHigherLocalField_one_iff [TopologicalSpace F] [IsValuativeTopology F] :
    IsHigherLocalField 1 F ↔ IsNonarchimedeanLocalField F :=
  sorry

/-- The **standard Laurent field** `K⸨X⸩` as a type synonym carrying no topology: Mathlib's
`LaurentSeries.valued` is a global instance on `K⸨X⸩`, which would clash with `higherTopology`. -/
def LaurentField (K : Type) [Field K] : Type := LaurentSeries K

namespace LaurentField

variable (K : Type) [Field K]

noncomputable instance : Field (LaurentField K) := inferInstanceAs (Field (LaurentSeries K))

noncomputable instance : Algebra K (LaurentField K) :=
  inferInstanceAs (Algebra K (LaurentSeries K))

/-- The `X`-adic valuative relation. -/
noncomputable instance : ValuativeRel (LaurentField K) :=
  ValuativeRel.ofValuation (Valued.v : Valuation (LaurentSeries K) ℤᵐ⁰)

/-- The inner variable `X`. -/
noncomputable def X : LaurentField K := (HahnSeries.single (1 : ℤ) (1 : K) : LaurentSeries K)

end LaurentField

/-- `K⸨X⸩` over an `n`-dimensional local field is `(n + 1)`-dimensional. -/
theorem isHigherLocalField_laurentField {K : Type} [Field K] [ValuativeRel K] {n : ℕ}
    (h : IsHigherLocalField n K) : IsHigherLocalField (n + 1) (LaurentField K) :=
  sorry

end Layer0

/-! ## Layer 1: topologies -/

section Layer1

variable {F : Type} [Field F] [ValuativeRel F] {n : ℕ}

/-- The **higher topology** on an `n`-dimensional local field (Parshin; Zhukov), defined through a
presentation of `F` over a standard field and independent of it. -/
@[instance_reducible]
noncomputable def higherTopology (h : IsHigherLocalField n F) : TopologicalSpace F :=
  sorry

/-- The topology on `Fˣ`: the product of the discrete topology on `⟨t₁⟩ × ⋯ × ⟨tₙ⟩ × μ_{q−1}`
and the topology induced by `higherTopology` on the principal units. -/
@[instance_reducible]
noncomputable def unitsTopology (h : IsHigherLocalField n F) : TopologicalSpace Fˣ :=
  sorry

/-- In dimension one, the higher topology is the valuation topology. -/
theorem higherTopology_one (h : IsHigherLocalField 1 F) :
    higherTopology h = (Valued.mk' (valuation F)).toUniformSpace.toTopologicalSpace :=
  sorry

/-- Multiplication is sequentially continuous for the higher topology. -/
theorem seqContinuous_mul (h : IsHigherLocalField n F) :
    letI := higherTopology h
    SeqContinuous fun p : F × F => p.1 * p.2 :=
  sorry

end Layer1

/-! ## Worked example: the higher topology is not the valuation topology -/

section HigherTopologyExample

open Filter Topology

variable (p : ℕ) [Fact p.Prime]

/-- The inner variable `t₁` of `𝔽_p⸨X⸩⸨X⸩`. -/
noncomputable abbrev innerVariable : LaurentField (LaurentField (ZMod p)) :=
  algebraMap (LaurentField (ZMod p)) _ (LaurentField.X (ZMod p))

theorem tendsto_innerVariable_pow (h : IsHigherLocalField 2 (LaurentField (LaurentField (ZMod p)))) :
    Tendsto (fun k : ℕ => innerVariable p ^ k) atTop (@nhds _ (higherTopology h) 0) :=
  sorry

/-- The same powers, read in `LaurentSeries`, do not tend to `0` for `LaurentSeries.valued`. -/
theorem not_tendsto_innerVariable_pow_valued :
    ¬ Tendsto (fun k : ℕ => (show LaurentSeries (LaurentField (ZMod p)) from innerVariable p ^ k))
      atTop (𝓝 0) :=
  sorry

end HigherTopologyExample

/-! ## Layer 5.2: coefficientwise derivations -/

/-- A derivation of `K` extended coefficientwise to `K⸨X⸩`, used for the partial derivatives in an
inner variable in Parshin's formula. -/
noncomputable def Derivation.laurentField {K : Type} [Field K] (D : Derivation ℤ K K) :
    Derivation ℤ (LaurentField K) (LaurentField K) :=
  sorry

/-! ## Layer 2: topological Milnor K-groups -/

section Layer2

variable (F : Type) [Field F] (n : ℕ)

/-- `⋂_{l ≥ 1} l K_n(F)`. -/
def divisibleKernel : Submodule ℤ (MilnorK.degree F n) :=
  ⨅ l : ℕ+, LinearMap.range ((l : ℤ) • LinearMap.id)

/-- The **topological Milnor K-group** `K_n^top(F) = K_n(F) / ⋂_{l ≥ 1} l K_n(F)`. -/
abbrev TopologicalMilnorK : Type :=
  MilnorK.degree F n ⧸ divisibleKernel F n

variable {F n} [ValuativeRel F]

/-- **Fesenko's sequential topology** `λ` on `K_n(F)`: the finest topology for which subtraction and
the symbol map `(Fˣ)ⁿ → K_n(F)` are sequentially continuous. -/
@[instance_reducible]
noncomputable def lambdaTopology {d : ℕ} (h : IsHigherLocalField d F) :
    TopologicalSpace (MilnorK.degree F n) :=
  sInf {t | (letI := t; SeqContinuous fun p : MilnorK.degree F n × MilnorK.degree F n =>
      p.1 - p.2) ∧
    (letI := t; letI := unitsTopology h; SeqContinuous fun a : Fin n → Fˣ => MilnorK.symbolDeg a)}

/-- `Λ_n(F)`, the intersection of all `λ`-neighbourhoods of `0`. -/
def sequentialKernel {d : ℕ} (h : IsHigherLocalField d F) : Set (MilnorK.degree F n) :=
  {x | ∀ U ∈ @nhds _ (lambdaTopology h) 0, x ∈ U}

/-- **Fesenko**: `Λ_n(F) = ⋂_{l ≥ 1} l K_n(F)`, so `K_n^top(F)` is the quotient by `Λ_n(F)`. -/
theorem sequentialKernel_eq {d : ℕ} (h : IsHigherLocalField d F) :
    sequentialKernel (n := n) h = (divisibleKernel F n : Set (MilnorK.degree F n)) :=
  sorry

/-- The quotient topology on `K_n^top(F)`. -/
@[instance_reducible]
noncomputable def topologicalMilnorKTopology {d : ℕ} (h : IsHigherLocalField d F) :
    TopologicalSpace (TopologicalMilnorK F n) :=
  (lambdaTopology h).coinduced (divisibleKernel F n).mkQ

/-- The **degree map** `v_F : K_n(F) → ℤ`, the iterated residue down to the finite field followed by
the valuation of the one-dimensional field: `v_F{t₁, …, tₙ} = 1`. -/
noncomputable def degreeMap (h : IsHigherLocalField n F) : MilnorK.degree F n →ₗ[ℤ] ℤ :=
  sorry

theorem divisibleKernel_le_ker_degreeMap (h : IsHigherLocalField n F) :
    divisibleKernel F n ≤ LinearMap.ker (degreeMap h) :=
  sorry

variable (F n)

/-- The **norm subgroup** `N_{L/F} K_n^top(L)` of a finite subextension `L`. -/
noncomputable def normSubgroup (L : IntermediateField F (AlgebraicClosure F)) [FiniteDimensional F L] :
    Submodule ℤ (TopologicalMilnorK F n) :=
  (LinearMap.range (milnorNorm F L n)).map (divisibleKernel F n).mkQ

end Layer2

/-! ## Layers 4 and 5: reciprocity and existence -/

section Reciprocity

/- The class field hypothesis: `n ≥ 1` and `char 𝓀[F] = p`. -/
variable {F : Type} [Field F] [ValuativeRel F] {n : ℕ} {p : ℕ} [Fact p.Prime] [CharP 𝓀[F] p]

/-- The **reciprocity map** `Ψ_F : K_n^top(F) → G_F^ab`, the Neukirch–Fesenko map, under the class
field hypothesis. -/
noncomputable def reciprocityMap (h : IsHigherLocalField n F) (hn : 1 ≤ n) (p : ℕ) [Fact p.Prime]
    [CharP 𝓀[F] p] :
    TopologicalMilnorK F n →+ Additive (Field.absoluteGaloisGroupAbelianization F) :=
  sorry

/-- **Reciprocity at finite level**: for a finite abelian `L/F`, `Ψ_F(α)` is trivial on `L` exactly
when `α` is a norm from `L`. -/
theorem reciprocityMap_mem_normSubgroup_iff (h : IsHigherLocalField n F) (hn : 1 ≤ n)
    (L : IntermediateField F (AlgebraicClosure F)) [FiniteDimensional F L] [IsAbelianGalois F L]
    (α : TopologicalMilnorK F n)
    (σ : Field.absoluteGaloisGroup F)
    (hσ : Additive.ofMul (σ : Field.absoluteGaloisGroupAbelianization F) = reciprocityMap h hn p α) :
    α ∈ normSubgroup F n L ↔ σ.restrictNormal L = 1 :=
  sorry

/-- **Reciprocity at finite level**: `Ψ_F` maps onto `Gal(L/F)`. -/
theorem exists_reciprocityMap_restrictNormal_eq (h : IsHigherLocalField n F) (hn : 1 ≤ n)
    (L : IntermediateField F (AlgebraicClosure F)) [FiniteDimensional F L] [IsGalois F L]
    (τ : Gal(L/F)) :
    ∃ (α : TopologicalMilnorK F n) (σ : Field.absoluteGaloisGroup F),
      Additive.ofMul (σ : Field.absoluteGaloisGroupAbelianization F) = reciprocityMap h hn p α ∧
        σ.restrictNormal L = τ :=
  sorry

/-- **Separation**: the open subgroups of finite index of `K_n^top(F)` have zero intersection. -/
theorem iInf_openFiniteIndex_eq_bot (h : IsHigherLocalField n F) (hn : 2 ≤ n) :
    ⨅ (N : Submodule ℤ (TopologicalMilnorK F n))
      (_ : @IsOpen _ (topologicalMilnorKTopology (n := n) h) (N : Set (TopologicalMilnorK F n)))
      (_ : N.toAddSubgroup.FiniteIndex), N = ⊥ :=
  sorry

/-- **Injectivity** for `n ≥ 2`: the kernel of `K_n(F) → G_F^ab` is `⋂_{l ≥ 1} l K_n(F)`. -/
theorem injective_reciprocityMap (h : IsHigherLocalField n F) (hn : 2 ≤ n) :
    Function.Injective (reciprocityMap h (by omega) p) :=
  sorry

/-- **The existence theorem**: the open subgroups of finite index of `K_n^top(F)` are exactly the
norm subgroups of finite abelian extensions. -/
theorem isOpen_and_finiteIndex_iff_exists_normSubgroup (h : IsHigherLocalField n F) (hn : 2 ≤ n)
    (N : Submodule ℤ (TopologicalMilnorK F n)) :
    (@IsOpen _ (topologicalMilnorKTopology (n := n) h) (N : Set (TopologicalMilnorK F n)) ∧
        N.toAddSubgroup.FiniteIndex) ↔
      ∃ (L : IntermediateField F (AlgebraicClosure F)) (_ : FiniteDimensional F L)
        (_ : IsAbelianGalois F L), N = normSubgroup F n L :=
  sorry

/-- **The correspondence reverses inclusion.** -/
theorem normSubgroup_le_normSubgroup_iff (h : IsHigherLocalField n F) (hn : 2 ≤ n)
    (L L' : IntermediateField F (AlgebraicClosure F))
    [FiniteDimensional F L] [FiniteDimensional F L'] [IsAbelianGalois F L] [IsAbelianGalois F L'] :
    normSubgroup F n L ≤ normSubgroup F n L' ↔ L' ≤ L :=
  sorry

/-- The class of `{x}` in `K_1^top(F)`. -/
def unitClass (x : Fˣ) : TopologicalMilnorK F 1 :=
  (divisibleKernel F 1).mkQ (MilnorK.symbolDeg ![x])

/-- **Dimension one**: `Ψ_F` is the local Artin map of the class field theory roadmap. -/
theorem reciprocityMap_unitClass [TopologicalSpace F] [IsNonarchimedeanLocalField F] (x : Fˣ) :
    reciprocityMap (isHigherLocalField_one_iff.mpr inferInstance) le_rfl p (unitClass x) =
      Additive.ofMul (TauCeti.ClassFieldTheory.artinMap F x) :=
  sorry

end Reciprocity

end TauCetiRoadmap.HigherLocalClassFieldTheory
