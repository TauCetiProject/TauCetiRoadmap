import Mathlib

/-!
# Quantum enveloping algebras: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the definitions
needed to state them: the full-lattice Cartan datum, the Drinfeld–Jimbo presentation of QEA1 as a
`RingQuot` of a `FreeAlgebra` over an arbitrary field `K` with parameter `q`, and its coproduct
and counit as algebra maps. Stated here: the Hopf structure of QEA1 (coalgebra laws, then the
antipode with its generator values), the triangular decomposition, and the linear independence of
the full-`Y` torus.

Not statable at the pins:

* the comparison with the rank-one algebra of QuantumGroups Q8, whose carrier is a roadmap
  target, not a library declaration;
* the braid operators and root vectors of QEA2 and the integral PBW basis of QEA3, since the
  braid automorphisms are themselves constructions whose well-definedness is a theorem;
* the comparison with the full-`Y` Kostant form (QEA3), the odd-order Frobenius map (QEA5), the
  root-of-unity module theorems (QEA6) and the Frobenius contraction comparisons (QEA7), since
  the classical integral enveloping algebra of a root datum is a ReductiveGroups Layer 9A target
  and is absent from Mathlib;
* the modified algebra `dot U` and its even-order Frobenius map (QEA5), whose weight idempotents
  are projections on a category of weight modules not available at the pins.
-/

noncomputable section

open scoped TensorProduct

namespace TauCetiRoadmap.QuantumEnvelopingAlgebras

universe u v w

/-- A full-lattice finite-rank symmetrizable Cartan realization (QEA0): free lattices `X`, `Y`
with a perfect pairing, linearly independent simple roots and coroots, the generalized Cartan
matrix `aᵢⱼ = ⟨αⱼ, hᵢ⟩`, and a positive symmetrizer `dᵢ aᵢⱼ = dⱼ aⱼᵢ`. -/
structure CartanDatum (ι : Type u) (X : Type v) (Y : Type w)
    [Fintype ι] [DecidableEq ι] [AddCommGroup X] [AddCommGroup Y]
    [Module.Free ℤ X] [Module.Free ℤ Y] [Module.Finite ℤ X] [Module.Finite ℤ Y] where
  /-- The perfect pairing `X ≃ Hom(Y, ℤ)`. -/
  pairing : X ≃ₗ[ℤ] (Y →ₗ[ℤ] ℤ)
  /-- The simple roots `αᵢ ∈ X`. -/
  root : ι → X
  /-- The simple coroots `hᵢ ∈ Y`. -/
  coroot : ι → Y
  root_independent : LinearIndependent ℤ root
  coroot_independent : LinearIndependent ℤ coroot
  /-- The generalized Cartan matrix. -/
  cartan : ι → ι → ℤ
  cartan_eq : ∀ i j, cartan i j = pairing (root j) (coroot i)
  diagonal : ∀ i, cartan i i = 2
  offDiagonal : ∀ i j, i ≠ j → cartan i j ≤ 0
  zeroSymmetry : ∀ i j, cartan i j = 0 ↔ cartan j i = 0
  /-- The symmetrizer `dᵢ`. -/
  symmetrizer : ι → ℕ
  symmetrizer_pos : ∀ i, 0 < symmetrizer i
  symmetrizes : ∀ i j,
    (symmetrizer i : ℤ) * cartan i j = (symmetrizer j : ℤ) * cartan j i

namespace CartanDatum

variable {ι : Type u} {X : Type v} {Y : Type w}
  [Fintype ι] [DecidableEq ι] [AddCommGroup X] [AddCommGroup Y]
  [Module.Free ℤ X] [Module.Free ℤ Y] [Module.Finite ℤ X] [Module.Finite ℤ Y]
  (D : CartanDatum ι X Y)

/-- The pairing value `⟨αᵢ, y⟩`. -/
def pairingValue (i : ι) (y : Y) : ℤ := D.pairing (D.root i) y

/-- The toral direction `dᵢ hᵢ`, so that `Kᵢ = K_(dᵢ hᵢ)`. -/
def simpleTorus (i : ι) : Y := D.symmetrizer i • D.coroot i

end CartanDatum

/-- Generators of the free algebra: `Eᵢ`, `Fᵢ` and a toral symbol `K_y` for every `y ∈ Y`, so
that central and isogeny directions of `Y` are retained. -/
inductive Generator (ι : Type u) (Y : Type v)
  | E (i : ι)
  | F (i : ι)
  | K (y : Y)

section Presentation

variable {ι : Type u} {X : Type v} {Y : Type w} {K : Type*}
  [AddCommGroup X] [AddCommGroup Y] [Field K]
  [Module.Free ℤ X] [Module.Free ℤ Y] [Module.Finite ℤ X] [Module.Finite ℤ Y]
  [Fintype ι] [DecidableEq ι]
  (D : CartanDatum ι X Y) (q : K)

local notation "Free" => FreeAlgebra K (Generator ι Y)

/-- The symmetric quantum integer `[r]_q = (q^r − q^(−r))/(q − q⁻¹)`; the theorems below assume
`q` is not a root of unity, so the denominator is nonzero there. -/
def qInt (q : K) (r : ℕ) : K :=
  (q ^ r - (q ^ r)⁻¹) / (q - q⁻¹)

/-- The quantum factorial `[r]_q! = [1]_q ⋯ [r]_q`. -/
def qFactorial (q : K) (r : ℕ) : K :=
  ∏ j ∈ Finset.range r, qInt q (j + 1)

/-- The divided power `x^(r) = x^r / [r]_q!`. -/
def dividedPower (q : K) (x : Free) (r : ℕ) : Free :=
  (qFactorial q r)⁻¹ • x ^ r

/-- The generator `Eᵢ` of the free algebra. -/
def genE (i : ι) : Free := FreeAlgebra.ι K (.E i)
/-- The generator `Fᵢ` of the free algebra. -/
def genF (i : ι) : Free := FreeAlgebra.ι K (.F i)
/-- The toral generator `K_y` of the free algebra. -/
def genK (y : Y) : Free := FreeAlgebra.ι K (.K y)

/-- The toral generator `Kᵢ = K_(dᵢ hᵢ)` of the free algebra. -/
def simpleK (i : ι) : Free := genK (D.simpleTorus i)

/-- The Serre length `1 − aᵢⱼ`. -/
def serreLength (i j : ι) : ℕ := (1 - D.cartan i j).toNat

/-- The positive quantum Serre element `Σ_(r+s=1−aᵢⱼ) (−1)^r Eᵢ^(r) Eⱼ Eᵢ^(s)`, with divided
powers at `qᵢ = q^dᵢ`. -/
def serreE (i j : ι) : Free :=
  ∑ r ∈ Finset.range (serreLength D i j + 1),
    ((-1 : K) ^ r) •
      (dividedPower (q ^ D.symmetrizer i) (genE i) r *
        genE j *
        dividedPower (q ^ D.symmetrizer i) (genE i)
          (serreLength D i j - r))

/-- The negative quantum Serre element `Σ_(r+s=1−aᵢⱼ) (−1)^r Fᵢ^(r) Fⱼ Fᵢ^(s)`. -/
def serreF (i j : ι) : Free :=
  ∑ r ∈ Finset.range (serreLength D i j + 1),
    ((-1 : K) ^ r) •
      (dividedPower (q ^ D.symmetrizer i) (genF i) r *
        genF j *
        dividedPower (q ^ D.symmetrizer i) (genF i)
          (serreLength D i j - r))

/-- The defining relations of QEA1: the torus is the group algebra of `Y`, `K_y` conjugates
`Eᵢ` and `Fᵢ` by `q^(±⟨αᵢ, y⟩)`, `EᵢFⱼ − FⱼEᵢ = δᵢⱼ (Kᵢ − Kᵢ⁻¹)/(qᵢ − qᵢ⁻¹)`, and the quantum
Serre relations. -/
inductive Relation : Free → Free → Prop
  | torusUnit : Relation (genK 0) 1
  | torusMul (y z : Y) :
      Relation (genK y * genK z) (genK (y + z))
  | conjugateE (y : Y) (i : ι) :
      Relation
        (genK y * genE i * genK (-y))
        ((q ^ D.pairingValue i y) • genE i)
  | conjugateF (y : Y) (i : ι) :
      Relation
        (genK y * genF i * genK (-y))
        ((q ^ (-(D.pairingValue i y))) • genF i)
  | commutator (i j : ι) :
      Relation
        (genE i * genF j - genF j * genE i)
        (if i = j then
          (q ^ D.symmetrizer i - (q ^ D.symmetrizer i)⁻¹)⁻¹ •
            (simpleK D i - genK (-(D.simpleTorus i)))
        else 0)
  | serrePositive (i j : ι) (hij : i ≠ j) :
      Relation (serreE D q i j) 0
  | serreNegative (i j : ι) (hij : i ≠ j) :
      Relation (serreF D q i j) 0

/-- The quantized enveloping algebra `U_q(A, X, Y)` of QEA1, as a `RingQuot` of the free
algebra. -/
abbrev U := RingQuot (Relation D q)

/-- The image in `U` of a generator of the free algebra. -/
def generator (g : Generator ι Y) : U D q :=
  RingQuot.mkAlgHom K (Relation D q) (FreeAlgebra.ι K g)

/-- The generator `Eᵢ` of `U`. -/
def E (i : ι) : U D q := generator D q (.E i)
/-- The generator `Fᵢ` of `U`. -/
def F (i : ι) : U D q := generator D q (.F i)
/-- The toral generator `K_y` of `U`. -/
def Ktorus (y : Y) : U D q := generator D q (.K y)
/-- `Kᵢ = K_(dᵢ hᵢ)`. -/
def Ki (i : ι) : U D q := Ktorus D q (D.simpleTorus i)
/-- `Kᵢ⁻¹ = K_(−dᵢ hᵢ)`. -/
def KiInv (i : ι) : U D q := Ktorus D q (-(D.simpleTorus i))

/-- The algebra map out of `U` determined by images of the generators satisfying the
relations (the universal property of the presentation). -/
def lift {B : Type*} [Ring B] [Algebra K B]
    (f : Generator ι Y → B)
    (hrel : ∀ a b, Relation D q a b →
      (FreeAlgebra.lift K f) a = (FreeAlgebra.lift K f) b) :
    U D q →ₐ[K] B :=
  RingQuot.liftAlgHom K ⟨FreeAlgebra.lift K f, fun {_ _} h => hrel _ _ h⟩

/-- The coproduct on generators, in the convention of QuantumGroups Q8:
`Δ(Eᵢ) = Eᵢ ⊗ 1 + Kᵢ ⊗ Eᵢ`, `Δ(Fᵢ) = Fᵢ ⊗ Kᵢ⁻¹ + 1 ⊗ Fᵢ`, `Δ(K_y) = K_y ⊗ K_y`. -/
def comulGenerator : Generator ι Y → U D q ⊗[K] U D q
  | .E i => E D q i ⊗ₜ[K] (1 : U D q) + Ki D q i ⊗ₜ[K] E D q i
  | .F i => F D q i ⊗ₜ[K] KiInv D q i + (1 : U D q) ⊗ₜ[K] F D q i
  | .K y => Ktorus D q y ⊗ₜ[K] Ktorus D q y

/-- The coproduct images satisfy every defining relation, for `q` not a root of unity. -/
theorem comul_relations (hq : q ≠ 0)
    (hfac : ∀ i n, qFactorial (q ^ D.symmetrizer i) n ≠ 0)
    (a b : Free) (h : Relation D q a b) :
    (FreeAlgebra.lift K (comulGenerator D q)) a =
      (FreeAlgebra.lift K (comulGenerator D q)) b := by
  sorry

/-- The coproduct `Δ : U → U ⊗ U` as an algebra map. -/
def comulAlgHom (hq : q ≠ 0)
    (hfac : ∀ i n, qFactorial (q ^ D.symmetrizer i) n ≠ 0) :
    U D q →ₐ[K] U D q ⊗[K] U D q :=
  lift D q (comulGenerator D q) (comul_relations D q hq hfac)

/-- The counit on generators: `ε(Eᵢ) = ε(Fᵢ) = 0`, `ε(K_y) = 1`. -/
def counitGenerator : Generator ι Y → K
  | .E _ => 0
  | .F _ => 0
  | .K _ => 1

/-- The counit values satisfy every defining relation. -/
theorem counit_relations (a b : Free) (h : Relation D q a b) :
    (FreeAlgebra.lift K (counitGenerator (K := K) (ι := ι) (Y := Y))) a =
      (FreeAlgebra.lift K (counitGenerator (K := K) (ι := ι) (Y := Y))) b := by
  sorry

/-- The counit `ε : U → K` as an algebra map. -/
def counitAlgHom : U D q →ₐ[K] K :=
  lift D q counitGenerator (counit_relations D q)

/-! ## Layer QEA1: Hopf structure, triangular decomposition, torus -/

/-- Coassociativity of the QEA1 coproduct (QEA1). -/
theorem comul_coassoc (hq : q ≠ 0)
    (hfac : ∀ i n, qFactorial (q ^ D.symmetrizer i) n ≠ 0) :
    (Algebra.TensorProduct.assoc K K K (U D q) (U D q) (U D q)).toAlgHom.comp
        ((Algebra.TensorProduct.map (comulAlgHom D q hq hfac) (.id K (U D q))).comp
          (comulAlgHom D q hq hfac)) =
      (Algebra.TensorProduct.map (.id K (U D q)) (comulAlgHom D q hq hfac)).comp
        (comulAlgHom D q hq hfac) := by
  sorry

/-- The left counit law `(ε ⊗ id) ∘ Δ = id` (QEA1). -/
theorem counit_comul_left (hq : q ≠ 0)
    (hfac : ∀ i n, qFactorial (q ^ D.symmetrizer i) n ≠ 0) :
    (Algebra.TensorProduct.map (counitAlgHom D q) (.id K (U D q))).comp
        (comulAlgHom D q hq hfac) =
      ((Algebra.TensorProduct.lid K (U D q)).symm : U D q →ₐ[K] K ⊗[K] U D q) := by
  sorry

/-- The right counit law `(id ⊗ ε) ∘ Δ = id` (QEA1). -/
theorem counit_comul_right (hq : q ≠ 0)
    (hfac : ∀ i n, qFactorial (q ^ D.symmetrizer i) n ≠ 0) :
    (Algebra.TensorProduct.map (.id K (U D q)) (counitAlgHom D q)).comp
        (comulAlgHom D q hq hfac) =
      ((Algebra.TensorProduct.rid K K (U D q)).symm : U D q →ₐ[K] U D q ⊗[K] K) := by
  sorry

/-- The native Mathlib bialgebra structure on `U` with the QEA1 coproduct and counit. -/
abbrev bialgebra (hq : q ≠ 0)
    (hfac : ∀ i n, qFactorial (q ^ D.symmetrizer i) n ≠ 0) :
    Bialgebra K (U D q) :=
  Bialgebra.ofAlgHom (comulAlgHom D q hq hfac) (counitAlgHom D q)
    (comul_coassoc D q hq hfac) (counit_comul_left D q hq hfac)
    (counit_comul_right D q hq hfac)

/-- The bialgebra `U` has an antipode, i.e. it is a Hopf algebra (QEA1): a linear map `S` that
is a convolution inverse of the identity on both sides, is bijective, and takes the values
`S(Eᵢ) = −Kᵢ⁻¹Eᵢ`, `S(Fᵢ) = −FᵢKᵢ`, `S(K_y) = K_(−y)`. -/
theorem exists_antipode (hq : q ≠ 0)
    (hfac : ∀ i n, qFactorial (q ^ D.symmetrizer i) n ≠ 0) :
    letI := bialgebra D q hq hfac
    ∃ S : U D q →ₗ[K] U D q,
      LinearMap.mul' K (U D q) ∘ₗ S.rTensor (U D q) ∘ₗ Coalgebra.comul =
          Algebra.linearMap K (U D q) ∘ₗ Coalgebra.counit ∧
        LinearMap.mul' K (U D q) ∘ₗ S.lTensor (U D q) ∘ₗ Coalgebra.comul =
          Algebra.linearMap K (U D q) ∘ₗ Coalgebra.counit ∧
        Function.Bijective S ∧
        (∀ i, S (E D q i) = -(KiInv D q i * E D q i)) ∧
        (∀ i, S (F D q i) = -(F D q i * Ki D q i)) ∧
        ∀ y, S (Ktorus D q y) = Ktorus D q (-y) := by
  sorry

/-- Triangular decomposition (QEA1): multiplication `U⁻ ⊗ U⁰ ⊗ U⁺ → U` is a linear
isomorphism, where `U⁻`, `U⁰`, `U⁺` are the subalgebras generated by the `Fᵢ`, by the `K_y`, and
by the `Eᵢ`. -/
theorem triangular_bijective (hq : q ≠ 0)
    (hfac : ∀ i n, qFactorial (q ^ D.symmetrizer i) n ≠ 0) :
    Function.Bijective
      (LinearMap.mul' K (U D q) ∘ₗ
        TensorProduct.map (Algebra.adjoin K (Set.range (F D q))).val.toLinearMap
          (LinearMap.mul' K (U D q) ∘ₗ
            TensorProduct.map (Algebra.adjoin K (Set.range (Ktorus D q))).val.toLinearMap
              (Algebra.adjoin K (Set.range (E D q))).val.toLinearMap)) := by
  sorry

/-- The full-`Y` torus is the group algebra of `Y` (QEA1): the `K_y`, `y ∈ Y`, are linearly
independent in `U`; no central direction of `Y` is collapsed. -/
theorem Ktorus_linearIndependent (hq : q ≠ 0)
    (hfac : ∀ i n, qFactorial (q ^ D.symmetrizer i) n ≠ 0) :
    LinearIndependent K (Ktorus D q) := by
  sorry

end Presentation

end TauCetiRoadmap.QuantumEnvelopingAlgebras
