import Mathlib
import TauCetiRoadmap.MassFormula.Suggested
import TauCeti.NumberTheory.LocalField.Unramified.Existence
import TauCeti.NumberTheory.LocalField.Unramified.Maximal

/-!
# Bhargava's mass formula for étale algebras over a local field: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

The narrative roadmap (the standing conventions, the consumed contract, Layers 0–3, the worked
examples, and the references) is in `README.md`. Mathlib has the Krull topology on
`SeparableClosure K ≃ₐ[K] SeparableClosure K`, fixed fields of subgroups, orbit quotients of a
group action, the structure theorem `Algebra.FormallyEtale.iff_exists_algEquiv_prod` for étale
algebras over a field, and integer partitions `Nat.Partition`. It has **no** mass formula over
étale algebras ([Bhargava 2007]).

⚠ **Serre's mass formula and its invariants are consumed, not built here.** The discriminant
exponent of a subextension of `SeparableClosure K` is the `MassFormula` roadmap's
`intermediateFieldDiscriminantExponent`, and Serre's Theorem 1 is that roadmap's summit. Both are
implemented in Tau Ceti (`TauCeti/NumberTheory/LocalField/MassFormula/`, as
`IntermediateField.discriminantExponent` and
`TauCeti.tsum_one_div_natCard_residueField_pow_wildExponent`). The Tau Ceti revision this
repository pins predates that implementation, so this file imports the `MassFormula` roadmap's
`Suggested.lean` instead; the import is replaced by Tau Ceti's when the pin moves.

The unramified extension of degree `f` and the maximal unramified extension are Tau Ceti's
`TauCeti.unramifiedExtension` and `TauCeti.maximalUnramifiedExtension`, imported above.

This file pins the roadmap's load-bearing **definitions** (`orbitDiscriminantExponent`,
`GaloisSet` with its weight and splitting symbol, `etaleMass`, `homMulAction`,
`etaleDiscriminantExponent`, and the wrapper `intermediateFieldInertiaDegree`) and its **named
milestones** as `sorry`-targets (`sorry` is allowed in this human-owned roadmap library — these
are goals, not proofs).

Suggested home: `TauCeti/NumberTheory/LocalField/EtaleMassFormula/`.
-/

open ValuativeRel
open scoped ENNReal Nat

namespace TauCetiRoadmap.EtaleMassFormula

open MassFormula (intermediateFieldDiscriminantExponent)

universe u

variable (K : Type u) [Field K] [ValuativeRel K] [UniformSpace K] [IsUniformAddGroup K]
  [IsNonarchimedeanLocalField K]

/-! ## Layer 0: Galois sets, their weight, and the mass -/

/-- The weight of a set with an action of `Gal(K^sep/K)`: the sum, over the orbits, of the
discriminant exponent of the fixed field of the stabilizer of a point of the orbit. The choice of
point does not matter (`orbitDiscriminantExponent_eq`, by invariance of the discriminant exponent
under `K`-isomorphism). For a finite set with open stabilizers this is the discriminant exponent of
the corresponding étale algebra. -/
noncomputable def orbitDiscriminantExponent (X : Type*)
    [MulAction (SeparableClosure K ≃ₐ[K] SeparableClosure K) X] : ℕ :=
  ∑ᶠ O : MulAction.orbitRel.Quotient (SeparableClosure K ≃ₐ[K] SeparableClosure K) X,
    intermediateFieldDiscriminantExponent
      (IntermediateField.fixedField (MulAction.stabilizer
        (SeparableClosure K ≃ₐ[K] SeparableClosure K) (Quotient.out O : X)))

/-- The fixed field of a stabilizer depends on the point only up to `K`-isomorphism, so the
orbit weight may be computed at any point of the orbit. -/
theorem intermediateFieldDiscriminantExponent_fixedField_stabilizer_smul (X : Type*)
    [MulAction (SeparableClosure K ≃ₐ[K] SeparableClosure K) X]
    (σ : SeparableClosure K ≃ₐ[K] SeparableClosure K) (x : X) :
    intermediateFieldDiscriminantExponent
        (IntermediateField.fixedField
          (MulAction.stabilizer (SeparableClosure K ≃ₐ[K] SeparableClosure K) (σ • x))) =
      intermediateFieldDiscriminantExponent
        (IntermediateField.fixedField
          (MulAction.stabilizer (SeparableClosure K ≃ₐ[K] SeparableClosure K) x)) :=
  sorry

/-- A **Galois set of size `n`**: a continuous action of `Gal(K^sep/K)` on `Fin n`, as a
homomorphism to `Equiv.Perm (Fin n)` with open kernel. -/
noncomputable abbrev GaloisSet (n : ℕ) : Type u :=
  {ρ : (SeparableClosure K ≃ₐ[K] SeparableClosure K) →* Equiv.Perm (Fin n) //
    IsOpen (ρ.ker : Set (SeparableClosure K ≃ₐ[K] SeparableClosure K))}

namespace GaloisSet

variable {K} {n : ℕ}

/-- The action of `Gal(K^sep/K)` on `Fin n` that a Galois set is. -/
noncomputable abbrev mulAction (ρ : GaloisSet K n) :
    MulAction (SeparableClosure K ≃ₐ[K] SeparableClosure K) (Fin n) :=
  MulAction.compHom (Fin n) ρ.1

/-- The weight `d(ρ)` of a Galois set: `orbitDiscriminantExponent` for its action. -/
noncomputable def discriminantExponent (ρ : GaloisSet K n) : ℕ :=
  letI := ρ.mulAction
  orbitDiscriminantExponent K (Fin n)

/-- A Galois set is transitive when its action is. -/
def IsTransitive (ρ : GaloisSet K n) : Prop :=
  letI := ρ.mulAction
  MulAction.IsPretransitive (SeparableClosure K ≃ₐ[K] SeparableClosure K) (Fin n)

/-- **The degree of a stabilizer's fixed field is the orbit size**: the fixed field of the
stabilizer of `i` has degree over `K` equal to the cardinality of the orbit of `i`. -/
theorem finrank_fixedField_stabilizer (ρ : GaloisSet K n) (i : Fin n) :
    letI := ρ.mulAction
    Module.finrank K
        (IntermediateField.fixedField
          (MulAction.stabilizer (SeparableClosure K ≃ₐ[K] SeparableClosure K) i)) =
      Nat.card (MulAction.orbit (SeparableClosure K ≃ₐ[K] SeparableClosure K) i) :=
  sorry

end GaloisSet

/-- **The étale mass** `M_n(K) = (1/n!) ∑_ρ q^{-d(ρ)}`, summed over all Galois sets of size `n`, in
`ℝ≥0∞`. By orbit–stabilizer for the relabelling action of `Equiv.Perm (Fin n)` this is
Bhargava's `∑_{[A]} 1 / (#Aut_K(A) · q^{v(Disc A)})` (`tsum_etaleDiscriminantExponent`). -/
noncomputable def etaleMass (n : ℕ) : ℝ≥0∞ :=
  (n ! : ℝ≥0∞)⁻¹ *
    ∑' ρ : GaloisSet K n, 1 / (Nat.card 𝓀[K] : ℝ≥0∞) ^ ρ.discriminantExponent

/-- **The transitive bridge**: transitive Galois sets of size `n` are degree-`n` subextensions of
`SeparableClosure K` with a labelling of their `n` embeddings fixing the base point, and the
weight of `ρ` is the discriminant exponent of the fixed field of the stabilizer of `0`. Each
subextension carries `(n − 1)!` labellings. -/
theorem tsum_isTransitive (n : ℕ) (hn : 0 < n) :
    ∑' ρ : {ρ : GaloisSet K n // ρ.IsTransitive},
        1 / (Nat.card 𝓀[K] : ℝ≥0∞) ^ ρ.1.discriminantExponent =
      ((n - 1)! : ℝ≥0∞) *
        ∑' L : {L : IntermediateField K (SeparableClosure K) // Module.finrank K L = n},
          1 / (Nat.card 𝓀[K] : ℝ≥0∞) ^ intermediateFieldDiscriminantExponent L.1 :=
  sorry

/-- The action of `Gal(K^sep/K)` on the `K`-algebra maps `A → K^sep` by composition. -/
@[instance_reducible]
noncomputable def homMulAction (A : Type*) [CommRing A] [Algebra K A] :
    MulAction (SeparableClosure K ≃ₐ[K] SeparableClosure K) (A →ₐ[K] SeparableClosure K) where
  smul := fun σ g => σ.toAlgHom.comp g
  one_smul _ := AlgHom.ext fun _ => rfl
  mul_smul _ _ _ := AlgHom.ext fun _ => rfl

/-- The **discriminant exponent of an étale algebra** `A`: the weight of the Galois set
`A →ₐ[K] K^sep`. For `A ≃ₐ[K] ∏ i, L i` with each `L i` a finite separable field extension it is
`∑ i, v_K(Disc(L i / K))` (`etaleDiscriminantExponent_pi`), Bhargava's `v(Disc A)`. -/
noncomputable def etaleDiscriminantExponent (A : Type*) [CommRing A] [Algebra K A] : ℕ :=
  letI := homMulAction K A
  orbitDiscriminantExponent K (A →ₐ[K] SeparableClosure K)

/-- **The weight of a product is the sum of the weights**: for a finite product of finite
separable field extensions, the discriminant exponent is the sum of the factors' discriminant
exponents, each computed on a `K`-embedded copy in `SeparableClosure K`. -/
theorem etaleDiscriminantExponent_pi {ι : Type*} [Fintype ι]
    (L : ι → IntermediateField K (SeparableClosure K)) [∀ i, FiniteDimensional K (L i)] :
    etaleDiscriminantExponent K (∀ i, L i) =
      ∑ i, intermediateFieldDiscriminantExponent (L i) :=
  sorry

/-- **Bhargava's mass is the étale mass** ([Bhargava 2007, Thm. 1.1, left-hand side]): for any
family `A` of étale `K`-algebras of degree `n` containing exactly one member of each
`K`-isomorphism class, `∑ 1 / (#Aut_K(A i) · q^{d(A i)}) = M_n(K)`. Orbit–stabilizer for the
relabelling action of `Equiv.Perm (Fin n)` on Galois sets, whose orbits are the isomorphism
classes (Grothendieck's Galois theory for étale algebras) and whose stabilizers are the
automorphism groups. -/
theorem tsum_etaleDiscriminantExponent (n : ℕ) {ι : Type*} (A : ι → Type u)
    [∀ i, CommRing (A i)] [∀ i, Algebra K (A i)] [∀ i, Algebra.Etale K (A i)]
    (hdeg : ∀ i, Module.finrank K (A i) = n)
    (hinj : ∀ i j, Nonempty (A i ≃ₐ[K] A j) → i = j)
    (hsurj : ∀ (B : Type u) [CommRing B] [Algebra K B] [Algebra.Etale K B],
      Module.finrank K B = n → ∃ i, Nonempty (B ≃ₐ[K] A i)) :
    ∑' i, 1 / ((Nat.card (A i ≃ₐ[K] A i) : ℝ≥0∞) *
        (Nat.card 𝓀[K] : ℝ≥0∞) ^ etaleDiscriminantExponent K (A i)) =
      etaleMass K n :=
  sorry

/-! ## Layer 1: extensions by their unramified part -/

variable {K}

/-- The residue degree `f(L/K)` of a subextension `L` of `SeparableClosure K`: Tau Ceti's
`TauCeti.inertiaDegree` (consumed as `LocalFieldsRamification.inertiaDegree`), totalized over an
arbitrary `L` by installing the consumed `finiteIntermediateField*` structures on the finite
branch, with junk value `0` for `L` infinite over `K`. The same totalization as `MassFormula`'s
`intermediateFieldDiscriminantExponent`. -/
noncomputable def intermediateFieldInertiaDegree
    (L : IntermediateField K (SeparableClosure K)) : ℕ :=
  open scoped Classical in
  if hfin : Module.Finite K ↥L then
    haveI := hfin
    letI : ValuativeRel ↥L :=
      LocalFieldsRamification.finiteIntermediateFieldValuativeRel K (SeparableClosure K) L
    letI : TopologicalSpace ↥L :=
      LocalFieldsRamification.finiteIntermediateFieldTopology K (SeparableClosure K) L
    haveI : IsNonarchimedeanLocalField ↥L :=
      LocalFieldsRamification.finiteIntermediateField_isNonarchimedeanLocalField K
        (SeparableClosure K) L
    haveI : ValuativeExtension K ↥L :=
      LocalFieldsRamification.finiteIntermediateField_valuativeExtension K (SeparableClosure K) L
    LocalFieldsRamification.inertiaDegree K ↥L
  else 0

/-- **The unramified part of a subextension** is the unramified extension of degree `f(L/K)`: for
`L` finite over `K`, its intersection with `K^ur` is `TauCeti.unramifiedExtension K K^sep f(L/K)`.
This is the subfield form of `L^ur ≅ K_f`. -/
theorem inf_maximalUnramifiedExtension (L : IntermediateField K (SeparableClosure K))
    [FiniteDimensional K L] :
    L ⊓ TauCeti.maximalUnramifiedExtension K (SeparableClosure K) =
      TauCeti.unramifiedExtension K (SeparableClosure K) (intermediateFieldInertiaDegree L) :=
  sorry

/-- **The automorphism count** of §0.6: with `U` the unramified extension of degree `f(L/K)`, the
restriction `Aut_K(L) → Gal(U/K)` has kernel `Aut_U(L)` and image the elements of `Gal(U/K)` that
extend to `L`, so `#Aut_K(L) = #Aut_U(L) · #Stab([L])`. -/
theorem natCard_algEquiv_eq_mul (L : IntermediateField K (SeparableClosure K))
    [FiniteDimensional K L]
    (hU : TauCeti.unramifiedExtension K (SeparableClosure K) (intermediateFieldInertiaDegree L) ≤
      L) :
    Nat.card (L ≃ₐ[K] L) =
      Nat.card (IntermediateField.extendScalars hU ≃ₐ[TauCeti.unramifiedExtension K (SeparableClosure K)
          (intermediateFieldInertiaDegree L)] IntermediateField.extendScalars hU) *
        Nat.card {τ : TauCeti.unramifiedExtension K (SeparableClosure K)
            (intermediateFieldInertiaDegree L) ≃ₐ[K]
            TauCeti.unramifiedExtension K (SeparableClosure K) (intermediateFieldInertiaDegree L) //
          ∃ σ : L ≃ₐ[K] L, ∀ x, (σ ⟨x.1, hU x.2⟩ : SeparableClosure K) = τ x} :=
  sorry

/-- **The orbit count for every finite subextension**: the `K`-isomorphism class of `L` inside
`SeparableClosure K` has `[L : K] / #Aut_K(L)` members, in multiplied form. `MassFormula`'s
`ncard_isomorphic_mul_natCard_algEquiv` is the totally ramified case. -/
theorem ncard_isomorphic_mul_natCard_algEquiv (L : IntermediateField K (SeparableClosure K))
    [FiniteDimensional K L] :
    {M : IntermediateField K (SeparableClosure K) | Nonempty (L ≃ₐ[K] M)}.ncard *
      Nat.card (L ≃ₐ[K] L) = Module.finrank K L :=
  sorry

/-! ## Layer 2: the transitive mass by residue degree -/

variable (K)

/-- **Serre's Theorem 1 over the unramified extension of degree `f`**, read over `K`: the
subextensions of `SeparableClosure K` of degree `f * e` and residue degree `f` satisfy
`∑ q^{-d(L/K)} = e · q^{-f(e-1)}`. Each contains `K_f` (`inf_maximalUnramifiedExtension`), is
totally ramified of degree `e` over it, and has `d(L/K) = f · d(L/K_f)`
(`TauCeti.discriminantExponent_tower`, with `d(K_f/K) = 0`); Serre's formula over `K_f`, whose
residue field has `q^f` elements, then gives the value. -/
theorem tsum_inertiaDegree_eq (f e : ℕ) (hf : 0 < f) (he : 0 < e) :
    ∑' L : {L : IntermediateField K (SeparableClosure K) //
        Module.finrank K L = f * e ∧ intermediateFieldInertiaDegree L = f},
      1 / (Nat.card 𝓀[K] : ℝ≥0∞) ^ intermediateFieldDiscriminantExponent L.1 =
      e / (Nat.card 𝓀[K] : ℝ≥0∞) ^ (f * (e - 1)) :=
  sorry

namespace GaloisSet

variable {K} {n : ℕ}

open scoped Classical in
/-- The **splitting symbol** of a Galois set ([Bhargava 2007, (2.1)]): the multiset, over its
orbits, of the pair `(f, e)` of residue degree and ramification index of the fixed field of the
stabilizer of a point of the orbit. -/
noncomputable def splittingSymbol (ρ : GaloisSet K n) : Multiset (ℕ × ℕ) :=
  letI := ρ.mulAction
  haveI := Fintype.ofFinite
    (MulAction.orbitRel.Quotient (SeparableClosure K ≃ₐ[K] SeparableClosure K) (Fin n))
  (Finset.univ : Finset
      (MulAction.orbitRel.Quotient (SeparableClosure K ≃ₐ[K] SeparableClosure K) (Fin n))).val.map
    fun O => (fun F : IntermediateField K (SeparableClosure K) =>
      (intermediateFieldInertiaDegree F, Module.finrank K F / intermediateFieldInertiaDegree F))
        (IntermediateField.fixedField
          (MulAction.stabilizer (SeparableClosure K ≃ₐ[K] SeparableClosure K)
            (Quotient.out O : Fin n)))

end GaloisSet

/-- `#Aut(σ)` of a splitting symbol ([Bhargava 2007, §2]): the product of the residue degrees,
times the number of permutations of the factors preserving `σ`. -/
def splittingSymbolAut (σ : Multiset (ℕ × ℕ)) : ℕ :=
  (σ.map Prod.fst).prod * ∏ x ∈ σ.toFinset, (σ.count x)!

/-- The exponent of `Disc_p(σ)` ([Bhargava 2007, §2]): `∑ f_i (e_i − 1)`. -/
def splittingSymbolExponent (σ : Multiset (ℕ × ℕ)) : ℕ :=
  (σ.map fun x => x.1 * (x.2 - 1)).sum

variable {K}

/-- **The transitive mass by residue degree**: the transitive Galois sets of size `f * e` whose
point stabilizers have residue degree `f` have mass `q^{-f(e-1)} / f`. This is `tsum_isTransitive`
followed by `tsum_inertiaDegree_eq`, and the case `r = 1` of `etaleMass_splittingSymbol`. -/
theorem etaleMass_isTransitive_splittingSymbol (f e : ℕ) (hf : 0 < f) (he : 0 < e) :
    ((f * e)! : ℝ≥0∞)⁻¹ *
        ∑' ρ : {ρ : GaloisSet K (f * e) // ρ.IsTransitive ∧ ρ.splittingSymbol = {(f, e)}},
          1 / (Nat.card 𝓀[K] : ℝ≥0∞) ^ ρ.1.discriminantExponent =
      1 / ((f : ℝ≥0∞) * (Nat.card 𝓀[K] : ℝ≥0∞) ^ (f * (e - 1))) :=
  sorry

/-! ## Layer 3: Bhargava's mass formulas -/

/-- **Mass formula for a fixed splitting type** ([Bhargava 2007, Prop. 2.1]): for a splitting
symbol `σ` of degree `n`, the Galois sets with symbol `σ` have mass `1 / (#Aut(σ) · q^{∑ f_i(e_i−1)})`.
The orbit decomposition factors the mass into transitive masses (Layer 2), divided by the
permutations of equal factors. -/
theorem etaleMass_splittingSymbol (n : ℕ) (σ : Multiset (ℕ × ℕ))
    (hσ : ∀ x ∈ σ, 0 < x.1 ∧ 0 < x.2) (hn : (σ.map fun x => x.1 * x.2).sum = n) :
    (n ! : ℝ≥0∞)⁻¹ *
        ∑' ρ : {ρ : GaloisSet K n // ρ.splittingSymbol = σ},
          1 / (Nat.card 𝓀[K] : ℝ≥0∞) ^ ρ.1.discriminantExponent =
      1 / ((splittingSymbolAut σ : ℝ≥0∞) *
        (Nat.card 𝓀[K] : ℝ≥0∞) ^ splittingSymbolExponent σ) :=
  sorry

/-- The **ramification partition** of a splitting symbol ([Bhargava 2007, §2]): each `e_i − 1`
repeated `f_i` times, zeros dropped. For a symbol of degree `n` with exponent `k` it is a
partition of `k` into at most `n − k` parts. -/
def ramificationPartition (σ : Multiset (ℕ × ℕ)) : Multiset ℕ :=
  (σ.bind fun x => Multiset.replicate x.1 (x.2 - 1)).filter (· ≠ 0)

/-- **Mass formula for a fixed ramification partition** ([Bhargava 2007, Prop. 2.2]): for a
partition `π` of `k` into at most `n − k` parts, the Galois sets of size `n` whose splitting
symbol has ramification partition `π` have mass `q^{-k}`. -/
theorem etaleMass_ramificationPartition (n k : ℕ) (hk : k ≤ n) (π : k.Partition)
    (hπ : π.parts.card ≤ n - k) :
    (n ! : ℝ≥0∞)⁻¹ *
        ∑' ρ : {ρ : GaloisSet K n // ramificationPartition ρ.splittingSymbol = π.parts},
          1 / (Nat.card 𝓀[K] : ℝ≥0∞) ^ ρ.1.discriminantExponent =
      1 / (Nat.card 𝓀[K] : ℝ≥0∞) ^ k :=
  sorry

/-- **The unramified mass** ([Bhargava 2007, (2.4)]): the Galois sets of size `n` all of whose
orbits are unramified have mass `1`. The case `k = 0` of `etaleMass_ramificationPartition`. -/
theorem etaleMass_unramified (n : ℕ) :
    (n ! : ℝ≥0∞)⁻¹ *
        ∑' ρ : {ρ : GaloisSet K n // ∀ x ∈ ρ.splittingSymbol, x.2 = 1},
          1 / (Nat.card 𝓀[K] : ℝ≥0∞) ^ ρ.1.discriminantExponent = 1 :=
  sorry

variable (K)

/-- **Bhargava's mass formula** ([Bhargava 2007, Thm. 1.1, Prop. 2.3, and §8 for an arbitrary
non-archimedean local field]): `M_n(K) = ∑_{k<n} q(k, n − k) q^{-k}`, with `q(k, m)` the number
of partitions of `k` into at most `m` parts. -/
theorem etaleMass_eq (n : ℕ) (hn : 0 < n) :
    etaleMass K n =
      ∑ k ∈ Finset.range n,
        (((Finset.univ : Finset k.Partition).filter fun π => π.parts.card ≤ n - k).card :
            ℝ≥0∞) / (Nat.card 𝓀[K] : ℝ≥0∞) ^ k :=
  sorry

end TauCetiRoadmap.EtaleMassFormula
