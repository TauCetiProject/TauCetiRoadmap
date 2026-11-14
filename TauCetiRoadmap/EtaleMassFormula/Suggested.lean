import Mathlib
import TauCeti.NumberTheory.LocalField.Discriminant.Basic
import TauCeti.NumberTheory.LocalField.FiniteExtension.IntermediateField
import TauCeti.NumberTheory.LocalField.InertiaDegree
import TauCeti.NumberTheory.LocalField.Unramified.Existence
import TauCeti.NumberTheory.LocalField.Unramified.Maximal

/-!
# Bhargava's mass formula for étale algebras over a local field: suggested signatures

These signatures are suggested forms, not an exhaustive checklist. `README.md` is the definitive
specification.

The file states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti:
Bhargava's formula `etaleMass_eq`, its refinements by splitting type
(`etaleMass_splittingSymbol`) and by ramification partition (`etaleMass_ramificationPartition`),
the identification `tsum_etaleDiscriminantExponent` of the sum over étale algebras with the
mass of Galois sets, and the wreath-product masses of Layer 4: Kedlaya's `wreathMass_two` for
`W(B_n)` and Wood's `exists_wreathMass_eq_aeval` for `S_m ≀ S_n`. All of them are statable at the
pins. The definitions they need are the
Galois-set carrier `GaloisSet` with its weight and splitting symbol, the orbit weight
`orbitDiscriminantExponent`, the mass `etaleMass`, the étale weight `etaleDiscriminantExponent`,
and the totalized invariants `intermediateFieldDiscriminantExponent` and
`intermediateFieldInertiaDegree` of a subextension of `SeparableClosure K`; Layer 4 adds the
wreath carrier `WreathGaloisSet` with its counting function and the Galois sets
`RelativeGaloisSet` over a finite subextension.

`intermediateFieldDiscriminantExponent` is stated with the body of Tau Ceti's
`IntermediateField.discriminantExponent` (`TauCeti/NumberTheory/LocalField/MassFormula/Basic.lean`),
over the `TauCeti.finiteIntermediateField*` adapters; implementations use Tau Ceti's declaration.
Serre's Theorem 1, which Layer 2 applies, is cited from the mass formula roadmap's README and is
not restated here.

Suggested home: `TauCeti/NumberTheory/LocalField/EtaleMassFormula/`.
-/

open ValuativeRel
open scoped ENNReal Nat

namespace TauCetiRoadmap.EtaleMassFormula

universe u

variable {K : Type u} [Field K] [ValuativeRel K] [TopologicalSpace K]
  [IsNonarchimedeanLocalField K]

open scoped Classical in
/-- The discriminant exponent `d(L/K)` of a subextension `L` of `SeparableClosure K`:
`TauCeti.discriminantExponent K L` for the local-field structure of
`TauCeti.finiteIntermediateFieldValuativeRel` and `TauCeti.finiteIntermediateFieldTopology` when
`L / K` is finite, and the junk value `0` otherwise; the body of Tau Ceti's
`IntermediateField.discriminantExponent`. -/
noncomputable def intermediateFieldDiscriminantExponent
    (L : IntermediateField K (SeparableClosure K)) : ℕ :=
  if _ : Module.Finite K L then
    letI := TauCeti.finiteIntermediateFieldValuativeRel K (SeparableClosure K) L
    letI := TauCeti.finiteIntermediateFieldTopology K (SeparableClosure K) L
    haveI := TauCeti.finiteIntermediateField_isNonarchimedeanLocalField K (SeparableClosure K) L
    haveI := TauCeti.finiteIntermediateField_valuativeExtension K (SeparableClosure K) L
    TauCeti.discriminantExponent K L
  else 0

variable (K)

/-! ## Layer 0: Galois sets, their weight, and the mass -/

/-- The weight of a set with an action of `Gal(K^sep/K)`: the sum, over the orbits, of the
discriminant exponent of the fixed field of the stabilizer of a point of the orbit. The choice of
point does not matter (`intermediateFieldDiscriminantExponent_fixedField_stabilizer_smul`, by
invariance of the discriminant exponent under `K`-isomorphism). For a finite set with open stabilizers this is the discriminant exponent of
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

/-- **The weight of a transitive Galois set** is the discriminant exponent of the fixed field of
the stabilizer of any point: there is one orbit. -/
theorem GaloisSet.discriminantExponent_of_isTransitive {n : ℕ} (ρ : GaloisSet K n)
    (hρ : ρ.IsTransitive) (i : Fin n) :
    ρ.discriminantExponent =
      (letI := ρ.mulAction
      intermediateFieldDiscriminantExponent
        (IntermediateField.fixedField
          (MulAction.stabilizer (SeparableClosure K ≃ₐ[K] SeparableClosure K) i))) :=
  sorry

/-- **The transitive bridge**: transitive Galois sets of size `n` are degree-`n` subextensions of
`SeparableClosure K` with a labelling of their `n` embeddings sending the base point to `0`, through
the fixed field of the stabilizer of `0`. Each subextension carries `(n − 1)!` labellings, so for
every weight `g` the transitive Galois sets weigh `(n − 1)!` times
the subextensions of degree `n`. With `g = q^{-d}` and `discriminantExponent_of_isTransitive` it
computes the transitive mass; with `g` supported on residue degree `f` it gives
`etaleMass_isTransitive_splittingSymbol`. -/
theorem tsum_isTransitive (n : ℕ) (hn : 0 < n)
    (g : IntermediateField K (SeparableClosure K) → ℝ≥0∞) :
    ∑' ρ : {ρ : GaloisSet K n // ρ.IsTransitive},
        (letI := ρ.1.mulAction
        g (IntermediateField.fixedField
          (MulAction.stabilizer (SeparableClosure K ≃ₐ[K] SeparableClosure K) (⟨0, hn⟩ : Fin n)))) =
      ((n - 1)! : ℝ≥0∞) *
        ∑' L : {L : IntermediateField K (SeparableClosure K) // Module.finrank K L = n}, g L.1 :=
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

/-- The residue degree `f(L/K)` of a subextension `L` of `SeparableClosure K`:
`TauCeti.inertiaDegree K L` for the local-field structure of the `finiteIntermediateField*`
adapters when `L / K` is finite, and the junk value `0` otherwise; the same totalization as
`intermediateFieldDiscriminantExponent`. -/
noncomputable def intermediateFieldInertiaDegree
    (L : IntermediateField K (SeparableClosure K)) : ℕ :=
  open scoped Classical in
  if _ : Module.Finite K L then
    letI := TauCeti.finiteIntermediateFieldValuativeRel K (SeparableClosure K) L
    letI := TauCeti.finiteIntermediateFieldTopology K (SeparableClosure K) L
    haveI := TauCeti.finiteIntermediateField_isNonarchimedeanLocalField K (SeparableClosure K) L
    haveI := TauCeti.finiteIntermediateField_valuativeExtension K (SeparableClosure K) L
    TauCeti.inertiaDegree K L
  else 0

/-- The residue degree is an invariant of the `K`-isomorphism class, junk case included; what makes
`GaloisSet.splittingSymbol` independent of the point chosen in each orbit. -/
theorem intermediateFieldInertiaDegree_eq_of_algEquiv
    {L M : IntermediateField K (SeparableClosure K)} (e : L ≃ₐ[K] M) :
    intermediateFieldInertiaDegree L = intermediateFieldInertiaDegree M :=
  sorry

/-- **The unramified part of a subextension** is the unramified extension of degree `f(L/K)`: for
`L` finite over `K`, its intersection with `K^ur` is `TauCeti.unramifiedExtension K K^sep f(L/K)`.
This is the subfield form of `L^ur ≅ K_f`. -/
theorem inf_maximalUnramifiedExtension (L : IntermediateField K (SeparableClosure K))
    [FiniteDimensional K L] :
    L ⊓ TauCeti.maximalUnramifiedExtension K (SeparableClosure K) =
      TauCeti.unramifiedExtension K (SeparableClosure K) (intermediateFieldInertiaDegree L) :=
  sorry

/-- **The unramified part lies in the subextension**: for `L` finite over `K`, the unramified
extension of degree `f(L/K)` is contained in `L`; `inf_le_left` after
`inf_maximalUnramifiedExtension`. -/
theorem unramifiedExtension_inertiaDegree_le (L : IntermediateField K (SeparableClosure K))
    [FiniteDimensional K L] :
    TauCeti.unramifiedExtension K (SeparableClosure K) (intermediateFieldInertiaDegree L) ≤ L :=
  sorry

/-- **The automorphism count** of §1.2: with `U` the unramified extension of degree `f(L/K)`, the
restriction `Aut_K(L) → Gal(U/K)` has kernel `Aut_U(L)` and image the elements of `Gal(U/K)` that
extend to `L`, so `#Aut_K(L) = #Aut_U(L) · #Stab([L])`. -/
theorem natCard_algEquiv_eq_mul (L : IntermediateField K (SeparableClosure K))
    [FiniteDimensional K L] :
    Nat.card (L ≃ₐ[K] L) =
      Nat.card (IntermediateField.extendScalars (unramifiedExtension_inertiaDegree_le L) ≃ₐ[
          TauCeti.unramifiedExtension K (SeparableClosure K) (intermediateFieldInertiaDegree L)]
          IntermediateField.extendScalars (unramifiedExtension_inertiaDegree_le L)) *
        Nat.card {τ : TauCeti.unramifiedExtension K (SeparableClosure K)
            (intermediateFieldInertiaDegree L) ≃ₐ[K]
            TauCeti.unramifiedExtension K (SeparableClosure K) (intermediateFieldInertiaDegree L) //
          ∃ σ : L ≃ₐ[K] L, ∀ x,
            (σ ⟨x.1, unramifiedExtension_inertiaDegree_le L x.2⟩ : SeparableClosure K) = τ x} :=
  sorry

/-- **The orbit count for every finite subextension**: the `K`-isomorphism class of `L` inside
`SeparableClosure K` has `[L : K] / #Aut_K(L)` members, in multiplied form. It is Tau Ceti's
`IntermediateField.ncard_isomorphic_mul_natCard_algEquiv_of_isSepClosed` with
`Ω = SeparableClosure K`. -/
theorem ncard_isomorphic_mul_natCard_algEquiv_eq_finrank (L : IntermediateField K (SeparableClosure K))
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
(`TauCeti.discriminantExponent_tower`, with `d(K_f/K) = 0`); Serre's Theorem 1 over `K_f` (the
mass formula roadmap's Layer 4), whose residue field has `q^f` elements, then gives the value. -/
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

/-- **The transitive mass by residue degree**, the Layer 2 milestone: the Galois sets of size
`f * e` with splitting symbol `{(f, e)}`, which are transitive, have mass `q^{-f(e-1)} / f`. The
proof is `tsum_isTransitive` followed by `tsum_inertiaDegree_eq`; Layer 3 assembles every other
splitting type from these. The symbol `{(f, e)}` forces one orbit, whose stabilizers' fixed field
has degree `f * e` and residue degree `f`, so `tsum_isTransitive` applies with `g` the weight
`q^{-d}` on such fields and `0` elsewhere, and `tsum_inertiaDegree_eq` evaluates the right side. -/
theorem etaleMass_isTransitive_splittingSymbol (f e : ℕ) (hf : 0 < f) (he : 0 < e) :
    ((f * e)! : ℝ≥0∞)⁻¹ *
        ∑' ρ : {ρ : GaloisSet K (f * e) // ρ.splittingSymbol = {(f, e)}},
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
theorem etaleMass_ramificationPartition (n k : ℕ) (π : k.Partition)
    (hπ : π.parts.card ≤ n - k) :
    (n ! : ℝ≥0∞)⁻¹ *
        ∑' ρ : {ρ : GaloisSet K n // ramificationPartition ρ.splittingSymbol = π.parts},
          1 / (Nat.card 𝓀[K] : ℝ≥0∞) ^ ρ.1.discriminantExponent =
      1 / (Nat.card 𝓀[K] : ℝ≥0∞) ^ k :=
  sorry

variable (K)

/-- **Bhargava's mass formula** ([Bhargava 2007, Thm. 1.1, Prop. 2.3, and the Appendix for an
arbitrary non-archimedean local field]): `M_n(K) = ∑_{k ≤ n} q(k, n − k) q^{-k}`, with `q(k, m)` the
number of partitions of `k` into at most `m` parts. The term `k = n` is `q(n, 0) = 0` for `n > 0`,
so this is Bhargava's `∑_{k<n}`, and at `n = 0` both sides are `1`. -/
theorem etaleMass_eq (n : ℕ) :
    etaleMass K n =
      ∑ k ∈ Finset.range (n + 1),
        (((Finset.univ : Finset k.Partition).filter fun π => π.parts.card ≤ n - k).card :
            ℝ≥0∞) / (Nat.card 𝓀[K] : ℝ≥0∞) ^ k :=
  sorry

/-! ## Layer 4: wreath products `S_m ≀ S_n` -/

/-- The **subgroup orbit weight**: `orbitDiscriminantExponent` for an action of a subgroup `H` of
`Gal(K^sep/K)`, the sum over the `H`-orbits of the discriminant exponent over `K` of the fixed field
of the stabilizer, read as a subgroup of `Gal(K^sep/K)`. -/
noncomputable def subgroupOrbitDiscriminantExponent
    (H : Subgroup (SeparableClosure K ≃ₐ[K] SeparableClosure K)) (X : Type*) [MulAction H X] : ℕ :=
  ∑ᶠ O : MulAction.orbitRel.Quotient H X,
    intermediateFieldDiscriminantExponent
      (IntermediateField.fixedField ((MulAction.stabilizer H (Quotient.out O : X)).map H.subtype))

variable {K}

/-- A **Galois set of size `m` over a subextension `L`**: a continuous action of
`Gal(K^sep/L) = L.fixingSubgroup` on `Fin m`. -/
noncomputable abbrev RelativeGaloisSet (L : IntermediateField K (SeparableClosure K)) (m : ℕ) :
    Type u :=
  {χ : L.fixingSubgroup →* Equiv.Perm (Fin m) // IsOpen (χ.ker : Set L.fixingSubgroup)}

/-- The weight over `K` of a Galois set over `L`: the subgroup orbit weight of its action. -/
noncomputable def RelativeGaloisSet.discriminantExponent
    {L : IntermediateField K (SeparableClosure K)} {m : ℕ} (χ : RelativeGaloisSet L m) : ℕ :=
  letI := MulAction.compHom (Fin m) χ.1
  subgroupOrbitDiscriminantExponent K L.fixingSubgroup (Fin m)

/-- **Bhargava's formula over a finite subextension**, read over `K`: for `L` finite over `K` with
residue degree `f`, the Galois sets of size `m` over `L` weighted by
`q^{-(d_K(χ) − m · d(L/K))} = q_L^{-d_L(χ)}` have mass `∑_{k ≤ m} q(k, m − k) q^{-f k}`. The proof
transports `Gal(K^sep/L)` to `Gal(L^sep/L)` through `IsSepClosure.equiv`, rewrites each orbit's
exponent by the tower law `d(M/K) = [M : L] d(L/K) + f · d(M/L)`, and applies `etaleMass_eq` over
`L`, whose residue field has `q^f` elements. -/
theorem tsum_relativeGaloisSet (L : IntermediateField K (SeparableClosure K))
    [FiniteDimensional K L] (m : ℕ) :
    (m ! : ℝ≥0∞)⁻¹ *
        ∑' χ : RelativeGaloisSet L m,
          1 / (Nat.card 𝓀[K] : ℝ≥0∞) ^
            (χ.discriminantExponent - m * intermediateFieldDiscriminantExponent L) =
      ∑ k ∈ Finset.range (m + 1),
        (((Finset.univ : Finset k.Partition).filter fun π => π.parts.card ≤ m - k).card :
            ℝ≥0∞) / (Nat.card 𝓀[K] : ℝ≥0∞) ^ (intermediateFieldInertiaDegree L * k) :=
  sorry

variable (K)

/-- A **wreath Galois set** for `S_m ≀ S_n`: a continuous action of `Gal(K^sep/K)` on
`Fin n × Fin m` that maps fibres of `Prod.fst` to fibres, as a homomorphism to
`Equiv.Perm (Fin n × Fin m)` with open kernel. Its image lies in the wreath product `S_m ≀ S_n`,
the stabilizer of the fibre partition. -/
noncomputable abbrev WreathGaloisSet (m n : ℕ) : Type u :=
  {ρ : (SeparableClosure K ≃ₐ[K] SeparableClosure K) →* Equiv.Perm (Fin n × Fin m) //
    IsOpen (ρ.ker : Set (SeparableClosure K ≃ₐ[K] SeparableClosure K)) ∧
      ∀ g x y, x.1 = y.1 → (ρ g x).1 = (ρ g y).1}

namespace WreathGaloisSet

variable {K} {m n : ℕ}

/-- The action of `Gal(K^sep/K)` on `Fin n × Fin m` that a wreath Galois set is. -/
noncomputable abbrev mulAction (ρ : WreathGaloisSet K m n) :
    MulAction (SeparableClosure K ≃ₐ[K] SeparableClosure K) (Fin n × Fin m) :=
  MulAction.compHom (Fin n × Fin m) ρ.1

/-- The **base action** on `Fin n`, the image of `ρ` in `S_n`: `g` sends `i` to the fibre that
contains the image of `(i, 0)`, hence of every point of the fibre over `i`. -/
@[instance_reducible]
noncomputable def baseMulAction [NeZero m] (ρ : WreathGaloisSet K m n) :
    MulAction (SeparableClosure K ≃ₐ[K] SeparableClosure K) (Fin n) where
  smul g i := ((ρ.1 g) (i, 0)).1
  one_smul i := by
    change ((ρ.1 1) (i, 0)).1 = i
    simp
  mul_smul g h i := by
    change ((ρ.1 (g * h)) (i, 0)).1 = ((ρ.1 g) (((ρ.1 h) (i, 0)).1, 0)).1
    rw [map_mul, Equiv.Perm.mul_apply]
    exact ρ.2.2 g _ _ rfl

/-- The **counting function** of [Wood 2008, (4)–(5)]: `c(ρ) = d(X) − (m − 1) · d(Y)` for the
action on `X = Fin n × Fin m` and its base `Y = Fin n`. Orbit by orbit of the base, with `L_i` the
fixed field of a base stabilizer and `M_i / L_i` the étale algebra of degree `m` on its fibre, it is
`∑ d(L_i/K) + f(L_i/K) · d(M_i/L_i)` by the tower law, so the truncated subtraction is exact. For
`m = 2` it is the Artin conductor of the signed permutation representation of `W(B_n)`
([Kedlaya 2007, Lemma 8.4]). -/
noncomputable def conductor [NeZero m] (ρ : WreathGaloisSet K m n) : ℕ :=
  (letI := ρ.mulAction
  orbitDiscriminantExponent K (Fin n × Fin m)) -
    (m - 1) * (letI := ρ.baseMulAction
    orbitDiscriminantExponent K (Fin n))

/-- A wreath Galois set is **base-transitive** when its base action is transitive. -/
def IsBaseTransitive [NeZero m] (ρ : WreathGaloisSet K m n) : Prop :=
  letI := ρ.baseMulAction
  MulAction.IsPretransitive (SeparableClosure K ≃ₐ[K] SeparableClosure K) (Fin n)

/-- **The fibre count** ([Wood 2008, Lemma 2.2], for a transitive base): over a transitive Galois
set `ρ₀` of size `n` with `L` the fixed field of the stabilizer of `0`, and a Galois set `χ` of size
`m` over `L`, the wreath Galois sets with base `ρ₀` acting on the fibre over `0` by `χ` number
`(m!)^(n−1)`: one choice of a labelling of each other fibre. -/
theorem natCard_base_fibre [NeZero m] (hn : 0 < n) (ρ₀ : GaloisSet K n) (hρ₀ : ρ₀.IsTransitive)
    (χ : RelativeGaloisSet (letI := ρ₀.mulAction
      IntermediateField.fixedField (MulAction.stabilizer
        (SeparableClosure K ≃ₐ[K] SeparableClosure K) (⟨0, hn⟩ : Fin n))) m) :
    Nat.card {ρ : WreathGaloisSet K m n //
      (∀ g i, ((ρ.1 g) (i, 0)).1 = ρ₀.1 g i) ∧
        ∀ h j, (ρ.1 h.1) (⟨0, hn⟩, j) = (⟨0, hn⟩, χ.1 h j)} = (m !) ^ (n - 1) :=
  sorry

end WreathGaloisSet

/-- **The wreath mass** `W_{m,n}(K) = (1 / ((m!)^n n!)) ∑_ρ q^{-c(ρ)}` over the wreath Galois sets,
in `ℝ≥0∞`: Kedlaya's total mass of `(K, S_m ≀ S_n)` ([Kedlaya 2007, Def. 2.2], which divides by
`|Γ|`; [Wood 2008] does not). -/
noncomputable def wreathMass (m n : ℕ) [NeZero m] : ℝ≥0∞ :=
  ((m ! : ℝ≥0∞) ^ n * n !)⁻¹ *
    ∑' ρ : WreathGaloisSet K m n, 1 / (Nat.card 𝓀[K] : ℝ≥0∞) ^ ρ.conductor

/-- The base-transitive part of the wreath mass. -/
noncomputable def wreathTransitiveMass (m n : ℕ) [NeZero m] : ℝ≥0∞ :=
  ((m ! : ℝ≥0∞) ^ n * n !)⁻¹ *
    ∑' ρ : {ρ : WreathGaloisSet K m n // ρ.IsBaseTransitive},
      1 / (Nat.card 𝓀[K] : ℝ≥0∞) ^ ρ.1.conductor

/-- **The wreath product over one point is the symmetric group**: `S_1 ≀ S_n = S_n`, so the wreath
mass for `m = 1` is the étale mass. -/
theorem wreathMass_one (n : ℕ) : wreathMass K 1 n = etaleMass K n :=
  sorry

/-- **The transitive wreath mass** ([Kedlaya 2007, (8.5.2)] for `m = 2`; [Wood 2008, (7)]): the
base-transitive part is `∑_{f ∣ n} (1/f) q^{-(n−f)} ∑_{k ≤ m} q(k, m − k) q^{-f k}`. Split the sum
by the base `ρ₀` and the fibre action `χ` over `L`, the fixed field of the base stabilizer
(`natCard_base_fibre`), where `c(ρ) = d(L/K) + (d_K(χ) − m · d(L/K))`; evaluate the `χ`-sum by
`tsum_relativeGaloisSet`, then the `ρ₀`-sum by `tsum_isTransitive` and `tsum_inertiaDegree_eq`. -/
theorem wreathTransitiveMass_eq (m n : ℕ) [NeZero m] (hn : 0 < n) :
    wreathTransitiveMass K m n =
      ∑ f ∈ n.divisors,
        1 / ((f : ℝ≥0∞) * (Nat.card 𝓀[K] : ℝ≥0∞) ^ (n - f)) *
          ∑ k ∈ Finset.range (m + 1),
            (((Finset.univ : Finset k.Partition).filter fun π => π.parts.card ≤ m - k).card :
                ℝ≥0∞) / (Nat.card 𝓀[K] : ℝ≥0∞) ^ (f * k) :=
  sorry

/-- **The orbit recursion** (the exponential formula, in recursion form): splitting off the base
orbit of `0`, of size `k`, gives `n · W_n = ∑_{k=1}^{n} k · T_k · W_{n−k}` with `T_k` the transitive
wreath mass. The counting function adds over base orbits. -/
theorem wreathMass_recursion (m n : ℕ) [NeZero m] :
    (n : ℝ≥0∞) * wreathMass K m n =
      ∑ k ∈ Finset.Icc 1 n, (k : ℝ≥0∞) * wreathTransitiveMass K m k * wreathMass K m (n - k) :=
  sorry

/-- **Kedlaya's mass formula for `W(B_n) = S_2 ≀ S_n`** ([Kedlaya 2007, Thm. 8.5 and
Remark 8.6]): `W_{2,n}(K) = ∑_{j ≤ n} M_j(K) · P(n − j) · q^{-(n−j)}`, with `P` the partition
function; equivalently `∑_n W_{2,n} xⁿ = ∏_i (1 − xⁱ q^{-i})⁻¹ (1 − xⁱ q^{1−i})⁻¹`. -/
theorem wreathMass_two (n : ℕ) :
    wreathMass K 2 n =
      ∑ j ∈ Finset.range (n + 1),
        etaleMass K j * (Fintype.card (n - j).Partition : ℝ≥0∞) /
          (Nat.card 𝓀[K] : ℝ≥0∞) ^ (n - j) :=
  sorry

/-- **Wood's mass formula for `S_m ≀ S_n`** ([Wood 2008, Thm. 1.1], for one wreath product of
symmetric groups): the wreath mass is a polynomial in `q^{-1}` with natural-number coefficients,
independent of the local field. -/
theorem exists_wreathMass_eq_aeval (m n : ℕ) [NeZero m] :
    ∃ P : Polynomial ℕ, ∀ (F : Type u) [Field F] [ValuativeRel F] [TopologicalSpace F]
      [IsNonarchimedeanLocalField F],
      wreathMass F m n = Polynomial.aeval ((Nat.card 𝓀[F] : ℝ≥0∞)⁻¹) P :=
  sorry

end TauCetiRoadmap.EtaleMassFormula
