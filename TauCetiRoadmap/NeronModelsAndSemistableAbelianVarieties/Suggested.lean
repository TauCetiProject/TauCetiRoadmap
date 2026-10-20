import Mathlib
import TauCeti.AlgebraicGeometry.AbelianVariety.Basic
import TauCeti.AlgebraicGeometry.EllipticCurve.Scheme.ProjModel

/-!
# Néron models and semistable abelian varieties: representative target signatures

The mathematical roadmap is `README.md`. This file records suggested forms, not an exhaustive
checklist: definitions and theorem signatures statable against the pinned Mathlib and Tau Ceti
APIs. The README specifies every target in each layer.

The file makes the following design choices explicit.

* The Néron mapping property is a predicate on an object of `Over S` relative to a fixed morphism
  `j : η ⟶ S`, quantified over **all** smooth test objects of `Over S`; the restriction map is the
  action of Mathlib's `Over.pullback j` on morphisms. Testing only étale objects is the weak-model
  condition, which is a separate structure.
* A Néron model is *marked*: the isomorphism of its generic fibre with the given variety is data,
  and every uniqueness statement is a statement about marked models.
* Finite type is enforced by `QuasiCompact` on top of `Smooth` (which already gives locally finite
  presentation); an lft model satisfies this finite-type convention exactly when it is quasi-compact.
* The lattice-level part of the monodromy theory (the integral pairing, its cokernel and
  cycle lattice of a dual multigraph) is stated over `ℤ` with no geometric carrier, so that the
  arithmetic computations of the roadmap's checks are already meaningful.
* README §4.2 uses GraphConnectivityAndFlows §§1.3 and 8.1 for incidence and signed circulations;
  §1.1 supplies component counts. The spanning-forest cycle bases, binary cycle space, rank
  formulas and integral/F₂ coefficient comparison are local targets, used by the character-lattice
  realization and monodromy pairing.
* The intersection-matrix comparison of the component group of a Jacobian uses Tau
  Ceti's numerical Picard group `TauCeti.NumericalType.Pic` and its degree map, which are pinned
  and not redefined.
-/

namespace TauCetiRoadmap.NeronModelsAndSemistableAbelianVarieties

open CategoryTheory CategoryTheory.Limits AlgebraicGeometry

universe u

attribute [local instance] Over.cartesianMonoidalCategory

/-! ## Headline theorems -/

/-- Every abelian variety over the fraction field of any DVR has a marked smooth separated
finite-type model with unique extension from every smooth test scheme
(Bosch–Lütkebohmert–Raynaud, §1.3 Corollary 2, p. 17). -/
theorem LocalExistence (R K : Type u) [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] [Field K] [Algebra R K] [IsFractionRing R K]
    (A : TauCeti.AlgebraicGeometry.AbelianVariety K) :
    ∃ X : Over (Spec (.of R)),
      Nonempty ((Over.pullback (Spec.map (CommRingCat.ofHom (algebraMap R K)))).obj X ≅
        A.toOver) ∧
      Smooth X.hom ∧ IsSeparated X.hom ∧ QuasiCompact X.hom ∧
      ∀ Y : Over (Spec (.of R)), Smooth Y.hom →
        Function.Bijective (fun f : Y ⟶ X =>
          (Over.pullback (Spec.map (CommRingCat.ofHom (algebraMap R K)))).map f) := by
  sorry

/-- A minimal elliptic equation has good reduction exactly when its projective integral model
is smooth, and exactly when its generic fibre admits an abelian-scheme model over the DVR
(Bosch–Lütkebohmert–Raynaud, §1.5, pp. 20–23). -/
theorem EquationGoodComparison (R K : Type u) [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] [Field K] [Algebra R K] [IsFractionRing R K]
    (W : WeierstrassCurve K) [W.IsElliptic] [WeierstrassCurve.IsMinimal R W] :
    (W.HasGoodReduction R ↔ Smooth (W.integralModel R).projModelOver) ∧
    (W.HasGoodReduction R ↔ ∃ X : Over (Spec (.of R)),
      Smooth X.hom ∧ IsProper X.hom ∧ GeometricallyConnected X.hom ∧
      Nonempty (GrpObj X) ∧
      Nonempty ((Over.pullback (Spec.map (CommRingCat.ofHom (algebraMap R K)))).obj X ≅
        Over.mk W.projModelOver)) := by
  sorry

/-! ## Layer 1: Néron models and their uniqueness -/

section Models

variable {S η : Scheme.{u}} (j : η ⟶ S)

/-- The Néron mapping property of `X` over `S` relative to `j : η ⟶ S`: for every smooth `Y` over
`S` the generic restriction `Hom_S(Y, X) → Hom_η(Y_η, X_η)` is bijective
(Bosch–Lütkebohmert–Raynaud, §1.2 Definition 1). -/
def NeronMappingProperty (X : Over S) : Prop :=
  ∀ Y : Over S, Smooth Y.hom →
    Function.Bijective (fun f : Y ⟶ X => (Over.pullback j).map f)

namespace NeronMappingProperty

variable {j} {X Y : Over S}

/-- Morphisms from a permitted test object are equal when their generic restrictions agree. -/
theorem hom_ext (h : NeronMappingProperty j X) (hY : Smooth Y.hom)
    (f g : Y ⟶ X) (e : (Over.pullback j).map f = (Over.pullback j).map g) :
    f = g := by sorry

/-- The mapping property is equivalent to unique extension for every smooth test object. -/
theorem iff_existsUnique : NeronMappingProperty j X ↔
    ∀ Y : Over S, Smooth Y.hom →
      ∀ f : (Over.pullback j).obj Y ⟶ (Over.pullback j).obj X,
        ∃! g : Y ⟶ X, (Over.pullback j).map g = f := by sorry

end NeronMappingProperty

/-- A marked finite-type Néron model of `A` over `η`: a smooth, separated, quasi-compact object of
`Over S` with the Néron mapping property and a chosen isomorphism of its generic fibre with `A`.
Smoothness gives locally finite presentation; quasi-compactness enforces finite type
(Bosch–Lütkebohmert–Raynaud, §1.2 Definition 1 and Proposition 2). -/
structure NeronModel (A : Over η) where
  /-- The model, an object of `Over S`. -/
  model : Over S
  /-- The marking: the generic fibre of the model is `A`. -/
  genericIso : (Over.pullback j).obj model ≅ A
  smooth : Smooth model.hom
  separated : IsSeparated model.hom
  quasiCompact : QuasiCompact model.hom
  mapping : NeronMappingProperty j model

namespace NeronModel

variable {j} {A : Over η} (M : NeronModel j A)

/-- Morphisms from a permitted test object are equal when their generic restrictions agree. -/
theorem hom_ext (Y : Over S) (hY : Smooth Y.hom) (f g : Y ⟶ M.model)
    (e : (Over.pullback j).map f ≫ M.genericIso.hom =
      (Over.pullback j).map g ≫ M.genericIso.hom) : f = g := by sorry

/-- A map to the marked generic object extends uniquely from any smooth test object. -/
theorem extension_existsUnique (Y : Over S) (hY : Smooth Y.hom)
    (f : (Over.pullback j).obj Y ⟶ A) :
    ∃! g : Y ⟶ M.model, (Over.pullback j).map g ≫ M.genericIso.hom = f := by sorry

/-- Uniqueness of marked Néron models: between two marked models of the same `A` there is exactly
one isomorphism compatible with the markings (Bosch–Lütkebohmert–Raynaud, §1.2 Proposition 2(a)). -/
theorem unique_iso (N : NeronModel j A) :
    ∃! e : M.model ≅ N.model,
      (Over.pullback j).map e.hom ≫ N.genericIso.hom = M.genericIso.hom := by sorry

/-- A marked model of a commutative generic group carries exactly one commutative group
structure for which its marking is a homomorphism
(Bosch–Lütkebohmert–Raynaud, §1.2 Proposition 6, p. 14). -/
theorem GroupLaw [GrpObj A] [IsCommMonObj A] :
    ∃! g : GrpObj M.model,
      letI := g
      letI : GrpObj ((Over.pullback j).obj M.model) := Functor.grpObjObj
      IsCommMonObj M.model ∧ IsMonHom M.genericIso.hom := by sorry

end NeronModel

/-- A marked weak Néron model: the same carrier, but the extension property is only required for
étale test objects. Weak models need not be unique (Bosch–Lütkebohmert–Raynaud, §1.2
Definition 1 and §1.3). -/
structure WeakNeronModel (A : Over η) where
  model : Over S
  genericIso : (Over.pullback j).obj model ≅ A
  smooth : Smooth model.hom
  separated : IsSeparated model.hom
  quasiCompact : QuasiCompact model.hom
  mapping : ∀ Y : Over S, Etale Y.hom →
    Function.Bijective (fun f : Y ⟶ model => (Over.pullback j).map f)

namespace WeakNeronModel

variable {j} {A : Over η} (W : WeakNeronModel j A)

/-- A generic morphism from a permitted test object has exactly one extension. -/
theorem existsUnique (Y : Over S) (hY : Etale Y.hom)
    (f : (Over.pullback j).obj Y ⟶ A) :
    ∃! g : Y ⟶ W.model, (Over.pullback j).map g ≫ W.genericIso.hom = f := by sorry

/-- A Néron model is in particular a weak Néron model. -/
noncomputable def ofNeronModel (M : NeronModel j A) : WeakNeronModel j A where
  model := M.model
  genericIso := M.genericIso
  smooth := M.smooth
  separated := M.separated
  quasiCompact := M.quasiCompact
  mapping := fun Y hY => by
    have : Etale Y.hom := hY
    exact M.mapping Y inferInstance

end WeakNeronModel

/-- The full smooth-test mapping property is preserved by étale base change
(Bosch–Lütkebohmert–Raynaud, §1.2 Proposition 2(c), p. 13). -/
theorem EtaleBasechange {S' : Scheme.{u}} (f : S' ⟶ S) (hf : Etale f)
    (X : Over S) (hX : NeronMappingProperty j X) :
    NeronMappingProperty (pullback.snd j f) ((Over.pullback f).obj X) := by sorry

end Models

/-! ## Layer 2: special fibres and component groups -/

namespace ComponentGroup

/-- The rational component group of a nonsplit multiplicative elliptic curve over a finite residue
field is the fixed subgroup of `−1` on the geometric group `ℤ/n`: it has order `2` for even `n` and
order `1` for odd `n`, which differs from `n` exactly when `n ≥ 3` (Tate, §6). This is the
group-theoretic core of that computation. -/
theorem card_fixedPoints_neg (n : ℕ) (hn : 0 < n) :
    Nat.card {x : ZMod n // -x = x} = if Even n then 2 else 1 := by sorry

end ComponentGroup

/-! ## Layer 3: semistable reduction and uniformisation -/

namespace RamifiedTate

/-- The canonical map of geometric component groups of a split Tate curve under a base change of
ramification index `e`: on `ℤ/n → ℤ/(e·n)` it is multiplication by `e` (Conrad, Example 4.6). -/
noncomputable def componentMap (n e : ℕ) : ZMod n →+ ZMod (e * n) :=
  ZMod.lift n ⟨zmultiplesHom _ (e : ZMod (e * n)), by
    change (n : ℤ) • (e : ZMod (e * n)) = 0
    simpa only [Nat.cast_mul, Int.cast_natCast, zsmul_eq_mul, mul_comm] using ZMod.natCast_self (e * n)⟩

/-- Ramified Tate base change sends the residue class of `r` to that of `e*r`. -/
theorem componentMap_apply (n e : ℕ) (r : ℤ) :
    componentMap n e (r : ZMod n) = ((e * r : ℤ) : ZMod (e * n)) := by sorry

/-- Positive ramification index makes the Tate component map injective, including `n = 0` algebraically. -/
theorem componentMap_injective (n e : ℕ) (he : 0 < e) :
    Function.Injective (componentMap n e) := by sorry

/-- Nontrivial ramification strictly enlarges the split Tate component group
(Conrad, Example 4.6; README §3.4). -/
theorem componentMap_not_surjective (n e : ℕ) (hn : 0 < n) (he : 1 < e) :
    ¬ Function.Surjective (componentMap n e) := by sorry

end RamifiedTate

/-! `RamifiedTateCounterexample` in README 3.4 supplies the split valuation-to-component
comparison over any complete DVR, using 2.7 and StableReduction Layer 5's smooth-locus
model. Identity sections are unit classes and the constant component group is `ℤ/ord(q)`;
this comparison carries no perfect-residue-field hypothesis. The geometric case
`R = 𝔽_p(s)[[t]]`, `q = t²`, `e = 2` uses the component map above. -/

namespace TateMonodromy

/-- In the ordered toric/period basis, the positive valuation form `[n]` gives
`N(a,b) = (n*b,0)` for the Kummer direction `σ(root)/root`
(Raynaud 1994, §4.6 equation (7) and Proposition 4.6.1).
The arithmetic operator is separate from its geometric comparison. -/
def operator (n : ℕ) : (ℤ × ℤ) →ₗ[ℤ] (ℤ × ℤ) where
  toFun v := (n * v.2, 0)
  map_add' := by intros; ext <;> simp [mul_add]
  map_smul' := by intros; ext <;> simp [mul_left_comm]

/-- The image is toric and the operator kills the toric term. -/
theorem operator_square_zero (n : ℕ) : (operator n).comp (operator n) = 0 := by sorry

/-- The positive period projection in the ordered toric/period basis of a Tate motive
(Raynaud 1994, §3.1, p. 299). -/
def periodProjection : (ℤ × ℤ) →ₗ[ℤ] ℤ where
  toFun v := v.2
  map_add' := by intros; rfl
  map_smul' := by intros; rfl

/-- The alternating Weil form in the toric/period basis, with toric vector first.
This is the coordinate witness for the duality comparison in README 4.3. -/
def weilForm (v w : ℤ × ℤ) : ℤ := v.1 * w.2 - v.2 * w.1

/-- The Weil quotient evaluates against the dual toric vector in the second argument. -/
def weilQuotient : (ℤ × ℤ) →ₗ[ℤ] ℤ where
  toFun v := weilForm v (1, 0)
  map_add' := by intros; simp [weilForm, add_comm]
  map_smul' := by intros; simp [weilForm]

/-- The Weil quotient is the negative of the positive period quotient. -/
theorem weilQuotient_eq_neg_periodProjection : weilQuotient = -periodProjection := by sorry

/-- In Weil coordinates the same positive Kummer operator has coefficient `-n`. -/
theorem operator_eq_weil_coordinates (n : ℕ) (v : ℤ × ℤ) :
    operator n v = (-(n : ℤ) * weilQuotient v, 0) := by sorry

end TateMonodromy

/-! ## Layer 4: Picard schemes of semistable curves, character lattices and monodromy -/

namespace DualGraph

variable {V E : Type*}

/-- Signed incidence on the dual multigraph in its actual edge coordinates.
Under the dart-doubling and positive-dart reindexing of README 4.2, this is
FreeGroupsAndLimitGroups §2.2a's `SerreGraph.integralCycleBoundary`.
It also identifies with GraphConnectivityAndFlows §1.3's incoming-minus-outgoing
`excessAt` through the endpoint-indexed assignment/Finsupp equivalence.
README label: boundary. Hatcher, §2.2, pp. 140–141 fixes the incidence sign. -/
noncomputable def boundary (src tgt : E → V) : (E →₀ ℤ) →ₗ[ℤ] (V →₀ ℤ) :=
  Finsupp.linearCombination ℤ fun e => Finsupp.single (tgt e) 1 - Finsupp.single (src e) 1

/-- The dual graph's integral cycle lattice in its actual edge coordinates.
Under the reindexing of README 4.2, this is FreeGroupsAndLimitGroups §2.2a's
`SerreGraph.cycleLattice`. The identification with GraphConnectivityAndFlows §8.1's
`signedCirculations Q ℤ` supplies its additive circulation interpretation.
This carrier supports `CharactersGraphHomology` and the monodromy pairing.
README labels: cycle-lattice, integral-graph-adapter. -/
noncomputable def cycleLattice (src tgt : E → V) : Submodule ℤ (E →₀ ℤ) :=
  LinearMap.ker (boundary src tgt)

variable [Fintype V] [Fintype E] [DecidableEq V] [DecidableEq E]

/-- The edge-length form `(c, d) ↦ ∑_e ℓ(e) c_e d_e` on `ℤ^E`; with all lengths `1` it is the
monodromy pairing of the Jacobian of a regular semistable curve (SGA 7 I, Exposé IX, 12.5). -/
noncomputable def edgeForm (len : E → ℕ) : (E →₀ ℤ) →ₗ[ℤ] (E →₀ ℤ) →ₗ[ℤ] ℤ :=
  LinearMap.mk₂ ℤ (fun c d => ∑ e, (len e : ℤ) * c e * d e)
    (by intros; simp [mul_add, add_mul, Finset.sum_add_distrib])
    (by intros; simp [Finset.mul_sum, mul_assoc, mul_left_comm])
    (by intros; simp [mul_add, Finset.sum_add_distrib])
    (by intros; simp [Finset.mul_sum, mul_assoc, mul_left_comm])

/-- The weighted edge form is symmetric on the edge module. -/
theorem edgeForm_symm (len : E → ℕ) (c d : E →₀ ℤ) :
    edgeForm len c d = edgeForm len d c := by sorry

/-- Reversing the orientation of an edge negates the corresponding coordinate and preserves the
form: the cycle lattice and the pairing do not depend on the chosen orientation. -/
theorem edgeForm_neg_coord (len : E → ℕ) (e₀ : E) (c d : E →₀ ℤ) :
    edgeForm len (c - 2 • Finsupp.single e₀ (c e₀)) (d - 2 • Finsupp.single e₀ (d e₀)) =
      edgeForm len c d := by sorry

end DualGraph

/-- A graph with retained edge identities, two endpoint maps and positive integral thicknesses.
Its ordinary cycle lattice is distinct from the cycle lattice of its bipartite double
(README §4.2). -/
structure WeightedGraph (V E : Type*) where
  src : E → V
  tgt : E → V
  thickness : E → ℕ+

namespace WeightedGraph

variable {V E : Type*}

/-- The bipartite graph on two disjoint copies of the vertex set, retaining every edge and
its thickness. It has its own cycle lattice (README §4.2). -/
def bipartiteDouble (G : WeightedGraph V E) : WeightedGraph (V ⊕ V) E where
  src := Sum.inl ∘ G.src
  tgt := Sum.inr ∘ G.tgt
  thickness := G.thickness

variable [Fintype V] [Fintype E] [DecidableEq V] [DecidableEq E]

/-- Integral cycles of the ordinary weighted graph, with signed incidence `target - source`.
The weights enter the Gram form rather than the incidence map (README §4.2). -/
noncomputable def H1 (G : WeightedGraph V E) : Submodule ℤ (E →₀ ℤ) :=
  DualGraph.cycleLattice G.src G.tgt

/-- Cycles in the bipartite double have separately vanishing endpoint pushforwards.
This joint kernel need not be the ordinary cycle lattice (README §4.2). -/
theorem mem_bipartiteDouble_H1 (G : WeightedGraph V E) (c : E →₀ ℤ) :
    c ∈ G.bipartiteDouble.H1 ↔
      Finsupp.lmapDomain ℤ ℤ G.src c = 0 ∧ Finsupp.lmapDomain ℤ ℤ G.tgt c = 0 := by
  sorry

/-- Positive thicknesses give the integral edge pairing on the cycle lattice
(SGA 7 I, Exposé IX, §§12.4–12.5; README §4.4). -/
noncomputable def gram (G : WeightedGraph V E) : G.H1 →ₗ[ℤ] Module.Dual ℤ G.H1 :=
  (DualGraph.edgeForm (fun e => (G.thickness e : ℕ))).domRestrict₁₂ G.H1 G.H1

/-- The discriminant group of the weighted cycle lattice (README §§4.2, 4.5). -/
abbrev componentGroup (G : WeightedGraph V E) :=
  Module.Dual ℤ G.H1 ⧸ LinearMap.range G.gram

/-- A nonzero integral cycle has strictly positive weighted self-pairing. -/
theorem gram_positive (G : WeightedGraph V E) (c : G.H1) (hc : c ≠ 0) :
    0 < G.gram c c := by sorry

/-- Positive thicknesses make the integral Gram map injective. -/
theorem gram_injective (G : WeightedGraph V E) : Function.Injective G.gram := by sorry

/-- The positive weighted cycle form has finite integral discriminant group, including
empty and disconnected graphs (README §4.2). -/
theorem componentGroup_finite (G : WeightedGraph V E) : Finite G.componentGroup := by sorry

/-- For adjoint cycle maps the dual of the reverse map preserves the Gram images, giving
covariant functoriality of the discriminant groups (README §4.2). -/
theorem gram_adjoint_range {W F : Type*}
    [Fintype W] [Fintype F] [DecidableEq W] [DecidableEq F]
    (G : WeightedGraph V E) (H : WeightedGraph W F)
    (a : G.H1 →ₗ[ℤ] H.H1) (b : H.H1 →ₗ[ℤ] G.H1)
    (hadj : ∀ x y, H.gram (a x) y = G.gram x (b y)) :
    (LinearMap.range G.gram).map b.dualMap ≤ LinearMap.range H.gram := by sorry

/-- A loop is a nonzero ordinary cycle, whereas its bipartite double is a single edge
between distinct vertices and does not contain that cycle (README §4.2). -/
theorem bipartiteDouble_single_loop (n : ℕ+) :
    let G : WeightedGraph Unit Unit := ⟨fun _ => (), fun _ => (), fun _ => n⟩
    Finsupp.single () (1 : ℤ) ∈ G.H1 ∧
      Finsupp.single () (1 : ℤ) ∉ G.bipartiteDouble.H1 := by sorry

end WeightedGraph

namespace LatticePairing

variable {X Y : Type*} [AddCommGroup X] [AddCommGroup Y] [Module ℤ X] [Module ℤ Y]

/-- The adjoint `u♯ : Y → Hom(X, ℤ)` of an integral pairing `u : Y × X → ℤ`. Here `Y = X_{A^∨}` and `X = X_A`. -/
def adjoint (u : Y →ₗ[ℤ] X →ₗ[ℤ] ℤ) : Y →ₗ[ℤ] Module.Dual ℤ X := u

/-- The component group attached to an integral pairing: the cokernel of its adjoint. For the
monodromy pairing of a semistable abelian variety over a henselian discrete valuation ring this is
the geometric component group of the Néron model (SGA 7 I, Exposé IX, Theorem 11.5). -/
abbrev componentGroup (u : Y →ₗ[ℤ] X →ₗ[ℤ] ℤ) :=
  Module.Dual ℤ X ⧸ LinearMap.range (adjoint u)

variable [Module.Free ℤ X] [Module.Finite ℤ X] [Module.Free ℤ Y] [Module.Finite ℤ Y]

/-- The rank-one pairing `(y, x) ↦ n·x·y` on `ℤ × ℤ`. -/
noncomputable def rankOne (n : ℕ) : ℤ →ₗ[ℤ] ℤ →ₗ[ℤ] ℤ := (n : ℤ) • LinearMap.mul ℤ ℤ

/-- An injective integral pairing with finite cokernel induces a perfect pairing of its two
cokernels; its value is the positive rational inverse pairing modulo integers
(SGA 7 I, Exposé IX, §11.4 and Theorem 11.5, pp. 454–455). -/
theorem exists_discriminantPairing (u : Y →ₗ[ℤ] X →ₗ[ℤ] ℤ)
    (hinj : Function.Injective (adjoint u)) (hfin : Finite (componentGroup u)) :
    ∃ p : componentGroup u →+ (componentGroup u.flip →+ AddCircle (1 : ℚ)),
      (∀ (a : Module.Dual ℤ X) (b : Module.Dual ℤ Y) (y : Y) (m : ℤ),
        m ≠ 0 → adjoint u y = m • a →
        p (Submodule.Quotient.mk a) (Submodule.Quotient.mk b) =
          ((b y : ℚ) / m : ℚ)) ∧
      Function.Bijective p ∧ Function.Bijective (AddMonoidHom.flip p) := by sorry

/-- The perfect positive inverse pairing between the two integral cokernels, without a symmetry
assumption on the original pairing (SGA 7 I, Exposé IX, §11.4). -/
noncomputable def discriminantPairing (u : Y →ₗ[ℤ] X →ₗ[ℤ] ℤ)
    (hinj : Function.Injective (adjoint u)) (hfin : Finite (componentGroup u)) :
    componentGroup u →+ (componentGroup u.flip →+ AddCircle (1 : ℚ)) :=
  (exists_discriminantPairing u hinj hfin).choose

/-- Evaluation on functional classes computes the inverse pairing using any nonzero multiple
that lifts through the adjoint. -/
theorem discriminantPairing_mk (u : Y →ₗ[ℤ] X →ₗ[ℤ] ℤ)
    (hinj : Function.Injective (adjoint u)) (hfin : Finite (componentGroup u))
    (a : Module.Dual ℤ X) (b : Module.Dual ℤ Y) (y : Y) (m : ℤ)
    (hm : m ≠ 0) (hy : adjoint u y = m • a) :
    discriminantPairing u hinj hfin (Submodule.Quotient.mk a) (Submodule.Quotient.mk b) =
      ((b y : ℚ) / m : ℚ) := by sorry

/-- The inverse pairing identifies each cokernel with the additive character group of the other. -/
theorem discriminantPairing_perfect (u : Y →ₗ[ℤ] X →ₗ[ℤ] ℤ)
    (hinj : Function.Injective (adjoint u)) (hfin : Finite (componentGroup u)) :
    Function.Bijective (discriminantPairing u hinj hfin) ∧
      Function.Bijective (AddMonoidHom.flip (discriminantPairing u hinj hfin)) := by sorry

/-- The Tate valuation pairing of coefficient `n` has component group `ℤ/n`, including the
infinite cokernel `ℤ` at coefficient zero (README §4.5). -/
theorem rankOne_componentGroup (n : ℕ) :
    Nonempty (componentGroup (rankOne n) ≃+ ZMod n) := by sorry

/-- The class of the dual functional `x ↦ r*x` in the first rank-one cokernel. -/
noncomputable def rankOneClass (n : ℕ) (r : ℤ) : componentGroup (rankOne n) :=
  Submodule.Quotient.mk (r • (LinearMap.id : Module.Dual ℤ ℤ))

/-- The same specified functional in the transposed rank-one cokernel. -/
noncomputable def rankOneDualClass (n : ℕ) (s : ℤ) : componentGroup (rankOne n).flip :=
  Submodule.Quotient.mk (s • (LinearMap.id : Module.Dual ℤ ℤ))

/-- On the specified rank-one quotient classes, the discriminant pairing is `rs/n` modulo
integers (SGA 7 I, Exposé IX, §11.4; README §4.6). -/
theorem discriminantPairing_rankOne (n : ℕ) (hn : 0 < n)
    (hinj : Function.Injective (adjoint (rankOne n))) (hfin : Finite (componentGroup (rankOne n)))
    (r s : ℤ) :
    discriminantPairing (rankOne n) hinj hfin (rankOneClass n r) (rankOneDualClass n s) =
      ((r * s : ℚ) / n : ℚ) := by sorry

/-- The zero pairing has an infinite cokernel, so the finite-cokernel hypothesis of the
perfect discriminant pairing cannot be omitted (README §§4.5–4.6). -/
theorem rankOne_zero_infinite : ¬ Finite (componentGroup (rankOne 0)) := by sorry

end LatticePairing

/-! ## Layer 6: interfaces for modularity and finiteness -/

namespace SemistableTrace

/-- Frobenius on the two graded pieces of a multiplicative elliptic motive in
cohomological period/torus order. In geometric instances `delta = ±1` is the action
of the chosen Weil element, and `q^d` is the geometric cyclotomic inverse
(Coleman–Iovita, Chapter I §2, pp. 9–12; Raynaud 1994, §4.7.4, p. 317). -/
def toricFrobenius (q delta : ℚ) (d : ℕ) : Matrix (Fin 2) (Fin 2) ℚ :=
  !![delta, 0; 0, q ^ d * delta]

/-- The full trace contains both lattice contributions. -/
theorem toricFrobenius_trace (q delta : ℚ) (d : ℕ) :
    Matrix.trace (toricFrobenius q delta d) = delta + q ^ d * delta := by sorry

/-- The determinant includes the square of the lattice action. -/
theorem toricFrobenius_det (q delta : ℚ) (d : ℕ) :
    Matrix.det (toricFrobenius q delta d) = q ^ d * delta ^ 2 := by sorry

/-- Geometric Frobenius has the inverse arithmetic monodromy factor:
`NF = q^d FN`. The arithmetic identity is valid also at degenerate scalar values. -/
theorem frobenius_monodromy_relation (q delta n : ℚ) (d : ℕ) :
    (!![0, n; 0, 0] : Matrix (Fin 2) (Fin 2) ℚ) * toricFrobenius q delta d =
      q ^ d • (toricFrobenius q delta d * !![0, n; 0, 0]) := by sorry

/-- At degree zero the arithmetic Frobenius matrix is scalar. -/
theorem degree_zero (q delta : ℚ) : toricFrobenius q delta 0 = delta • (1 : Matrix (Fin 2) (Fin 2) ℚ) := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [toricFrobenius]

/-- Zero lattice action gives the zero matrix at every arithmetic degree. -/
theorem zero_action (q : ℚ) (d : ℕ) : toricFrobenius q 0 d = 0 := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [toricFrobenius]

end SemistableTrace

namespace Interfaces

/-- The image of `Gal(K(J[N])/K)` in `GSp_{2g}(ℤ/N)` has order less than `N^{4g²}`: the crude bound
used for the degree of a full-level extension (Yuan, Lemma 4.9). -/
theorem card_lt_of_subgroup_matrix (N g : ℕ) (hN : 1 < N) (hg : 0 < g)
    (H : Subgroup (Matrix (Fin (2 * g)) (Fin (2 * g)) (ZMod N))ˣ) :
    Nat.card H < N ^ (4 * g ^ 2) := by sorry

end Interfaces

/-!
## Further targets in README.md

README §§6.4a–6.4d specify `ConnectedNeronKummer` (`connected-neron-kummer`),
`ConnectedNeronLocalization` (`connected-neron-localization`),
`NeronIsogenyComponentDefects` (`neron-isogeny-component-defects`) and
`SemistableQuotientCotangent` (`semistable-quotient-cotangent`). Their statements use the
relative open identity models, geometric torsion kernels, component sheaves and invariant
cotangent modules specified in the README. The pinned APIs do not provide these carriers.
They remain README targets, including their geometric boundary Checks.

`ConnectedNeronKummer` gives the fppf multiplication sequence for positive integers on
semistable identity models, with quasi-finite flat torsion kernels and the actual group of
identity-model sections. `ConnectedNeronLocalization` identifies its generic torsor image
over number-field integer opens by triviality at their finite places, retaining the component
cokernel in the restriction kernel and the real-place 2-primary condition for all-place Sha.
`NeronIsogenyComponentDefects` gives the snake sequence with both identity and component
kernels and cokernels; semistability makes the identity cokernel zero.
`SemistableQuotientCotangent` gives exact free tangent and cotangent sequences for every exact
abelian sequence with semistable middle term over finite K/ℚ_p and e < p − 1. Its cotangent
injection remains injective on the residue field. These statements retain additive-fibre and
e = p − 1 boundary failures and include semistable bad reduction in the modular application.

Geometric definitions and comparisons are recorded there rather than typed here:
`GoodReduction`, `WeakNeronBlowup`, `DifferentialLattice`, `IdentityComponent`,
the geometric `ComponentGroup`, `Chevalley`, `ToricCharacter`,
`SemistableReduction` and `henselization_iff`, `FiniteFlatToricFiltration`,
`FiniteFlatOrthogonality`, `SemiabelianExtensionClassification`, `RaynaudExtensionComparison`,
`RigidUniformisation`, `RaynaudOneMotive`, `PicardZero`,
`IntegralMonodromyPairing`, `ComponentPairing`, `RegularPicardNeronQuotient`,
`BgwSmoothHyperellipticModel`, `BgwNodalPinch`, `BgwGeneralizedJacobian`, `BgwOddFactorTorsors`,
`StableFamilyPicard`, `HeckeFamily`, `Matching`, `SemistableTorsionDatum`,
`SemistableTorsionLaws`, `SemistableTorsionFrobeniusLaws`, `SemistableTorsionGoodPlaceLaws`,
`SemistableJacobianTorsion`, `TwoPlaceSemistableTorsionDatum`,
`TwoPlaceSemistableTorsionLaws`, `TwoPlaceSemistableJacobianTorsion`,
`AbelianVariety.deRham`, and `SemistableOrdinaryAdapter`.
Their geometric Checks are likewise in README.md. The torsion targets of §4.14 use
prime-to-residue-characteristic torsion and the ordinary weighted graph, or an identified
bipartite presentation. Their specialization kernel is identity-component torsion; it is
toric for totally toric reduction. The additional Frobenius and Eichler–Shimura laws carry
the specified geometric operator comparisons.

`IdentityComponent` in README 2.1 specializes the field-level neutral-component construction
of AlgebraicModuliForArithmeticGeometry §7.9 `spaceSectionComponentCriterion`; its relative open
subgroup and marked-model API are targets here. `PicardZero` and `StableFamilyPicard` use
AlgebraicModuliForArithmeticGeometry §7.6.1's relative Picard sheaf and base change,
ComplexComparisonPartII §C3.2d.2's `relative_picard_algebraicSpace`, §C3.2f.1's `picardZeroSheaf`
and §C3.2f.2's `picardZeroCriterion`.

EtaleCohomologyFoundations F.3a supplies `VanishingCycles.HenselianTrait`,
`VanishingCycles.HenselianTrait.inertia_exact`, `VanishingCycles.inertia_eq_valuation_inertia`
and `VanishingCycles.tameCharacter_kummer`, `tameCharacter_surjective`, `tameCharacter_conj`,
`tameCharacter_restrict` and, for valuation rings of nonarchimedean local fields,
`VanishingCycles.tameCharacter_eq_inertiaTameCharacter`. ArithmeticGaloisRepresentations
§2.1a transports this comparison to global decomposition groups. README 3.5–3.12,
4.3 and 5.1 use its general henselian-trait interface: the generic Galois group is the
one acting on `AbelianTate`, the residue action is on the character lattices, and reduction
of prime-to-residue roots of unity identifies the supplier's twist with `PadicTateTwist`.
The positive Kummer direction is `σ(root)/root`; restriction to a finite separable trait
extension of ramification index `e` is `e * t'`. Surjectivity gives a generator of the
rank-one twist in the Néron–Ogg–Shafarevich argument. The Tate periods over `ℂ((t))`
and `𝔽_p(s)((t))` of README 5.1 use this interface without residue finiteness or perfectness.

`RigidUniformisation` in README 3.14 uses RigidAnalyticGeometry §§6.1–6.2's
`RigidSpace K`, §8.1's rigid analytification and §§8.2–8.3's classical-point and
rigid–adic comparison. Here `K` is the fraction field of a complete DVR, with its
complete nontrivial nonarchimedean valuation. The shared functor `r` is fully faithful;
its equivalence with adic spaces locally of finite type is restricted to quasi-separated
objects. AdicSpacesPartIII F0 and R2.3 supply formal completion and generic fibres.
The quotient by the period lattice is the target `RigidUniformisation` here.

`SemiabelianExtensionClassification` in README 3.13 classifies commutative extensions of
an abelian scheme over a complete DVR by a torus through morphisms of étale sheaves
`X^*(T) → B^∨`, naturally under base change and descent, and identifies their completions.
`BgwSmoothHyperellipticModel` in README 4.8 constructs the smooth projective geometrically
integral weighted model of genus `g ≥ 1` in characteristic different from two, with its
quadratic étale infinity fibre; `BgwNodalPinch` consumes that model.
The discriminating geometric model Checks of README 1.2 use `AbelianSchemeModel`,
`WeakNeronBlowup` and ReductiveGroupsPartII RG2.3.2's torus models.

`SemistableIdentityBasechange` in README 3.3 provides identity-model base change and
the open-immersion helper for a smooth separated finite-type group scheme over a DVR,
with a generic-fibre marking and semi-abelian open identity component. Both the
base-changed Néron identity model and `PicardZero` satisfy whole-group smoothness;
no residue-field restriction is imposed.

PadicPeriodRings §§1–2 and 4.1–4.3 supplies the completed field, Galois action, topological
`B_cris`, `B_dR`, `B_st`, invariant functors, canonical comparisons, regularity and
crystalline/semistable/de Rham predicates. FiniteFlatGroupsAndIntegralPadicHodgeTheory
R07.P2–R07.P5a and R07.3.0's `finiteKPeriodComparison` identifies its finite-K crystalline
and de Rham structures, `bCris`, `dCris`, `dDeRham`, `IsCrystalline` and `IsDeRham`, with
those shared carriers, maps and predicates, preserving topology, variance and logarithm branch.
Its R07.4.27 supplies `FilteredPhiNModuleDD` and `FilteredPhiNModuleDD.weilDeligne`.
`PadicWeilDeligneRealization` in README 5.3 adapts the actual admissible period modules
of potentially semistable representations of G_K, finite K/ℚ_p, to that same construction
and the shared WD fields, including p = 2. It retains the commuting coefficient-field action,
semilinear descent, filtration and effective coefficient descent data. Its formula
r(g) = g_D ∘ φ^{-a_K(g)} uses arithmetic a_K(Φ_K) = [k_K:𝔽_p]; geometric Frobenius
inverts Φ_K. Its extension comparisons preserve N_p and prove independence of the chosen
semistable extension. The normalized output has N_K = e_K N_p; `restrict` uses
N_L = e(L/K) N_K, with identity and composition in towers. It compares the admissible tensor
and dual maps and finite-extension filtered de Rham descent on these same period modules.
`D_pst` is the direct limit of the semistable-extension invariant modules.
For ℚ_p(1) its WD inertia is trivial and N = 0 despite infinite p-adic Galois inertia;
φ = p⁻¹σ and the filtration jump is −1. For Tate period π⁵ with e_K = 2, N_K has
coefficient 5 and N_p has 5/2; further ramified quadratic restriction gives coefficient 10
for N_L. The adapter preserves the specified coefficient embeddings into the common parameter
field, and supplies no smaller-field model solely from invariance of an isomorphism class.
R07.P7.1–R07.P7.5's labelled Sen weights use the opposite numeric sign to filtration
indices, giving +1 on ℚ_p(1).
`PadicComparison` uses these supplied predicates and identifies their `D_dR(V_p(A))`
with the dual degree-one de Rham cohomology and its dual Hodge filtration, naturally
under finite extensions. The downstream elliptic Bloch–Kato diagram of
SelmerIwasawaCohomology 4.26 uses that same `dDeRham(V_p(E))/Fil⁰`.

`RaynaudFilteredRealization` in README 5.3 constructs the full cohomological realization
of `[Y → G]` for semistable `A` over finite `K/ℚ_p`, with a `K₀`-structure, semilinear
Frobenius, `N = e * N_p` and the Hodge filtration on its `K`-linear de Rham comparison.
Its `deRham_exact`, `semiabelian_frobenius`, `logarithmic_retraction`, `branch_change`,
`monodromy`, `hodge`, `map`, `dual` and `unramified_descent` API provides the boundary,
pullback and residue maps; primitives on the pullback of the universal vector extension
evaluate on the lifted periods to split the exact sequence. The degree-one dagger
comparison constructs the semiabelian Frobenius structure before any period invariants
are identified. `RaynaudPeriodComparison` constructs the period-integration pairing,
proves its nondegeneracy and its Frobenius/monodromy-compatible `B_st` comparison and
filtered `B_dR` comparison, and identifies these with the canonical comparison maps
of the shared period functors. Thus `PadicComparison` identifies `D_st(V_p(A))` with
the homological dual of `RaynaudFilteredRealization`; README 6.10 consumes these maps
and comparisons for `semistable_trace_comparison`. Over `ℚ₅` with `log(5) = 0`, the
Tate periods `5` and `30` have equal valuation and graded Frobenius data, while evaluation
of the logarithmic primitive gives `0` and `log(6) ≡ 5 mod 25`. The full comparison
preserves the different Hodge lines.

CrystallineCohomology CR.2.1, CR.2.3 and CR.3.4 supplies the crystalline complex, proper
smooth formal comparison over a PD base and semilinear Frobenius of the good abelian quotient,
including at `p = 2`. README 5.3 and 6.10 identify these supplied objects with the Coleman–Iovita
and shared period realizations; their ramified crystalline/de Rham bridge belongs to
`RaynaudFilteredRealization` and their period comparison to `RaynaudPeriodComparison`.
`PadicComparison` and `good_abelian_frobenius_polynomial` consume these bridges. The canonical Weil–Deligne
parameter fields come from SmoothRepresentationsOfLocalGroups SR.5.2,
`classical-llc-normalization`; its `wd-parameter-operations` supplies restriction and
rescaling by nonzero scalars for `q ≥ 2` and finite inertia image.
ArithmeticGaloisRepresentations Layer 2 (§2.4) supplies the arithmetic Weil–Deligne adapter.

The construction `NeronModel.extend` and its API (`extend_restrict`, `extend_unique`,
`extend_map`, `extend_identity`, `extend_precomp`, `extend_proof_irrel`, `extend_to_model`,
`extend_comp_model`, `extend_inverse_model`, `extend_isIso`) are README 1.3 targets.
README 1.1, 1.2 and 1.6 specify the projection and restriction APIs, including
`NeronMappingProperty.identityRestriction`, `NeronModel.smooth_model`, `separated_model`,
`quasiCompact_model`, `mappingProperty`, `generic_hom_inv`, `generic_inv_hom`,
`genericIso_isIso` and `identity_unique`, and `WeakNeronModel.smooth_model`.
README 4.3 specifies `operator_apply`, `periodProjection_apply`, `weilForm_add_left`,
`weilForm_add_right` and `weilForm_skew`; README 6.10 specifies `degree_zero` and `zero_action`.
The two-lattice construction and its perfectness are stated above on the quotient modules.
README 4.6 also specifies `discriminantPairing_zero_left` and `zero_right`.

README 5.0a–5.0c specifies finite-étale torsion specialization and the good-reduction
Frobenius and Euler-factor comparisons; 5.1a specifies potential good reduction.
README 5.3a–5.3e, 5.3g–5.3i specifies the elliptic conductor, special fibre, étale Euler
characteristics, determinant/discriminant, Ogg/Saito formula, bounds, residual conductors
and comparison with Mathlib's local polynomial. README 6.0 specifies independence and
closed-point specialization. Their general abelian Tate-system and cohomological carriers
are supplied by the cited roadmaps.
AbelianSchemesAndArithmeticModuli A1.8 supplies Weil extension for the consequence
`AbelianSchemeModel` in README 1.8.

The corresponding untyped theorems include `Smoothening`,
`KodairaConfiguration`, `AbelianSchemeModel`, `SpreadAbelian`, `DedekindGluing`,
`JacobianIsogenyFactor`, `FiniteSeparableSemistableExtension`,
`GraphMonodromy`, `ComponentCokernel`, `IntersectionComponentQuotient`, the Picard–Néron
comparison, `MonodromyCriterion`, Néron–Ogg–Shafarevich, `PadicComparison`, conductor and local-factor comparisons,
and the geometric exports of Layer 6. `Smoothening` uses an excellent DVR;
`LocalExistence` provides a finite-type model over every DVR by construction over its
completion and existence descent (BLR §7.2, Theorem 1(i), p. 176).
`KodairaConfiguration` identifies the minimal regular fibre with Tate's labelled
configuration over a strictly henselian DVR with algebraically closed residue field
(Tate §6, pp. 45–46; §§7–8, pp. 47–52). The signed `prime_adic`, `prime_adic_finite_flat`,
`prime_adic_transition` and `henselian_valuation_descent` comparisons, together with
`good_abelian_frobenius_polynomial` (before `semistable_trace_comparison`),
`semistable_trace_descent` and `pure_WD_export`, are stated
in README 4.3, 5.3 and 6.10. Their coordinate witnesses above do not construct the geometric
or cohomological carriers.
-/

end TauCetiRoadmap.NeronModelsAndSemistableAbelianVarieties
