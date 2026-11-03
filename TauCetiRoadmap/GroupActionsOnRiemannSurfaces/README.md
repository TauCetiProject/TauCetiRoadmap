# Roadmap: finite group actions on compact Riemann surfaces

**Summary.** A finite group `G` acts faithfully by biholomorphisms on a compact Riemann surface `X` of genus
`g ≥ 2` with quotient `X/G` of genus `h` and `r` branch points of orders `m₁ ≤ … ≤ m_r` exactly
when `G` has a **generating vector** of **signature** `(h; m₁, …, m_r)`: elements
`a₁, b₁, …, a_h, b_h, c₁, …, c_r` generating `G`, with `c_j` of order exactly `m_j` and

```text
⁅a₁, b₁⁆ ⋯ ⁅a_h, b_h⁆ · c₁ ⋯ c_r = 1,
```

subject to the Riemann–Hurwitz relation `2g − 2 = |G| (2h − 2 + Σ_j (1 − 1/m_j))`. The LMFDB's
*higher genus curves with automorphisms* section (`hgcwa`, the tables `hgcwa_passports`,
`hgcwa_unique_groups`, `hgcwa_complete`) organizes data about these generating vectors into *families* `(g, G, σ)`, *refined
passports* (the vector of conjugacy classes of the `c_j`), *braid classes* and *topological
classes*. Its records are decorated with the quotient genus, the dimension `3h − 3 + r` of the family, whether
`G` is the full automorphism group of the generic member of the family (and if not, which group
is), whether the curves are hyperelliptic or cyclic trigonal, and the group-algebra decomposition
of the Jacobian. This roadmap makes every one of those notions a Lean definition in Tau Ceti with
the theorems that make it well defined, and proves the existence criterion itself.

The two carriers are the combinatorial object, `GenVector G σ` (Layer 0), and the geometric
object, a faithful holomorphic `MulAction G X` on a compact Riemann surface carried by the
hypothesis stack Tau Ceti's `TauCeti.Analysis.Complex.RiemannSurface.*` modules already use
(Layer 1). The bridge between them is the Riemann existence criterion of Layer 2, proved in both
directions: a generating vector is a surface-kernel epimorphism from the Fuchsian group of the
signature, whose kernel uniformizes `X`; an action yields the monodromy of the quotient map
`X → X/G` on the standard generators of the fundamental group of the punctured quotient.
The intrinsic fields studied here are functions of the generating vector, and every invariant
is proved to depend only on the equivalence class the LMFDB intends (simultaneous conjugation,
braid, topological). Suggested home: `TauCeti/GroupTheory/GeneratingVector/` for Layers 0 and
3–7's combinatorics, `TauCeti/Analysis/Complex/RiemannSurface/GroupAction/` for Layers 1, 2 and
the analytic halves of 6 and 7.

The companion [Suggested.lean](Suggested.lean) states the statable headline theorems:
the generating-vector/surface-kernel correspondence, torsion and surface kernels, integral
genus, Hurwitz, Harvey and Wiman. The geometric existence, topological classification,
generic-fullness, fixed-point, differential-character and Jacobian theorems require the
geometric carriers specified below; the module docstring identifies these missing carriers.

## Scope and ownership

### Owned here

- **Signatures** `(h; m₁, …, m_r)` with their Riemann–Hurwitz quantity
  `μ(σ) = 2h − 2 + Σ (1 − 1/m_j)`, hyperbolicity `μ(σ) > 0`, and the genus
  `g(n, σ) = 1 + n μ(σ)/2` of an action of a group of order `n` (Layer 0).
- **Generating vectors** `GenVector G σ`: the carrier, its product relation and order conditions,
  the signature group `Γ(σ)` with its standard presentation, the equivalence between generating
  vectors and surface-kernel epimorphisms `Γ(σ) → G`, transport along group isomorphisms, the
  Aut(G)-action and the `Inn(G)`-action (simultaneous conjugation), the specialization to Tau
  Ceti's `TriangleGroup` and `PermutationTriple` when `h = 0`, `r = 3` (Layer 0).
- **Actions on compact Riemann surfaces**: faithful holomorphic actions of a finite group, the
  quotient Riemann surface `X/G`, branch points, stabilizer orders, the quotient genus, the
  signature of an action, Riemann–Hurwitz in signature form, the representation of `G` on
  holomorphic differentials (Layer 1).
- **The Riemann existence criterion**: `G` acts on some compact Riemann surface of genus `g ≥ 2`
  with signature `σ` iff `GenVector G σ` is nonempty and `g = g(|G|, σ)`, with the explicit
  constructions in both directions and their compatibility (Layer 2).
- **Equivalences of generating vectors**: refined passports (the conjugacy-class vector), braid
  equivalence through the Hurwitz braid action, topological equivalence through Aut(G) and the
  mapping class group, the theorem that topologically equivalent actions are exactly the
  Aut(G) × Mod-orbits, the identification of topological equivalence with Aut(G) × B_r
  for `h = 0`, and the finite counts of each kind of class (Layer 3).
- **Numerical invariants**: `g0`, `r`, `dim = 3h − 3 + r`, the finiteness of the set of
  `(G, σ)` of a given genus with the bounds `r ≤ 4(g−1)/|G| − 4h + 4`, `h ≤ g`, `|G| ≤ 84(g − 1)`; the
  Hurwitz bound as a corollary of the criterion, with its equality case `σ = (0; 2, 3, 7)`;
  Harvey's criterion for cyclic groups and the Wiman bound `|G| ≤ 4g + 2` for cyclic `G` with its
  equality case (Layer 4).
- **Full automorphism groups**: the predicate that an action is the full automorphism group of
  its surface; generic fullness for a family; Singerman's list of signatures that never give a
  full action, with the index and the signature of the overgroup; the extension criterion on the
  generating vector that decides generic fullness, and the comparison with the
  generic overgroup's generating vector (Layer 5).
- **Macbeath's fixed-point formula** for an element of `G` in terms of the generating vector;
  the hyperelliptic and cyclic-trigonal predicates of a family and their criteria on
  the full group's generating vector (Layer 6).
- **The Eichler trace formula and the Chevalley–Weil formula** for the character of `G` on
  holomorphic differentials; the group-algebra decomposition of the Jacobian up to isogeny
  (Kani–Rosen, Lange–Recillas), the dimensions and multiplicities of its factors (Layer 7).
- **The hgcwa record semantics**: which stored field is which theorem, and the intrinsic label
  prefixes (Layer 8).

### Not owned here

- **Label components beyond the intrinsic prefix, orderings fixed by convention, stored lists, and
  the completeness of database tables** are not targets: the refined-passport index `x`, the vector
  index `y`, the `cc`/`braid`/`topological` representative pointers, the Magma character indices in
  `jacobian_decomp`, the stored class order, the permutation representation `G ↪ S_{|G|}` in which
  `gen_vectors`, `hyp_involution`, `cinv` are displayed, and every completeness claim about the
  stored tables. The composition of stored permutations is pinned in *Conventions* 1. This
  roadmap states the intrinsic *prefix* of each label (genus, isomorphism class of `G`, quotient
  genus, sorted signature, class vector) and nothing enumerative.
- **The small-group identifier** `n.d` (not a target); `group`, `group_order`, `full_auto` are the
  isomorphism class and order of an abstract finite group.
- **Function-field predicates and quotient curves over a general field**
  ([algebraic curves](../AlgebraicCurves/README.md) Layers 6–7, 11). Layer 6 here proves the generating-vector criteria over `ℂ` and the agreement with
  those predicates through the meromorphic function field.
- **Weierstrass equations** (`eqn`): `HyperellipticCurves` for `y² = f(x)`; equations of
  non-hyperelliptic families are excluded below.
- **Riemann existence for covers of arbitrary curves, Nielsen classes, Hurwitz spaces, lifting
  invariants, rigidity, fields of moduli** (`../InverseGaloisAndArithmeticFundamentalGroups`);
  **Teichmüller space and the fixed-locus theorem** (`../TeichmullerGeometry`); **closed and boundary-relative mapping class
  groups and the classification of compact surfaces** (`../SurfaceTopology`); **Fuchsian groups,
  presentations, compactification, Riemann–Hurwitz for finite holomorphic maps**
  ([Fuchsian orbifolds](../FuchsianOrbifolds/README.md)); **three-point covers and dessins**
  ([Belyi maps](../BelyiMaps/README.md)).
- **The Jacobian as a scheme, abelian varieties, isogenies, `End ⊗ ℚ`** ([Jacobian
  challenge](../JacobianChallenge/README.md)); **complex tori** ([complex tori](../ComplexTori/README.md));
  **rational representation descent and Schur indices** (ArithmeticGaloisRepresentations §5.6);
  **endomorphism algebras and Sato–Tate groups** (`SatoTateGroups`). The analytic curve/Jacobian comparison is supplied by MordellLawrenceVenkatesh §8.11;
  Layer 7 proves what the group action adds.
- **Positive characteristic** and the failure of the Hurwitz bound there
  ([algebraic curves](../AlgebraicCurves/README.md) Layer 11). Everything here is over `ℂ`.

### The hgcwa page, column by column

| Column / search field | Meaning | Where |
| --- | --- | --- |
| `genus` | `g = genus X = g(|G|, σ)` | 0.4, 1.4, 2.5 |
| `group`, `group_order` | isomorphism class and order of `G` | identifier not a target; `Nat.card G` |
| `signature` `[g0, m1, …, mr]`, `g0`, `r` | the signature of the action, quotient genus, number of branch points | 0.1, 1.3, 1.4 |
| `dim` | `3 g0 − 3 + r` | 4.2 |
| `gen_vectors` | a generating vector, displayed in the regular permutation representation | 0.2 (carrier); composition pinned (*Conventions* 1); the display representation is not a target |
| `con`, `cc`, `passport_label` | the refined passport (class vector); its index | 3.1; index not a target |
| `braid`, `braid_class` | braid equivalence class; its representative | 3.3; representative not a target |
| `topological`, `topological_class` | topological equivalence class; its representative | 3.4–3.6; representative not a target |
| `hgcwa_unique_groups.gen_vectors / braid / topological` | numbers of classes of each kind | 3.7 |
| `full_auto`, `full_label`, `signH`, `inc_full` | the generic full automorphism group of the family, its signature | 5.1–5.5 |
| `hyperelliptic`, `hyp_involution`, `inc_hyper` | the family is hyperelliptic; the involution | 6.2–6.3 |
| `cyclic_trigonal`, `cinv`, `inc_cyc_trig` | the family is cyclic trigonal; the automorphism | 6.4 |
| `jacobian_decomp` `[a, b, c]` | `b` copies of an abelian variety of dimension `a` | 7.4–7.6; `c` is not a target |
| `label`, `total_label` | family and vector labels | prefixes 8.1; indices not targets |
| `eqn` | an equation of the family | `HyperellipticCurves`; otherwise excluded |
| `hgcwa_complete.*` | completeness of the stored tables | not a target; finiteness of realized data in §4.6 |

### Exclusions

- Actions in positive characteristic, wild ramification, and the automorphism groups of curves
  over fields other than `ℂ` ([algebraic curves](../AlgebraicCurves/README.md) Layer 11 and its
  exclusions).
- Non-orientable quotients, anticonformal automorphisms, real forms and symmetric Riemann surfaces
  (Bujalance–Etayo–Gamboa–Gromadzki); the full (orientation-reversing) mapping class group's
  action.
- Hurwitz spaces as algebraic varieties, their components and their fields of definition, lifting
  invariants and rigidity (`../InverseGaloisAndArithmeticFundamentalGroups` IG.3.3, IG.5.3–IG.5.6).
- Teichmüller space itself, Fenchel–Nielsen coordinates, the fixed-locus theorem's proof
  (TeichmullerGeometry Layers 0–8), and the structure of the moduli space `M_g` (complex curve
  moduli).
- Equations of the families other than through `HyperellipticCurves`; the Shimura-variety
  dimension of a family; the Frediani–Ghigi–Penegini code.
- Fields of moduli and definition of a curve with a given action (Belyi maps Layer 11 for
  three-point covers; nothing in general).
- The classification of large automorphism groups beyond the finite lists of 4.3 and 5.3
  (Hurwitz groups in general, Macbeath's and Conder's genus spectra, Accola–Maclachlan's `8g + 8`
  theorem); the Accola–Maclachlan and Kulkarni surfaces appear only as worked examples.
- Automorphisms of Jacobians that do not come from the curve, the Hodge structure beyond the
  homology character, and endomorphism algebras as such (`SatoTateGroups`).


## Conventions

Implementors make no choices about any of the following.

1. **Multiplication.** Products are Mathlib's: in `Equiv.Perm` and in Aut X, `(σ * τ) x = σ (τ x)`.
   A product `g₁ ⋯ g_r` of group elements is `(List.ofFn g).prod`, left to right. The commutator
   is Mathlib's `⁅a, b⁆ = a * b * a⁻¹ * b⁻¹` (`commutatorElement`). The LMFDB's stored vectors are
   permutations composed left to right, where `p` then `q` is Mathlib's `q * p`. Inversion turns
   that composition into Mathlib's (`(q * p)⁻¹ = p⁻¹ * q⁻¹`), so a stored vector satisfying 3
   under left-to-right composition is read (4.6) as its entrywise inverse, which satisfies 3 here
   with the same orders and the same generated subgroup. ⚠ A vector whose entries are all
   involutions cannot detect a wrong convention.
2. **Signatures.** A signature is a pair `σ = (h, m)` with `h : ℕ` and `m : Fin r → ℕ`, every
   `m j ≥ 2`, and `m` monotone (`m₁ ≤ … ≤ m_r`), as the LMFDB sorts it. `r = 0` is allowed
   (unramified actions). The orders of a generating vector are read in the order of `m`: `c_j` has
   order exactly `m j`. Riemann–Hurwitz is stated with the rational
   `μ(σ) = 2h − 2 + Σ_j (1 − 1/m_j)`, never with an unchecked natural-number subtraction; the genus of
   an action of a group of order `n` is `1 + n μ(σ)/2 : ℚ`, and the theorem that it is an integer
   `≥ 2` under the existence hypotheses is 2.5, not a definition.
3. **The product relation.** A generating vector satisfies
   `⁅a₁, b₁⁆ * ⋯ * ⁅a_h, b_h⁆ * c₁ * ⋯ * c_r = 1`, in that order, in Mathlib's multiplication.
   For `h = 0` the `c`-part is a `BranchTuple r G` of the inverse-Galois roadmap with
   `BranchTuple.product = 1`. The comparison with Tau Ceti's `TriangleGroup a b c`, whose relator
   is `z * y * x`, is the isomorphism `Γ(0; m₁, m₂, m₃) ≃* TriangleGroup m₃ m₂ m₁` sending
   `c₁ ↦ z, c₂ ↦ y, c₃ ↦ x` (0.7); the comparison with `PermutationTriple` sends `(c₁, c₂, c₃)` to
   `(σ0, σ1, σinf) = (c₃, c₂, c₁)`, so that `σinf * σ1 * σ0 = c₁ c₂ c₃ = 1`. Geometrically, the
   ordered branch points of the Belyi dictionary `0, 1, ∞` are `c₃, c₂, c₁`. This reversal fixes the triangle dictionary; order-sorting elsewhere uses the
   Hurwitz transport of §0.6.
4. **Generation.** `Subgroup.closure (range a ∪ range b ∪ range c) = ⊤`. Generation is part of the
   carrier `GenVector G σ`; tuples satisfying only the relation and the orders are
   `SurfaceKernelHom`-images of subgroups and are not generating vectors.
5. **Surface-kernel epimorphisms.** `Γ(σ)` is `PresentedGroup` on `Fin h ⊕ Fin h ⊕ Fin r` with the
   relators `c_j ^ (m j)` and the product word of item 3. A homomorphism `φ : Γ(σ) →* G` is a
   *surface-kernel epimorphism* when it is surjective and `orderOf (φ (c j)) = m j` for every `j`.
   The equivalent statement "the kernel is torsion-free" is the theorem 2.2, and, for hyperbolic σ and finite G, the torsion-free
   kernel is the surface group of genus `g`.
6. **Actions.** A `G`-action on a compact Riemann surface `X` is `[MulAction G X]` with
   `[FaithfulSMul G X]` and every `(g • ·) : X → X` holomorphic (`MDifferentiable 𝓘(ℂ) 𝓘(ℂ)`); `G` is
   `[Finite G]`. No private "group of automorphisms" structure is introduced: the full
   automorphism group of `X` is the subgroup Aut(X) ≤ Equiv.Perm X of holomorphic bijections, and
   a faithful action is its image `G ≃* image`. "Compact Riemann surface" is the hypothesis stack
   `[TopologicalSpace X] [ChartedSpace ℂ X] [IsManifold 𝓘(ℂ) n X] [T2Space X] [CompactSpace X]
   [ConnectedSpace X]` of Tau Ceti's `RiemannSurface` modules (`n = 1`) and of the Fuchsian
   orbifolds roadmap's topological genus (`n = ∞`); `g ≥ 2` is an explicit hypothesis of every
   statement that needs it.
7. **The quotient.** `X/G` is `MulAction.orbitRel.Quotient G X` with the quotient topology and
   the complex structure of 1.2, built from the linearizing coordinates at points with
   nontrivial stabilizer (the local model `z ↦ z^m`). The quotient map `π : X → X/G` is a
   `FiniteHolomorphicMap` of degree `|G|`; the branch points are the `y ∈ X/G` with fibre
   cardinality `< |G|`; the *order* of a branch point is the common order of the stabilizers of the
   points over it. The signature of the action lists those orders in nondecreasing order.
8. **Standard generators and monodromy.** For the punctured quotient with base point `y₀`,
   put Π = (FundamentalGroup (Y ∖ B) y₀)ᵐᵒᵖ. Choose handle loops and counterclockwise peripheral
   loops whose classes in Π satisfy `Π_i [α_i,β_i] · γ₁⋯γ_r = 1`; their order is the boundary
   order of the oriented cut polygon in this opposite group. The endpoint rule defines
   a homomorphism `μ : Π →* G`: lifting the underlying loop from `x₀` ends at `μ(γ) • x₀`.
   Mathlib's `IsQuotientCoveringMap.fundamentalGroupToMulOpposite` has the equivalent type
   from the ordinary fundamental group to the opposite deck group. In Π the endpoint
   labels `(12),(23)` multiply to `(123)`; in Mathlib's ordinary fundamental group the
   same two labelled factors have endpoint `(132)`. A positive peripheral loop in the
   local model `z ↦ z^m` has endpoint rotation `exp(2πi/m)`, so passing to Π changes
   multiplication, not the sign of a peripheral rotation.

9. **Rotation constants.** For `γ ∈ G` and `P ∈ X` with `γ • P = P`, the rotation constant
   `ζ_P(γ) : ℂ` is the derivative `mfderiv` of `(γ • ·)` at `P`, a primitive `|Stab(P)|`-th root
   of unity when `γ` generates the stabilizer. Eichler's trace formula (7.1) is stated with
   `ζ_P(γ)`; no `exp (2πi k/m)` is written into a statement except through `ζ_P`.
10. **The representation on differentials.** `ρ_Ω : G →* GL(H⁰(X, Ω))` is
    `ρ_Ω(γ) ω = (γ⁻¹)^* ω`, a left action; `γ^*` alone is contravariant and is never called "the
    representation". `χ_Ω` is its character. The rational representation is `H₁(X, ℚ)`, with
    character `χ_Ω + \bar χ_Ω`.
11. **Equivalences.** Simultaneous conjugation is the `Inn(G)`-action `g • v = (MulAut.conj g) ∘ v`;
    the LMFDB's "distinct generating vectors" are its orbits. A *refined passport* is `(g, G, C)` with
    `C j = ConjClasses.mk (c j)`. *Braid equivalence* (3.3) is: same `Inn(G)`-orbit after applying
    some `β : BraidGroup r` to the `c`-tuple through IG.3.2's `HurwitzAction.action`, `(a, b)`
    untouched; the LMFDB's displayed `Q_i` is the inverse of IG.3.2's generator `σ_i`, with the
    same orbits. *Topological equivalence* is 3.4's definition through Aut(G) and
    orientation-preserving homeomorphisms; the braid group enters only through the theorem 3.6.
12. **Hyperbolicity.** Every theorem about actions assumes `g ≥ 2`; equivalently (2.5)
    `μ(σ) > 0`. Spherical and Euclidean signatures (`μ ≤ 0`) are rejected by the predicate
    `IsHyperbolic σ`, not silently given a genus `0` or `1`.
13. **Fullness.** IsFull (G, X) means the image of `G` is all of Aut(X). A *family* is the set of
    actions with a given generating vector up to topological equivalence; *generic fullness* (5.2)
    is fullness off a proper closed analytic subset of the fixed locus, and the LMFDB's `full_auto`
    is the full automorphism group of a generic member.
14. **Hyperelliptic and cyclic trigonal** are properties of the generic member of the family,
    decided on the generic full group: an involution with `2g + 2` fixed points, respectively an
    element of order `3` with `g + 2` fixed points. The LMFDB stores `hyp_involution` and `cinv`
    when they lie in `G`. The predicate tested on `G` implies the predicate on the generic
    full group, but the converse need not hold; §6.3 distinguishes them.
15. **The Jacobian decomposition** is an isogeny statement about `Jac X` over `ℂ` (Jacobian
    challenge Layer E) indexed by the primitive central idempotents of `ℚ[G]`. In the LMFDB's
    `[a, b, c]`, `a` and `b` are theorems here and `c` is not.

## Exact supplier contracts

### From Mathlib

Presented and free groups (`PresentedGroup`, `PresentedGroup.toGroup`, `closure_range_of`,
`FreeGroup.lift`); commutators, generation and orders (`commutatorElement`, `Subgroup.closure`,
`orderOf`, `orderOf_dvd_card`, `Nat.card`); conjugacy (`ConjClasses`, `IsConj`, `MulAut.conj`,
`Subgroup.normalizer`, `Subgroup.centralizer`); actions (`MulAction`, `FaithfulSMul`,
`MulAction.stabilizer`, `MulAction.orbitRel.Quotient`, `MulAction.fixedBy`, orbit–stabilizer);
permutations (`Equiv.Perm`, `Equiv.Perm.partition`); complex manifolds (`ChartedSpace ℂ X`,
`IsManifold 𝓘(ℂ) n X`, `MDifferentiable`, `mfderiv`, `UpperHalfPlane`, `PSL(2, ℝ)`); fundamental
groups and coverings (`FundamentalGroup`, `Path.trans`, `IsCoveringMap`, `IsCoveringMap.monodromy`);
representations (`Representation`, `FDRep`, `Representation.character`, `char_orthonormal`,
`MonoidAlgebra`, `Module.End.eigenspace`); `Finset.lcm`, `Nat.factorization`, `ZMod n`. The analytic action is a native `MulAction` with pointwise holomorphy.
The exact geometric carriers required by the headline statements are specified in their layers.
For rational semisimple blocks consume
`IsSemisimpleRing.exists_algEquiv_pi_matrix_divisionRing_finite`
(Mathlib/RingTheory/SimpleModule/WedderburnArtin.lean).

### From Tau Ceti

| Need | Tau Ceti (at the pin) |
| --- | --- |
| triangle groups, their trichotomy, lifts to permutation groups | `TauCeti.TriangleGroup`, `lift`, homEquiv, `hom_ext`, `rotate`, `equivTwoGenerator`, `toPerm`, `orbifoldEulerChar`, `orbifoldEulerChar_neg_iff`, `IsSphericalSignature`, `IsEuclideanSignature`, `infinite_of_inv_add_inv_add_inv_le_one` |
| permutation triples and passports | `TauCeti.PermutationTriple`, `monodromyGroup`, `IsConnected`, `eulerChar`, `genus`, `PassportSpec`, `passportOf`, `PassportLabel`, `Passport.Count`, `GeneratingCount` |
| braid groups | `TauCeti.BraidGroup n` (`ArtinGroup (CoxeterMatrix.A (n − 1))`) |
| finite holomorphic maps | `TauCeti.RiemannSurface.localMultiplicity`, `degree`, `degree_eq_fiber_sum`, `FiniteHolomorphicMap`, `ofMDifferentiable`, `comp`, `degree_comp`, `biholomorphOfDegreeEqOne`, `ramificationDegree`, `ramificationDivisor`, `card_fiber_add_sum_localMultiplicity_sub_one` |
| Fuchsian groups | `TauCeti.Analysis.Complex.Fuchsian.{ProperAction, Stabilizer, Elliptic.Basic, Elliptic.Linearizing, CoarseQuotient, Descent, MeromorphicDescent, Covolume, Compactification.*}` |
| function-field automorphisms | `TauCeti.natCard_le_eighty_four_mul_genus_sub_one`, `TauCeti.hurwitz_genus_formula`, `IsHyperellipticFunctionField`, `Automorphism.{Finite, FixedField, Rigidity, WeierstrassGaps}` |
| group algebra idempotents | `TauCeti.Representation.characterSum`, `characterSum_mem_center`, `characterSum_mul_characterSum`, `isUnit_char_one`, the primitive central idempotents and their sum in `CharacterTable.IdempotentDecomposition` |
| monodromy of three-point covers | `TauCeti.AlgebraicTopology.ThricePuncturedSphere.{MonodromyTriple, Deck, Regular, Classification, BranchPointAction}` |

### From named roadmaps and pinned modules

- From Tau Ceti at the pin: `TauCeti.TriangleGroup a b c` (presentation
  `x ^ a, y ^ b, z ^ c, z * y * x`), `TauCeti.TriangleGroup.lift`, homEquiv, `rotate`,
  `orbifoldEulerChar` with its sign trichotomy (`TauCeti.GroupTheory.TriangleGroup.Signatures`);
  `TauCeti.PermutationTriple` (`σinf * σ1 * σ0 = 1`), `monodromyGroup`, `IsConnected`, `genus`,
  `PassportSpec`, `passportOf`, `PassportLabel`; `TauCeti.BraidGroup n`;
  `TauCeti.RiemannSurface.localMultiplicity`, `degree`, `FiniteHolomorphicMap`,
  `FiniteHolomorphicMap.ofMDifferentiable`, `ramificationDegree`, `ramificationDivisor`,
  `degree_eq_fiber_sum`; the Fuchsian stabilizer and linearization API
  (`Subgroup.LinearizingCoordinate`, `stabilizerRotation`, `quotientCoordinate` in
  `TauCeti.Analysis.Complex.Fuchsian.Elliptic.Linearizing`); the function-field automorphism
  theory `TauCeti.natCard_le_eighty_four_mul_genus_sub_one`, `TauCeti.hurwitz_genus_formula`,
  `IsHyperellipticFunctionField`; `TauCeti.Representation.characterSum` and the primitive central
  idempotents `e_ρ = (χ(1)/|G|) Σ_g χ(g⁻¹) g` with their orthogonality and sum
  (`TauCeti.RepresentationTheory.CharacterTable.{CentralIdempotent, IdempotentDecomposition}`).
- AlgebraicCurves Layer 11 supplies finiteness of the function-field automorphism group
  in characteristic zero and genus at least two. BelyiMaps §8.2 supplies the analytic
  local normal form; FuchsianOrbifolds Layer 2 items 3–6 supplies fundamental polygons.

- From [Fuchsian orbifolds](../FuchsianOrbifolds/README.md): Layer 2 items 3–6 (the Poincaré
  polygon theorem, the Dirichlet polygon of a cofinite group, the standard presentation with
  elliptic and parabolic cycles, hyperbolic triangle groups from reflections); Layer 4 (the
  compactified quotient as a compact Riemann surface; for a cocompact group the coarse quotient
  itself); Layer 5 items 1–3 and 6 (the topological genus `genus X` with `χ = 2 − 2 genus`, finite
  holomorphic maps and degree, the Euler-characteristic form of Riemann–Hurwitz
  `χ(X) = deg f · χ(Y) − ramificationDegree f`, the Fuchsian Riemann–Hurwitz and orbifold
  Euler characteristic). The minimum area `π/21` and its equality case are supplied by TeichmullerGeometry §10.1.
- From [Belyi maps](../BelyiMaps/README.md): Layer 0 (permutation triples, relabeling, monodromy
  group, connectedness, genus), Layer 1 (passports, `N_{S_n}(G)`-orbits), Layer 4 (triangle groups
  and the trichotomy), Layer 5 (the thrice-punctured sphere and its peripheral loops), Layer 6
  (the monodromy triple of a finite cover, deck transformations, regular covers), Layer 7 (filling
  punctures, the branched covering map, uniqueness of the compactification), Layer 8 (the
  compact-Riemann-surface hypothesis stack 8.1, the local normal form 8.2, analytic Riemann
  existence 8.6). Its pinned product relation `σinf * σ1 * σ0 = 1` and its `0, 1, ∞` ordering are
  matched by the dictionary of 0.7 below.
- From the roadmap *Inverse Galois theory and arithmetic fundamental groups*
  (`../InverseGaloisAndArithmeticFundamentalGroups`): IG.3.2's `BranchTuple r G`,
  `BranchTuple.product` (the ordered product `g₁ * ⋯ * g_r`), `BranchTuple.generated`,
  `NielsenClass.inner`, `HurwitzMove.apply` (`(a, b) ↦ (a b a⁻¹, a)`) and
  `HurwitzAction.action : TauCeti.BraidGroup r →* Equiv.Perm (BranchTuple r G)` with
  `product_action`, `generated_action`, `classes_action`; IG.5.2's marked topological Hurwitz
  spaces and `HurwitzMarking.forget`. The `c`-part of a generating vector with `h = 0` is a
  branch tuple with product one, and braid equivalence (3.3) is the orbit relation of that action.
- From TeichmullerGeometry §§5.6 and 8.4: identification of closed-surface stabilizers
  with conformal automorphisms and the fixed-locus dimension `3h − 3 + r`; §10.1:
  minimum orbifold area. The global cone-orbifold Teichmüller identification is a target
  of §4.2 here, and generic extension for all signatures is a target of §§5.2–5.4 here.

- MordellLawrenceVenkatesh §§5.9 and 5.21 supplies punctured mapping classes, their outer
  action on conjugacy classes of homomorphisms, and capping with marked discs. This roadmap
  owns the cone-order restriction, half-twist formula and sphere comparison in §3.4.
- From *Surface topology* (`../SurfaceTopology`): Layer 7 (the edge-path group of a surface map
  and its standard presentation), Layer 8 (classification of compact surfaces), Layer 9 (mapping
  class groups `MappingClassGroupPlus`, Dehn twists, Lickorish generators).
- From [algebraic curves](../AlgebraicCurves/README.md) Layer 11 (automorphisms of function
  fields, rigidity, finiteness, the `84(g − 1)` bound, the characteristic-`p` caveats) and Layer
  12 (the dictionary between compact Riemann surfaces over `ℂ`, function fields and curves); from
  [modular forms](../ModularForms/README.md) 10B (the meromorphic function field `ℳ(X)` of a
  compact Riemann surface is a function field over `ℂ` of the same genus, `H⁰(X, Ω)` has dimension
  `g`, analytic Riemann–Roch).
- From [the Jacobian challenge](../JacobianChallenge/README.md): `JacobianVariety X x₀` as an
  abelian variety over `ℂ` with `dim Jac X = g` (Layer D–E), the Abel–Jacobi map and the
  Albanese property (Layer F), isogenies and `End(Jac X) ⊗ ℚ` (Layer E); from
  [complex tori](../ComplexTori/README.md) Milestone 1 the torus of an already supplied full lattice.
  MordellLawrenceVenkatesh §8.11 supplies the period-lattice identification of the algebraic
  Jacobian, its integral homology comparison, naturality under automorphisms and independence
  of the Abel–Jacobi base point. Tensoring that comparison with ℚ supplies §7.3.
- ArithmeticGaloisRepresentations §5.6 supplies simple-module descent over a perfect field.
  For a rational simple block Mₙ(D) with centre Z and `[D:Z]=s²`, its complex constituents
  form one Galois orbit, each has degree n·s, and the rational irreducible has character
  s times their sum. Here n,s are positive; the specialization to ℚ gives §7.5's Schur index
  and exponent, including nonsplit blocks.
- HyperellipticCurves §1.4 supplies the genus-zero involution criterion, centrality and
  uniqueness, through the meromorphic-function-field dictionary. The order-three criterion
  needed here is derived from §1.4 below.


## How to read the build

Layer 0 develops the algebra of signatures and surface-kernel epimorphisms. Layers 1–2
construct and classify their geometric realizations while retaining a marked complex quotient.
Layer 3 compares the relevant equivalence relations. Layer 4 proves bounds and finiteness;
Layer 5 treats generic extensions. Layers 6–7 derive fixed-point, differential and Jacobian
invariants, and Layer 8 records exactly the equivalence relation each invariant respects.

## Layer 0: signatures and generating vectors

Purely algebraic; nothing analytic is used. Sources: Breuer, *Characters and Automorphism Groups
of Compact Riemann Surfaces*, §3, p.7 (Fuchsian groups and surface-kernel epimorphisms); Broughton, *Classifying finite group actions on surfaces of low genus*, §§1–2.

### 0.1 Signatures and the Riemann–Hurwitz quantity

`Signature` is the structure of convention 2: `h : ℕ`, `r : ℕ`, `m : Fin r → ℕ`, `two_le : ∀ j, 2 ≤ m j`,
`mono : Monotone m`. Define `Signature.mu` by `μ σ : ℚ := 2 h − 2 + Σ_j (1 − 1/m j)`. Define `Signature.IsHyperbolic` by `IsHyperbolic σ := 0 < μ σ`,
and `Signature.genusOfOrder` by `genusOfOrder σ (n : ℕ) : ℚ := 1 + n * μ σ / 2`.
Define `Signature.periods σ` as `List.ofFn σ.m`, and sortSignature (h : ℕ) (l : List ℕ) (hl : ∀ x ∈ l, 2 ≤ x) : Signature
(sorting a list of orders, the LMFDB's `sort_sign`; an entry `< 2` is excluded by the hypothesis, not
mapped to a default). Prove: `μ σ ≥ −2`; `IsHyperbolic σ` is
decidable, holds for `h ≥ 2`, for `h = 1 ∧ r ≥ 1`, for `h = 0 ∧ r ≥ 5`, and fails for `h = 0 ∧ r ≤ 2`; for `r = 3`, `h = 0`, `μ σ = −orbifoldEulerChar m₁ m₂ m₃` (Tau Ceti), so the trichotomy of
`TauCeti.GroupTheory.TriangleGroup.Signatures` is the trichotomy of `μ`; `genusOfOrder σ n ≥ 2 ↔
n μ σ ≥ 2` for `n ≥ 1`. TeichmullerGeometry §10.1 supplies `μ ≥ 1/42` for hyperbolic signatures and equality
only for `(0;2,3,7)`, through the Fuchsian area formula `Area = 2πμ`.
*Needs:*
Mathlib `ℚ`; Tau Ceti `orbifoldEulerChar`; TeichmullerGeometry §10.1 for the minimum.

**Checks.**

- For `(2;∅)`, μ=2 and the genus for n=1 is 2; the empty sum is zero, not an omitted signature.
- For `(0;2,3,6)`, μ=0 and every rational genus is 1; `(0;2,3,7)` has μ=1/42 and gives genus 3 at n=168.
- Sorting the orders `(7,2,3)` yields `(2,3,7)` without changing μ; a period 1 is excluded. At n=0 the total genus expression is 1, so no finite-group realization is inferred.

### 0.2 The carrier

```lean
structure GenVector (G : Type*) [Group G] (σ : Signature) where
  a b : Fin σ.h → G
  c : Fin σ.r → G
  rel : (List.ofFn fun i => ⁅a i, b i⁆).prod * (List.ofFn c).prod = 1
  orderOf_c : ∀ j, orderOf (c j) = σ.m j
  closure_eq_top : Subgroup.closure (Set.range a ∪ Set.range b ∪ Set.range c) = ⊤
```

- Prove extensionality in the three tuples and finiteness of the vector type for finite G.
- The empty-vector type for `(0;∅)` is inhabited exactly when G is trivial; this signature is not hyperbolic.
- For finite G the type is empty if some period does not divide its order; for h=0 it is also empty when r=1, or when r=2 and the periods differ, since the entries are mutual inverses.

*Needs:* Mathlib.

**Checks.**

- The trivial group has one empty vector for `(0;∅)`, while C₂ has none; at `(2;∅)` the trivial group again has one vector and the signature is hyperbolic.
- In C₄ the tuple `(2,2,2,2)` has relation sum 0 and exact orders 2 but generates only a subgroup of order 2, so it fails generation.
- In C₂ three nonidentity branch entries sum to 1; six sum to 0 and generate C₂.

### 0.3 Transport and the two natural actions

Transport along a group isomorphism e gives an equivalence of generating-vector types (componentwise); the Aut(G)-action
`MulAction (MulAut G) (GenVector G σ)` by `α • v = v.map α`; the `Inn(G)`-action, i.e. the
`G`-action by simultaneous conjugation `g • v = (MulAut.conj g) • v`, with
`ConjClasses.mk ((g • v).c j) = ConjClasses.mk (v.c j)`. Define GenVector.innClass v as the orbit
in `MulAction.orbitRel.Quotient G (GenVector G σ)`; it is the LMFDB's "generating vector up to
simultaneous conjugation" and the set it ranges over is finite (0.2). *Needs:* 0.2; Mathlib
`MulAut.conj`.

**Checks.**

- For C₅ and `(1,1,3)`, the automorphism multiplying by 2 gives `(2,2,1)`; multiplying by 3 recovers `(1,1,3)`.
- Conjugation by `(123)` in S₃ sends `(12)` to `(23)` and preserves its order 2 and conjugacy class.
- For an abelian group the inner action is trivial: the four C₁₀ vectors of signature `(0;2,5,10)` remain four inner classes.

### 0.4 The signature group and its universal property

`SignatureGroup σ := PresentedGroup (signatureRelators σ)` on generators `Fin σ.h ⊕ Fin σ.h ⊕ Fin σ.r`
with relators `(of (inr j)) ^ (m j)` for each `j` and the product word of convention 3; these define `signatureRelators`. Name the
generators `A i`, `B i`, `C j`. Prove the universal property as follows: a homomorphism from the signature group to G corresponds uniquely to handle and peripheral
entries satisfying the product relation and the powers `c_j ^ m_j = 1`
(`PresentedGroup.toGroup` plus `hom_ext`), that `A, B, C` generate `SignatureGroup σ`, and that
for `h = 0` the group is generated by `C₁, …, C_{r−1}` (`C_r` is the inverse of their product), so
`SignatureGroup (0; m)` is a quotient of the free group of rank `r − 1`. *Needs:* Mathlib
`PresentedGroup`.

`SignatureGroup σ`, `SignatureGroup.A`, `SignatureGroup.B`, `SignatureGroup.C` are in `Suggested.lean`; the equivalence homEquiv is specified
here only: it sends `φ` to `(φ ∘ A, φ ∘ B, φ ∘ C)`, and its inverse is `PresentedGroup.toGroup` on
the generator assignment `Sum.elim a (Sum.elim b c)`. Only the power relations `c j ^ m j = 1` are
required, not exact orders and not surjectivity.

**Checks.**

- The trivial tuple corresponds to the trivial homomorphism, for every `σ`.
- `C₄` (additive) with `(0; 2, 2, 2, 2)`: the tuple `(2, 2, 2, 2)` satisfies the product relation
  and the power relations, so it is a homomorphism `Γ(σ) → C₄`, although it is not surjective
  and is rejected by `GenVector` (0.2).
- `C₂` with `(0; 2, 2, 2)`: the tuple `(ι, ι, ι)` has product `ι ≠ 1`, so no homomorphism sends
  every `C j` to `ι`.
- For `h = 0`, `r = 3`, composing with the isomorphism of 0.7 gives Tau Ceti's
  `TauCeti.TriangleGroup.homEquiv` with the three entries reversed.

### 0.5 Generating vectors are surface-kernel epimorphisms

`SurfaceKernelHom G σ := { φ : SignatureGroup σ →* G // Function.Surjective φ ∧ ∀ j, orderOf (φ (C j)) = σ.m j }`
and the equivalence characterized by `GenVector.surfaceKernelHom_correspondence`,
restricting 0.4: surjectivity is `closure_eq_top` through `range_eq_closure`, and the order
condition is `orderOf_c`. Both actions of 0.3 correspond to post-composition with automorphisms of
`G`. *Needs:* 0.2–0.4.

The theorem asserts an equivalence `e : GenVector G σ ≃ SurfaceKernelHom G σ` with
`(e v)(A i) = v.a i`, `(e v)(B i) = v.b i`, `(e v)(C j) = v.c j` for every vector and index.
Thus its inverse is evaluation on the distinguished generators; no arbitrary bijection suffices.

**Checks.**

- the all-involution vector (`C₂`, `(0; 2⁶)`) corresponds to the epimorphism `Γ(0; 2⁶) → C₂`
  sending every `C j` to the involution.
- `C₄` with `(0; 2, 2, 2, 2)` and the tuple `(2, 2, 2, 2)`: a homomorphism, not surjective, hence
  not a surface-kernel epimorphism, matching `closure_eq_top`'s rejection.
- The trivial homomorphism satisfies the power relations but is not a surface-kernel
  epimorphism when `r ≥ 1`: `orderOf 1 = 1 ≠ m j`.
- Counts transfer: `C₁₀` with `(0; 2, 5, 10)` has four surface-kernel epimorphisms, and
  `PSL₂(𝔽₇)` with `(0; 2, 3, 7)` has `336` (worked examples).

### 0.6 Quotients of an action

For a surjective homomorphism `q : G →* H` and a generating vector, project all entries,
delete identity peripheral images, and replace the remaining periods by their exact orders.
To put the periods in nondecreasing order, use adjacent Hurwitz moves
`(u,v) ↦ (uvu⁻¹,u)`, with their conjugations. Prove that these moves preserve the product
and the subgroup generated together with the handle entries, and that all choices of sorting
braid give the same braid-equivalence class of the resulting signature. The construction is
valid also for spherical and Euclidean signatures; only its genus-at-least-two realization
requires hyperbolicity. Preimages of subgroups under the surface-kernel homomorphism have finite
index when `G` is finite. *Needs:* §§0.2–0.5; InverseGaloisAndArithmeticFundamentalGroups IG.3.2.

**Checks.**

- In `S₃`, with `a=(12), b=(23), z=(132)`, the projected tuple `(b,z,a,b,b)` has product `1`.
  Plain order-sorting gives `(b,a,b,b,z)` with product `(123)`, whereas Hurwitz sorting preserves `1`.
- The tuple before projection in `S₃×C₃` is `((b,0),(z,2),(1,2),(a,2),(b,1),(b,2))`;
  its orders are `(2,3,3,6,6,6)`. Its image has signature `(0;2,2,2,2,3)` and `μ=2/3`.
- Projection to the trivial group deletes every peripheral entry and preserves the handle genus;
  the empty branch product is `1`. No artificial branch of order one remains.

### 0.7 The triangle case and the permutation-triple dictionary

For `σ = (0; m₁, m₂, m₃)`: `SignatureGroup σ ≃* TauCeti.TriangleGroup m₃ m₂ m₁` sending
`C₁ ↦ z, C₂ ↦ y, C₃ ↦ x` (convention 3), and hence
`GenVector G σ ≃ { t : (G × G × G) // orders exact ∧ t.1 * t.2.1 * t.2.2 = 1 ∧ closure = ⊤ }`. For
`G ≤ Equiv.Perm (Fin n)` a generating vector of signature `(0; m₁, m₂, m₃)` gives a
`TauCeti.PermutationTriple n` with `σ0 = c₃, σ1 = c₂, σinf = c₁`, `monodromyGroup = G`, and
`orderTriple = (m₃, m₂, m₁)`. It is connected precisely when `n ≠ 0` and the given
`G`-action is pretransitive; conversely a connected triple gives a generating vector in its
monodromy group with that transitive action. Through
Belyi maps 1.5 the vector of `S_n`-conjugacy classes of `(c₁, c₂, c₃)` is the Belyi passport with the
cycle partitions in the order `∞, 1, 0`. *Needs:* Tau Ceti `TriangleGroup`, `PermutationTriple`;
Belyi maps Layers 0–1; 0.4–0.5.

The triangle comparison and permutation-triple construction are API targets in the README.

**Checks.**

- `Γ(0; 2, 3, 7) ≃* TauCeti.TriangleGroup 7 3 2` with `C₁ ↦ z` (order `2`, the relator `z ^ 2`),
  `C₂ ↦ y`, `C₃ ↦ x`. The unreversed assignment `C₁ ↦ x` is not a homomorphism into
  `TriangleGroup 7 3 2`, where `x` has order `7`.
- The regular action of `C₁₀` with vector `(5,2,3)` has one orbit of size `10`; adding
  a fixed letter gives orbits of sizes `10` and `1` and a disconnected triple.
- The product relator `C₁ C₂ C₃` maps to `z * y * x`, Tau Ceti's relator.
- The triple description counts four triples for `C₁₀` with `(0; 2, 5, 10)` and `336` for
  `PSL₂(𝔽₇)` with `(0; 2, 3, 7)` (worked examples).

### Examples

C₂,(0;2⁶) has one vector; C₁₀,(0;2,5,10) has four.

### Dependencies

Mathlib presented groups, orders and actions; Tau Ceti triangle groups and permutation triples; InverseGaloisAndArithmeticFundamentalGroups IG.3.2; TeichmullerGeometry §10.1 only for the area minimum.

## Layer 1: finite group actions on compact Riemann surfaces

Sources: Farkas–Kra, *Riemann Surfaces*, Chapter III §7 (quotients by finite groups) and V.1;
Miranda, *Algebraic Curves and Riemann Surfaces*, Chapter III §3 (group actions, the quotient,
Riemann–Hurwitz for quotients); Breuer §4, p.18.

### 1.1 The carrier and the automorphism group

With `X` a compact Riemann surface (convention 6), Aut X : Subgroup (Equiv.Perm X) is the
subgroup of bijections `f` with `f` and `f⁻¹` holomorphic. A faithful holomorphic action of a
finite group `G` is `[MulAction G X] [FaithfulSMul G X]` with `hol : ∀ g, MDifferentiable 𝓘(ℂ) 𝓘(ℂ) (g • ·)`;
toAut : G →* Aut X is injective, and conversely every finite subgroup of Aut X is such an
action. Prove: for `g ≥ 2`, Aut X is finite — through the meromorphic function field `ℳ(X)`
(modular forms 10B), which is a function field over `ℂ` of genus `g` (10B's genus agreement),
on which automorphisms act faithfully by inverse pullback, and AlgebraicCurves Layer 11's
finiteness theorem for function-field automorphisms in characteristic zero.

*Needs:*
Mathlib; modular forms 10B; algebraic curves Layer 11 (the function-field statement).

**Checks.**

- A trivial-group action embeds with image of order 1 on any surface.
- A trivial C₂-action has kernel C₂ and is excluded by faithfulness; holomorphy alone does not make the map injective.
- On a complex torus translations give infinitely many automorphisms; the finiteness theorem requires genus at least two.

### 1.2 Stabilizers and the quotient Riemann surface

For `P : X`, `MulAction.stabilizer G P` is cyclic, acting on a disc around `P` by rotations: a
linearizing coordinate exists (the finite-group version of
`TauCeti.Analysis.Complex.Fuchsian.Elliptic.Linearizing`, proved by averaging a chart over the
stabilizer), and the stabilizer embeds into `ℂˣ` through the rotation constant `ζ_P` of convention
9. Only finitely many points have nontrivial stabilizer. Construct the complex structure on
`X/G := MulAction.orbitRel.Quotient G X`: charts are the descended charts away from the exceptional
orbits and the quotient coordinate `z ↦ z^m` (the `quotientCoordinate` of the linearizing
coordinate) at an exceptional orbit of stabilizer order `m`; prove `X/G` is a compact connected
Riemann surface and `π : X → X/G` is holomorphic, hence `FiniteHolomorphicMap.ofMDifferentiable`
applies, with `localMultiplicity π P = |Stab P|` and `degree π = |G|`. *Needs:* 1.1; Tau Ceti
`RiemannSurface.{localMultiplicity, degree, FiniteHolomorphicMap}`; the Fuchsian linearization
file as the model of the proof.

**Checks.**

- At a point fixed by the hyperelliptic involution the chart map is z↦z², local degree 2 and rotation −1.
- At a free orbit the stabilizer order is 1, local degree is 1 and the fibre has |G| points.
- For G=1 the quotient map is the identity, degree 1 and branch set empty.

### 1.3 Branch points and the signature of an action

branchPoints G X : Finset (X/G) is the set of `y` with `#π⁻¹ y < |G|`; branchOrder y is the
stabilizer order of any point over `y` (well defined: stabilizers of points in one orbit are
conjugate); `r := #branchPoints`; signature G X : Signature is `(genus (X/G), sortSignature of the
branch orders)`, with `genus` the topological genus of Fuchsian orbifolds 5.1. Prove: the
branch orders are `≥ 2`, `Σ_{y} (|G| − #π⁻¹ y) = ramificationDegree π`, and `#π⁻¹ y = |G| / branchOrder y`.
*Needs:* 1.2; Tau Ceti `ramificationDegree`, `card_fiber_add_sum_localMultiplicity_sub_one`;
Fuchsian orbifolds 5.1.

The quotient genus is the topological genus of FuchsianOrbifolds §5.1.

**Checks.**

- The hyperelliptic involution of a genus-two surface has signature `(0; 2⁶)`: six branch points
  of order `2`, quotient genus `0` (`2.2-1.0.2-2-2-2-2-2`).
- On `y² = x⁵ − 1`, the group `C₁₀` generated by `(x, y) ↦ (ζ₅ x, −y)` has signature
  `(0; 2, 5, 10)`, and its subgroup `C₅` generated by `(x, y) ↦ (ζ₅ x, y)` has `(0; 5, 5, 5)`: three
  fixed points, each with stabilizer of order `5`.
- An involution with two fixed points on a genus-two surface has signature `(1; 2, 2)`
  (`2.2-1.1.2-2`). A branch order is a stabilizer order, not a count of points.
- The trivial group has signature `(genus X; ∅)`: no point has a nontrivial stabilizer.

### 1.4 Riemann–Hurwitz in signature form

`2 genus X − 2 = |G| (2 genus (X/G) − 2 + Σ_j (1 − 1/m_j))`, i.e. `(genus X : ℚ) = genusOfOrder (signature G X) |G|`,
from Fuchsian orbifolds 5.3's `χ(X) = deg π · χ(X/G) − ramificationDegree π` and 1.3. Corollaries:
`genus (X/G) ≤ genus X`, with equality iff `G = 1`; for `genus X ≥ 2` the signature is hyperbolic;
`r ≤ 4(g−1)/|G| − 4h + 4`, since each branch contributes at least `1/2`;
when `|G| ≥ 2` this implies `r ≤ 2g + 2 − 4h`. For `G=1`, `h=g` and `r=0`.
The quotient genus agrees with that of the invariant meromorphic function field through
ModularForms 10B and AlgebraicCurves Layers 11–12.
*Needs:* §1.3; FuchsianOrbifolds Layer 5 item 3; ModularForms 10B.

No declaration for this target is in `Suggested.lean`; it is specified here only. Its statement uses 1.3's signature and Fuchsian orbifolds
5.1's `genus`.

**Checks.**

- For the trivial action in genus two, `h=g=2`, `r=0`, `μ=2`; the general branch bound
  gives `0 ≤ 0`, while the bound requiring `|G| ≥ 2` would give the false `0 ≤ −2`.
- The Klein quartic with `PSL₂(𝔽₇)` and `(0; 2, 3, 7)`: `μ = 1/42`, so
  `1 + 168 · (1/42) / 2 = 3`, its genus.
- `C₁₀` with `(0; 2, 5, 10)`: `μ = 1/5`, so `1 + 10 · (1/5) / 2 = 2`.
- `S₃` with `(0; 2, 2, 3, 3)`: `μ = 1/3`, so `1 + 6 · (1/3) / 2 = 2`.
- Boundary, outside the hypotheses: `C₃` on `ℂ/ℤ[ω]` by `z ↦ ωz` has signature `(0; 3, 3, 3)` with
  `μ = 0`, and `2 · 1 − 2 = 0 = 3 · 0`; for genus `≥ 2` the signature is hyperbolic.

### 1.5 The representation on holomorphic differentials

`H⁰(X, Ω)` is modular forms 10B's space of holomorphic `1`-forms, of dimension `g`.
`ρ_Ω : Representation ℂ G H⁰(X, Ω)` is `γ ↦ (γ⁻¹)^*` (convention 10); `χ_Ω` its character;
`ρ_Ω` is faithful for `g ≥ 2` (an automorphism acting trivially on differentials is the identity:
through the canonical map for non-hyperelliptic `X`, through the hyperelliptic involution's
`−1`-action otherwise; algebraic curves Layer 11's rigidity supplies the function-field half). The
multiplicity of the trivial character in `χ_Ω` is `genus (X/G)` (invariant differentials descend to
`X/G` and every differential on `X/G` pulls back, with the local computation at branch points).
*Needs:* 1.2–1.4; modular forms 10B; Mathlib `Representation`.

**Checks.**

- The genus-two hyperelliptic involution acts by −1 on each of two differentials: trace −2 and invariant dimension 0.
- A genus-two bielliptic involution has eigenvalues 1 and −1, trace 0 and invariant dimension 1.
- On y²=x⁵−1, inverse pullback by x↦ζ₅x has eigenvalues ζ₅⁴ and ζ₅³; ordinary pullback would give ζ₅ and ζ₅².

### Examples

The hyperelliptic and bielliptic genus-two involutions have signatures (0;2⁶) and (1;2,2).

### Dependencies

Layer 0; FuchsianOrbifolds Layer 5; BelyiMaps §8.2; ModularForms Layer 10B; AlgebraicCurves Layers 11–12.

## Layer 2: the Riemann existence criterion

Sources: Breuer §3, p.7 (Fuchsian groups and the existence theorem); Broughton §2,
Proposition 2.1 (the criterion as the LMFDB states it); Harvey, *Cyclic groups of automorphisms of
a compact Riemann surface*, §2 (the surface-kernel formulation).

### 2.1 The Fuchsian realization of a hyperbolic signature

For hyperbolic `σ` there is a cocompact Fuchsian group `Γ_σ ≤ PSL(2, ℝ)` with a Dirichlet polygon
whose side pairings give `Γ_σ ≅ SignatureGroup σ` and whose elliptic elements are exactly the
conjugates of the nontrivial powers of the `C j`, with `⟨C j⟩` of order `m j` and hyperbolic area
`2π μ(σ)` (Fuchsian orbifolds Layer 2 items 3, 5–6: the Poincaré polygon theorem applied to the
standard `4h + 2r`-gon with angle sums `2π/m_j` at the elliptic cycles; for `h = 0, r = 3` item 6's
triangle groups, identified with `TauCeti.TriangleGroup` through 0.7). Name the isomorphism
fuchsianModel σ : SignatureGroup σ ≃* Γ_σ and prove that `SignatureGroup σ` is infinite and that
`SignatureGroup.isConj_pow_C_of_isOfFinOrder`:
every nonidentity finite-order element is conjugate to a power of some `C j` (so the exact-order condition of 0.5
is the torsion-free-kernel condition, 2.2). *Needs:* 0.4; Fuchsian orbifolds Layer 2; Tau Ceti
`infinite_of_inv_add_inv_add_inv_le_one` for the triangle case.

**Checks.**

- The triangle `(0;2,3,7)` has μ=1/42 and area π/21; its peripheral generator orders are 2,3,7.
- For `(2;∅)`, μ=2 and area 4π; there are no nonidentity finite-order elements.
- The Euclidean signature `(0;3,3,3)` has μ=0 and is excluded from the hyperbolic realization.

### 2.2 Surface kernels

For any group G, hyperbolic σ and surjective `φ : SignatureGroup σ →* G`,
`SurfaceKernelHom.ker_torsionFree` states that `ker φ` is torsion-free iff
`orderOf (φ (C j)) = m j` for all `j` (2.1's description of torsion). A torsion-free finite-index
subgroup `K` of `Γ_σ` acts freely and properly on `ℍ`, so `ℍ/K` is a compact Riemann surface
(Fuchsian orbifolds Layer 4 with no elliptic points and no cusps) of genus `g` with
`2g − 2 = [Γ_σ : K] μ(σ)` (Fuchsian orbifolds 5.6's Fuchsian Riemann–Hurwitz, or area), and `K` is
isomorphic to `SignatureGroup (g; ∅)`, the surface group. *Needs:* 2.1; Fuchsian orbifolds
Layers 4–5.

**Checks.**

- The all-involution vector C₂,(0;2⁶) gives index 2, torsion-free kernel and genus 2, with 2g−2=2·1.
- Mapping every peripheral generator to 1 kills an element of order 2; exact order fails as 1≠2 and the kernel has torsion.
- For the identity homomorphism of a hyperbolic signature group, the kernel is trivial and all peripheral orders stay exact; finiteness of the codomain is unnecessary for this equivalence.

### 2.3 From a generating vector to an action

Fix a marked complex quotient orbifold Q of hyperbolic signature σ, including its ordered
cone points and a peripheral-preserving presentation of its geometric orbifold group by
`SignatureGroup σ`. Use its Fuchsian realization Γ_Q and a generating vector v to form
`K = ker φ_v` and `X_(Q,v) = ℍ/K`. The quotient group Γ_Q/K is identified with G by φ_v
and acts faithfully and holomorphically. Prove that the quotient is Q, the signature is σ,
and the genus is `Signature.genusOfOrder σ |G|`. The realization takes both Q and v as
inputs; choosing a complex structure is additional data (Broughton §2, Proposition 2.1).
*Needs:* §§2.1–2.2, 1.2–1.4; FuchsianOrbifolds Layers 2, 4–5.

**Checks.**

- For `C₂,(0;2⁶)`, one vector gives a three-dimensional space of complex quotients;
  choosing a quotient is necessary even though there is one vector.
- On `y²=x⁵−1`, the quotient by the hyperelliptic involution has six branch points;
  recovering this marked quotient and vector recovers this curve, not every genus-two curve.
- For `G=1`, the covering is the identity of Q and its degree is `1`.

### 2.4 From an action to a generating vector

Given a faithful holomorphic action of `G` on `X` with `genus X ≥ 2`, `Y := X/G`,
`B := branchPoints`, `y₀ ∉ B`, `x₀ ∈ π⁻¹ y₀`: the restriction `X ∖ π⁻¹ B → Y ∖ B` is a regular
covering with deck group `G` (Belyi maps 6.4–6.5 generalized from the thrice-punctured sphere to
`Y ∖ B`, through the same `IsCoveringMap.monodromy`), and its monodromy
`μ : (π₁(Y ∖ B, y₀))ᵐᵒᵖ →* G` (convention 8) is surjective since `X ∖ π⁻¹ B` is connected. A choice of
standard generators `α_i, β_i, γ_j` of the opposite fundamental group
(the marked-surface presentation constructed here, with the relation of convention 8) gives `v := (μ α, μ β, μ γ) : GenVector G (signature G X)`: the
relation is the single relation of `π₁`, the orders are exact because `γ_j` lifts to a loop around
a point of stabilizer order `m_j` acting as the rotation `ζ` of 1.2, and generation is
surjectivity. Name it GenVector.ofAction (it depends on the choice of standard generators and of
`x₀`), and retain the marked complex quotient Q alongside the vector. The presentation
is obtained directly by cutting the punctured surface to its oriented polygon, using
SurfaceTopology Layers 7–8 for the compact surface and boundary presentation.
*Needs:* §§1.2–1.4; BelyiMaps Layers 5–6; SurfaceTopology Layers 7–8.

**Checks.**

- For endpoint labels `(12),(23)` the product in the opposite fundamental group has label `(123)`; the ordinary fundamental-group product has `(132)`.
- For z↦z⁵ a counterclockwise loop lifts from 1 to ζ₅, fixing the positive exponent in the differential formula.
- For the identity cover every endpoint label is 1, the deck group has order 1, and the branch tuple is empty.

### 2.5 The criterion

**Theorem (Riemann existence, LMFDB form).** For a finite group `G`, a signature `σ` and `g ≥ 2`:
there is a compact Riemann surface `X` of genus `g` with a faithful holomorphic `G`-action of
signature `σ` iff `GenVector G σ` is nonempty and `(g : ℚ) = genusOfOrder σ |G|`. Consequently
`genusOfOrder σ |G|` is an integer whenever `GenVector G σ ≠ ∅` and `σ` is hyperbolic (so the LMFDB's
`genus` column is `genusOfOrder` read in `ℕ`), and `IsHyperbolic σ` is necessary. *Needs:* 2.3,
2.4, 1.4.

The left side is the existence of a *genus-`g` action of `G` with signature `σ`*: a type `X : Type`
(the universe of `ℍ/K`) carrying the compact-Riemann-surface stack of convention 6 with both
`IsManifold 𝓘(ℂ) 1 X` and `IsManifold 𝓘(ℂ) ∞ X`, a faithful `MulAction G X` with every `(γ • ·)`
holomorphic, signature (1.3) equal to `σ`, and Fuchsian orbifolds 5.1's `genus X = g`. The
integrality half is `GenVector.exists_genus_eq` in `Suggested.lean`; the criterion itself is
specified here only, since its left side needs 1.3 and the supplier's `genus`.

**Checks.**

- `C₂`, `(0; 2⁶)`, `g = 2`: both sides hold (the all-involution vector, and
  `1 + 2 · 1/2 = 2`).
- `PSL₂(𝔽₇)`, `(0; 2, 3, 7)`: both sides hold for `g = 3` and both fail for `g = 4`, although
  `GenVector G σ` is nonempty.
- `A₅`, `(0; 2, 3, 7)`: `GenVector G σ` is empty (no element of order `7`) and
  `1 + 60 · (1/42) / 2 = 12/7` is not an integer, so both sides fail for every `g`.
- `C₄`, `(0; 2, 2, 2, 2)`: `μ = 0`, so `genusOfOrder = 1 < 2` and the signature is not hyperbolic;
  `GenVector G σ` is also empty (0.2's boundary check). Both sides fail for every `g ≥ 2`.

### 2.6 Compatibility of the two constructions

Recovering the marked quotient Q and monodromy v from an action on X, and then forming
`X_(Q,v)`, gives a G-equivariant biholomorphism with X over Q. Its uniqueness is relative
to the chosen point of the unbranched fibre. Forgetting Q gives only topological compatibility,
not an analytic inverse (Broughton §2, Propositions 2.1–2.2; ComplexCurveModuli D0 item 4).

For a subgroup `K ≤ G`, the points of `X/K` over branch point j of `X/G` are indexed by
`K \ G / ⟨c_j⟩`. For a representative x the stabilizer order for the K-action is
`e_(j,x) = |K ∩ x⟨c_j⟩x⁻¹|`. The signature of the K-action has these periods, with the
entries equal to one discarded, and quotient genus h_K determined by
`2g−2 = |K|(2h_K−2 + Σ_(j,x) (1−1/e_(j,x)))`.
Prove independence of representatives, the exact-period assertion and compatibility with
successive subgroup restrictions (Bujalance–Cirre–Conder §2, pp.1539–1540).
*Needs:* §§2.3–2.5; §1.4; ComplexCurveModuli D0 item 4.

**Checks.**

- `K=G` gives one double coset per branch point, `e=m_j` and h_K=h.
- `K=1` gives only `e=1`, hence no branch entries and h_K=g; in genus two both sides are `2`.
- Restrict `C₁₀,(0;2,5,10)` to `C₂`: the three branch fibres give five order-two entries,
  no entry, and one order-two entry, respectively; `2=2(−2+6/2)` and h_K=0.

### Examples

The C₁₀ action on y²=x⁵−1 realizes genus two, while its C₂ restriction has six branch points.

### Dependencies

Layers 0–1; FuchsianOrbifolds Layers 2, 4–5; BelyiMaps Layers 5–6; SurfaceTopology Layers 7–8; ComplexCurveModuli D0 item 4.

## Layer 3: refined passports, braid classes, topological classes

Sources: Broughton §2 (Proposition 2.2: topological equivalence is Aut(G) × Mod), §3;
Breuer §3, p.7 and §14, p.45; the inverse-Galois roadmap IG.3.2 for the Hurwitz action; TeichmullerGeometry §5.6; Surface topology Layer 9.

### 3.1 Refined passports

RefinedPassport G σ := Fin σ.r → ConjClasses G; GenVector.refinedPassport v j := ConjClasses.mk (v.c j).
It is invariant under `Inn(G)` (0.3) and under braid moves that fix the class vector; Aut(G) acts
on refined passports and `refinedPassport (α • v) = α • refinedPassport v`. The refined passport of
`(g, G, v)` is the LMFDB's `(g, G, 𝒞)`; the set of refined passports realized by `GenVector G σ` is
finite (0.2). For `h = 0, r = 3` and `G ≤ S_n` it determines the Belyi passport (0.7).
*Needs:* 0.2–0.3, 0.7.

**Checks.**

- An abelian C₅ vector has ordered passport `(1,1,3)`; scaling by 2 changes it to `(2,2,1)` rather than fixing it.
- In S₃ the conjugate elements `(12)` and `(23)` give the same class entry, whereas a 3-cycle gives a different entry.
- For `(2;∅)` in C₂² every passport is empty, including the two topological classes distinguished in §8.2.

### 3.2 The class-vector count

The number of generating vectors with refined passport `𝒞` and `h = 0` is the Frobenius count of
solutions of `c₁ ⋯ c_r = 1` with `c_j ∈ C_j`, `(Π |C_j| / |G|) Σ_χ Π χ(C_j) / χ(1)^{r−2}`, with the exponent r−2 read in ℤ and empty products equal to one, corrected
to generating tuples by Möbius inversion over subgroups: Belyi maps 3.2–3.4 and Tau Ceti
`Passport.Count`, `GeneratingCount`, extended from `r = 3` to arbitrary `r`. *Needs:* 0.2; Belyi
maps 3.2–3.4.

**Checks.**

- For C₂ and six prescribed nonidentity classes, the character sum is (1+1)/2=1, giving one generating tuple.
- For C₂ and three prescribed nonidentity classes, the character sum is (1−1)/2=0.
- For C₄ and four prescribed order-two entries, the product-one count is 1 but the generating count is 0.

### 3.3 Braid equivalence

For `v, w : GenVector G σ`, `BraidEquiv v w :↔ ∃ β : TauCeti.BraidGroup σ.r, ∃ g : G,
HurwitzAction.action β (v.c) = (MulAut.conj g) ∘ w.c ∧
v.a = (MulAut.conj g) ∘ w.a ∧ v.b = (MulAut.conj g) ∘ w.b` (IG.3.2's action on the
`c`-part as a `BranchTuple σ.r G`). Prove it is an equivalence relation; that `HurwitzAction.action β v.c`
has the same product as `v.c`, namely the inverse of the handle-commutator product,
generates `G` with `v.a, v.b`, and has the same multiset of orders and classes
(IG.3.2's `product_action`, `generated_action`, `classes_action`); and that it is again a
generating vector of `σ` exactly when its order sequence is `m` (a braid orbit passes through
tuples whose orders are a permutation of `m`). BraidClass v is the class; the set of braid classes
with a given refined passport is finite. For `h = 0, r = 3` the pure braid group acts by inner
automorphisms (`σ_i²` conjugates `(c_i, c_{i+1})` by `c_i c_{i+1}` and fixes the third entry, which
`c_i c_{i+1}` centralizes exactly because `c₁ c₂ c₃ = 1`); so when the three periods are distinct
braid classes are `Inn(G)`-classes, while a repeated period lets the half-twist `σ_i` swapping the
two equal-order entries identify `Inn(G)`-classes (`(0; 3, 15, 15)` below: 192 `Inn`-classes, 96 braid
classes). For positive h its action need not be inner. With `r=0` the relation is precisely
simultaneous conjugation of all handle entries. *Needs:* 0.2–0.3;
IG.3.2; Tau Ceti `BraidGroup`.

**Checks.**

- For S₃,(2;∅), simultaneous conjugation gives 360/6=60 braid classes; an equality-only relation would give 360.
- For `(1;3)` with a=(12), b=(23), c=(123), the branch product is (123), and its product with the handle commutator (132) is 1.
- A Hurwitz move on `(12),(23)` gives `(13),(12)`; both ordered products are (123), and both pairs generate all six elements of S₃.

### 3.4 Topological equivalence of actions

Two faithful holomorphic actions `φ₁, φ₂ : G →* Aut X` (or on two surfaces `X₁, X₂` of the same
genus) are *topologically equivalent* when there are `ω : MulAut G` and an orientation-preserving
homeomorphism `t : X₁ ≃ₜ X₂` with `φ₂ (ω γ) = t ∘ φ₁ γ ∘ t⁻¹` for all `γ`. Prove it is an equivalence
relation and that it preserves the signature and the quotient genus. For generating vectors the geometric mapping-class action is on simultaneous-conjugacy
classes of surface-kernel epimorphisms. Use MordellLawrenceVenkatesh §5.9’s mapping class group of a finite-type punctured surface
and restrict it to the subgroup preserving cone-order colours. Its outer action on the punctured fundamental
group preserves oriented peripheral conjugacy classes and descends to the cone quotient.
Precomposition by an inverse representative gives a left action on inner classes; changing the
representative by an inner automorphism does not change that class. Define topological
classes by further quotienting by this action and Aut(G), and prove that they classify
oriented topological actions (Broughton §2, Proposition 2.2).

Consume MordellLawrenceVenkatesh §5.21’s capping comparison with marked discs.
The additional cone-order action is a target here: construct half-twists supported near
arcs between equally coloured points, and prove their outer-action formula. Establish the
sphere comparison of §3.6 by identifying the image of coloured braids with the marked-sphere
mapping-class action. No outer automorphism acts on raw homomorphisms without choosing a lift.

- The action preserves exact peripheral orders and surjectivity, hence surface kernels.
- Changing the fibre base point acts by simultaneous conjugation of handles and peripherals.
- Change of the complex quotient in §2.3 preserves the resulting topological action class.

**Checks.**

- For `(0;2,3,7)`, exchanging the points of orders 2 and 3 leaves the fixed-signature group;
  the colour-preserving group fixes each of the three points.
- For `(1;3)` in S₃, `a=(12), b=(23), c=(123)` gives `[a,b]=(132)` and `[a,b]c=1`;
  the peripheral product is not one.
- For S₃ and `(2;∅)`, there are 360 generating vectors and 60 inner classes;
  the braid relation of §3.3 has 60 classes, not 360.

*Needs:* §§0.5, 2.4–2.6, 3.3; SurfaceTopology Layers 7–9 for compact boundary-relative
surfaces; MordellLawrenceVenkatesh §§5.9, 5.21 for punctures and capping;
InverseGaloisAndArithmeticFundamentalGroups IG.3.2 for the Hurwitz action;
TeichmullerGeometry §5.6 for closed-surface stabilizers.

### 3.5 Braid classes refine topological classes

BraidEquiv v w → TopEquiv v w (a Hurwitz move is the action of a half-twist about an arc joining
two punctures, an orientation-preserving mapping class, and simultaneous conjugation is `Inn(G)`).
Hence BraidClass refines the LMFDB's `topological` partition: every topological class is a
finite union of braid classes, which is what the `hgcwa-topological-action` page lists. *Needs:*
3.3–3.4 (the marked half-twist construction).

**Checks.**

- The S₃ Hurwitz pair `(12),(23)` and `(13),(12)` represents the same local marked half-twist; both products are (123).
- When r=0, a braid class is an inner class and its image is one topological class; there are 60 such inner classes for the unramified S₃ genus-seven action.
- For C₁₀,(0;2,5,10), four braid classes map to one topological class, so refinement need not be equality.

### 3.6 Topological equivalence for quotient genus zero

**Theorem.** For `h = 0`: TopEquiv v w ↔ ∃ ω : MulAut G, BraidEquiv (ω • v) w. The mapping class
group of the marked sphere is the image of the braid group; for a fixed order sequence use
its colour-preserving subgroup. The sphere relations and the central full twist act by inner
automorphisms on product-one systems, so their action on inner classes is trivial. Prove the
comparison with §3.4, retaining every cone order (Broughton §2, Proposition 2.2).
*Needs:* §§3.3–3.5, including the marked-sphere construction of §3.4.

**Checks.**

- For C₁₀,(0;2,5,10), four inner and braid classes form one Aut(C₁₀)-orbit.
- The pure mapping class group of the three-marked sphere is trivial; for three distinct cone colours it is the whole colour-preserving group.
- For C₃×C₁₅,(0;3,15,15), the equal-order half-twist joins pairs of 192 inner classes, leaving 96 braid classes and one topological class.

### 3.7 The three counts

For finite `G` and hyperbolic `σ`: numInnClasses G σ, numBraidClasses G σ,
numTopClasses G σ : ℕ are the cardinalities of the finite quotients of 0.3, 3.3, 3.4, with
numTopClasses ≤ numBraidClasses ≤ numInnClasses, and numRefinedPassports G σ the number of
realized class vectors. These are intrinsic fixed-signature counts. For fixed genus g and
abstract group G, the aggregate over a quotient-genus regime ε is the sum over all realized
signatures σ with `Signature.genusOfOrder σ |G|=g` and `(σ.h>0)=ε`; an all-groups total also
sums over group isomorphism classes. Finiteness of these sums follows from §4.6.
The LMFDB page reads hgcwa_unique_groups by genus, group and the g0_is_gt0 regime, and reads
hgcwa_complete by genus; neither table is identified here with a fixed-signature count
(LMFDB higher_genus_w_automorphisms/main.py, higher_genus_w_automorphisms, aggregate-table block).
*Needs:* §§0.3, 3.1, 3.3–3.4; §4.6 for finiteness of the aggregate sums.

**Checks.**

- For C₂ in genus two, `(0;2⁶)` contributes one inner class and `(1;2,2)` contributes four;
  the total across both regimes is `1+4=5`.
- The corresponding refined-passport counts are `1+1=2`, not five.
- A fixed-signature count for `(0;2⁶)` remains one if the other regime is omitted.

### Examples

The unramified S₃ example has 360 vectors and 60 inner/braid classes; the Klein quartic has two passports and one topological class.

### Dependencies

Layers 0–2; InverseGaloisAndArithmeticFundamentalGroups IG.3.2; MordellLawrenceVenkatesh §§5.9, 5.21; SurfaceTopology Layers 7–9; TeichmullerGeometry §5.6.

## Layer 4: quotient genus, dimension, finiteness, and the Hurwitz and Wiman bounds

Sources: Harvey 1966 (Theorem 4, the cyclic criterion; the bound `4g + 2`); Wiman 1895;
Farkas–Kra V.1 (Hurwitz's theorem); TeichmullerGeometry §8.4 (the fixed locus and `3h − 3 + r`);
Breuer §9, p.29 (abelian actions).

### 4.1 The quotient genus and the number of branch points as invariants of the vector

For `v : GenVector G σ`, g0 v := σ.h and r v := σ.r; by 2.3 these are `genus (X_v / G)` and
`#branchPoints` of the realized action, and by 3.4 they are invariants of the topological class.
`g0 = 0 ↔ X_v/G ≅ ℙ¹` (Fuchsian orbifolds 5.2's degree-one theorem applied to a degree-one map
to the sphere, or the genus-zero classification of Belyi maps 8); `g0 = genus X` holds exactly when `G=1`, for `g ≥ 2` (§1.4). *Needs:* 1.4, 2.3, 3.4.

**Checks.**

- The trivial genus-two action has g0=2=g and r=0.
- The genus-two hyperelliptic action has g0=0 and r=6.
- The genus-two bielliptic C₂-action has g0=1 and r=2; the same group and surface genus do not fix the quotient genus.

### 4.2 The dimension of the family

dim v := 3 σ.h − 3 + σ.r : ℤ, and the theorem that it is `≥ 0` for hyperbolic `σ` (so the LMFDB's
column is a natural number) with `dim = 0 ↔ h = 0 ∧ r = 3` (the triangle signatures: rigid
actions). TeichmullerGeometry §§5.6 and 8.4 supplies the closed-surface stabilizers and fixed-locus
dimension. Construct here the marked cone-orbifold Teichmüller space for σ and prove that
pullback along the topological branched covering is a biholomorphism onto the G-fixed locus.
The marking retains the cone-order colours and the peripheral convention of §2.4. Prove
holomorphy by pullback of invariant Beltrami differentials and descend invariant complex
structures through the local quotient charts of §1.2; prove injectivity with the marked
quotient construction of §2.6. Its moduli image has dimension `3h−3+r` (Bujalance–Cirre–Conder
§1, pp.1537–1538; TeichmullerGeometry §8.4 for the dimension).
For `G=1` this is all of Teich(Σ_g), of dimension `3g−3`. For `|G|≥2`, §1.4 gives
`dim≤2g−1−h≤3g−3`, with equality only for the genus-two hyperelliptic involution.
*Needs:* §§1.2, 2.3–2.6, 3.4; TeichmullerGeometry §§5.6, 8.4; ComplexCurveModuli D0.

**Checks.**

- `(0;2⁶)` gives dimension `−3+6=3`, equal to the dimension of M₂.
- `(0;2,3,7)` gives `−3+3=0`; it is a rigid cone orbifold, not a closed genus-three quotient.
- The trivial genus-two action gives `3·2−3+0=3`; the nontrivial-group bound does not apply.

### 4.3 The Hurwitz bound from the criterion

For `v : GenVector G σ` with `σ` hyperbolic and `g = genusOfOrder σ |G|`: `|G| = (2g − 2)/μ(σ) ≤ 84 (g − 1)`
by the supplied `μ(σ) ≥ 1/42`, stated here as `GenVector.card_le_hurwitz`, with equality iff `σ = (0; 2, 3, 7)` (`GenVector.card_eq_hurwitz_iff`, a *Hurwitz group*). Through 2.5 this is
`|Aut X| ≤ 84 (genus X − 1)` for every compact Riemann surface of genus `≥ 2`, the LMFDB's
`curve.highergenus.hurwitz_bound`; it agrees with Tau Ceti's
`natCard_le_eighty_four_mul_genus_sub_one` applied to `ℳ(X)` (every place of a characteristic-zero
function field is tame) through 10B, and that agreement is a README comparison target.
An action has `|G| > 4 (g − 1)` ("large automorphism group") iff `μ(σ) < 1/2`; such a signature
has `h = 0` and `r ≤ 4`, and for `r = 4` it is `(0; 2, 2, 2, m)` with `m ≥ 3` or one of
`(0; 2, 2, 3, 3), (0; 2, 2, 3, 4), (0; 2, 2, 3, 5)` (`Σ 1/m_j > 3/2` forces `m₁ = m₂ = 2` and
`1/m₃ + 1/m₄ > 1/2`); the set of such signatures is infinite. *Needs:* 0.1,
2.5; TeichmullerGeometry §10.1; Tau Ceti `natCard_le_eighty_four_mul_genus_sub_one`.

**Checks.**

- For the Klein quartic, 168=84(3−1) and μ=1/42, so both sides of the equality characterization hold.
- For C₁₀,(0;2,5,10), 10<84 and μ=1/5, so both sides of the equality characterization fail.
- For the trivial genus-two action, 1≤84 and μ=2; it is not a large action since 1≤4.

### 4.4 Harvey's criterion for cyclic groups

For `n>0`, `G = Multiplicative (ZMod n)` and a hyperbolic `σ = (h; m₁, …, m_r)`, `GenVector G σ ≠ ∅` iff, with
`M := lcm (m₁, …, m_r)`: (i) `M ∣ n`, and `M = n` if `h = 0`; (ii) `lcm` of any `r − 1` of the `m_j`
equals `M`; (iii) `r ≠ 1`, and `r ≥ 3` if `h = 0`; (iv) if `M` is even, the number of `m_j` divisible
by the maximal power of `2` dividing `M` is even (Harvey, Theorem 4; `harvey_iff`). The proof is elementary
number theory on `ZMod n`: the product relation is `Σ c_j = 0` and the orders are `n / gcd(c_j, n) = m_j`.
*Needs:* 0.2; Mathlib `ZMod`, `Nat.lcm`.

**Checks.**

- At n=1, `(2;∅)` has M=1 and gives a vector; at n=0 the finite-cyclic hypothesis is excluded.
- At n=2, six periods 2 have even maximal 2-power count 6 and admit the all-involution vector; five such periods have count 5 and product sum 1, so fail.
- At n=10, `(0;2,5,10)` has M=10, deletion lcms 10,10,10 and two maximal-even entries; `(1;2)` fails the single-branch condition.

### 4.5 The Wiman bound

For a positive integer n and cyclic G of order n acting on X of genus g≥2,
`wiman` states `|G| ≤ 4g + 2`, with equality iff
`σ = (0; 2, 2g + 1, 4g + 2)` (`wiman_eq_iff`); and every cyclic group of order `4g + 2` acts in genus `g`
(`ZMod (4g+2)` with `c = (2g + 1, 2, 2g − 1)` in additive notation: orders `2, 2g + 1, 4g + 2` since
`gcd (2g − 1, 4g + 2) = 1`, sum `4g + 2 ≡ 0`, generating; the curve `y² = x^{2g+1} − 1` with
`(x, y) ↦ (ζ_{2g+1} x, −y)`). Proof: by 4.4 and 1.4 with `r ≥ 3`, `h = 0`, `M = n`, the minimum of
`μ` over signatures satisfying Harvey's conditions with `lcm = n` is attained at
`(2, 2g + 1, 4g + 2)`; for `h ≥ 1`, `μ ≥ 1/2` gives `n ≤ 4g − 4`. Consequently every
element of Aut X has order `≤ 4g + 2`, and every `m_j ≤ 4g + 2` (used in 4.6). *Needs:* 4.4,
1.4, 2.5.

**Checks.**

- At g=2, n=10, the vector (5,2,3) has orders 2,5,10 and sum 0; 10=4·2+2.
- At g=3, n=14, the vector (7,2,5) has orders 2,7,14 and sum 0; 14=4·3+2.
- The unramified trivial genus-two action has n=1<10 and no triangle periods; both sides of the equality characterization are false.

### 4.6 Finiteness in a given genus

For each `g ≥ 2`, the realized data `(G,σ,v)` with G finite, σ hyperbolic,
`v : GenVector G σ` and `Signature.genusOfOrder σ |G|=g` have
`|G|≤84(g−1)`, `h≤g` and `m_j≤4g+2`. The branch bound is
`r≤4(g−1)/|G|−4h+4`; its stronger form `r≤2g+2−4h` requires `|G|≥2`.
There are finitely many such data up to group isomorphism: finitely many group structures of
bounded order, finitely many signatures within these bounds and finitely many vectors.
Prove the exact genus-two and genus-three classifications of realized pairs in Broughton
Tables 4–5 by group-theoretic and signature arguments. This theorem concerns realized data;
numerical Riemann–Hurwitz solutions without a vector have no asserted Wiman bound.
*Needs:* §§0.2, 1.4, 4.3–4.5; Broughton Tables 4–5.

**Checks.**

- `n=15,(0;2,3,30)` has `μ=2/15` and rational genus `2`, but `30>4·2+2`;
  no order-15 group has an element of order 30, so it is excluded from realized data.
- `C₁₀,(0;2,5,10)` has genus 2 and attains the period bound `10=4·2+2`.
- The trivial genus-two action has h=2, r=0 and satisfies the general bound with equality.

### Examples

C₁₀ in genus two attains Wiman; PSL₂(𝔽₇) in genus three attains Hurwitz; the trivial genus-two action has full moduli dimension three.

### Dependencies

Layers 0–2; Layer 3 only for topological-class invariance; TeichmullerGeometry §§5.6, 8.4, 10.1; ComplexCurveModuli D0.

## Layer 5: full automorphism groups and Singerman's list

Sources: Singerman, *Finitely maximal Fuchsian groups*, Theorem 1 (the list); Ries,
*Subvarieties of moduli space determined by finite groups acting on surfaces*, §3; Bujalance–Cirre–
Conder, *On extendability of group actions on compact Riemann surfaces*, §§3–4 (the extension
conditions on generating vectors); §5.2’s all-signature genericity theorem.

### 5.1 Full actions

An action is full when its embedding into the holomorphic automorphism group is surjective.
An extension datum consists of a finite group G′, an injection `ι : G →* G′`, and a generating
vector w such that the restricted topological action is equivalent to v. Such a datum occurs
on the realizations of w; it need not occur on every complex realization of v. Prove
`|G′|μ(σ′)=|G|μ(σ)` and hence `[G′:G]=μ(σ)/μ(σ′)`, with both denominators positive,
and compute restriction signatures by §2.6 (Bujalance–Cirre–Conder §2, pp.1539–1540).
*Needs:* §§1.1, 2.3–2.6, 3.4.

**Checks.**

- Restricting C₁₀,(0;2,5,10) to C₂ gives μ-values 1/5 and 1, hence index 1/(1/5)=5.
- The identity inclusion has index 1 and equal μ-values.
- For the genus-two bielliptic action, C₂⊂C₂² has index 2 and μ-values 1 and 1/2.

### 5.2 Generic fullness and the family

For a marked topological action v, let F_v be its fixed locus in Teich(Σ_g). Define generic
fullness to mean that outside a proper closed analytic subset of F_v the full holomorphic
automorphism group equals the given G. A generic extension is an extension datum together
with a choice of topological restriction identification for which the holomorphic map
`F_w → F_v` has image F_v. Equivalently, its image is dominant: these images are closed
fixed loci. Prove that, for these inclusion maps between connected fixed loci, this holds
exactly when `dim F_w = dim F_v`; equality of dimensions of arbitrary spaces is not enough.

Prove that v is generically full iff it has no proper generic extension. The route uses
proper discontinuity of the closed-surface mapping-class action, finiteness of stabilizers,
the Hurwitz bound, and the local finiteness of the extra-automorphism fixed loci; a proper
fixed submanifold has smaller dimension. Apply the equal-dimension Fuchsian-inclusion
classification of §5.3 and the kernel-extension conditions of §5.4. This is the all-signature
genericity theorem, including branched quotients (Bujalance–Cirre–Conder §1, pp.1537–1538;
Ries §3). *Needs:* §§3.4, 4.2–4.3, 5.1; TeichmullerGeometry §§3.3, 5.6, 8.4;
§§5.3–5.4 for the explicit classification consequence.

**Checks.**

- `C₂,(0;2⁶)` extends on `y²=x⁵−1` to `C₁₀,(0;2,5,10)`, but the dimensions are 3 and 0;
  this is a special extension and does not refute generic fullness of the C₂ family.
- `C₂,(1;2,2)` and its generic `C₂²,(0;2⁵)` extension both have dimension 2.
- In a triangle family both dimensions are 0; a nonempty extension image is the whole point.

### 5.3 Singerman's list

**Theorem.** Every proper inclusion of cocompact orientable Fuchsian groups whose marked
Teichmüller spaces have equal dimension has one of the signature pairs below, up to
marking and reordering periods. Conversely each row has such an inclusion, with its pullback
map onto the smaller group’s Teichmüller space. An action extends along that inclusion
exactly under §5.4’s kernel condition. Thus a non-generically-full action has a generic
extension in this list (Bujalance–Cirre–Conder Table 1, p.1539).

| `σ` | `σ'` | `d` | normal |
| --- | --- | --- | --- |
| `(2; −)` | `(0; 2, 2, 2, 2, 2, 2)` | 2 | yes |
| `(1; t, t)` | `(0; 2, 2, 2, 2, t)` | 2 | yes |
| `(1; t)` | `(0; 2, 2, 2, 2t)` | 2 | yes |
| `(0; t, t, t, t)` | `(0; 2, 2, 2, t)` | 4 | yes |
| `(0; t₁, t₁, t₂, t₂)` | `(0; 2, 2, t₁, t₂)` | 2 | yes |
| `(0; t, t, t)` | `(0; 3, 3, t)` | 3 | yes |
| `(0; t, t, t)` | `(0; 2, 3, 2t)` | 6 | yes |
| `(0; t₁, t₁, t₂)` | `(0; 2, t₁, 2t₂)` | 2 | yes |
| `(0; 7, 7, 7)` | `(0; 2, 3, 7)` | 24 | no |
| `(0; 2, 7, 7)` | `(0; 2, 3, 7)` | 9 | no |
| `(0; 3, 3, 7)` | `(0; 2, 3, 7)` | 8 | no |
| `(0; 4, 8, 8)` | `(0; 2, 3, 8)` | 12 | no |
| `(0; 3, 8, 8)` | `(0; 2, 3, 8)` | 10 | no |
| `(0; 9, 9, 9)` | `(0; 2, 3, 9)` | 12 | no |
| `(0; 4, 4, 5)` | `(0; 2, 4, 5)` | 6 | no |
| `(0; n, 4n, 4n)` | `(0; 2, 3, 4n)` | 6 | no |
| `(0; n, 2n, 2n)` | `(0; 2, 4, 2n)` | 4 | no |
| `(0; 3, n, 3n)` | `(0; 2, 3, 3n)` | 4 | no |
| `(0; 2, n, 2n)` | `(0; 2, 3, 2n)` | 3 | no |

Call the normal rows N1–N8 and the remaining rows T1–T11, in table order.
Parameters are at least two and both signatures must be hyperbolic. Repeated or unsorted
periods are transported to the displayed order by Hurwitz moves, never plain permutation.
The classification uses Fuchsian inclusions and equality of Teichmüller dimensions, not just
the equation `μ(σ)=dμ(σ′)`. In the action on d cosets, a cycle of length ℓ of a target elliptic
generator of order m contributes a source period `m/ℓ` when that number exceeds one;
length-m cycles contribute no period. Prove this rule and the genus formula from the orbifold
covering (Bujalance–Cirre–Conder §2 and Table 1, pp.1539–1540; Singerman Theorem 1).
*Needs:* §§2.6, 4.2, 5.1; FuchsianOrbifolds Layers 1–2.

**Checks.**

- N1 has zero source periods and six target periods; `μ=2=2·1` and both dimensions are 3.
- T1 has source periods `(7,7,7)` and target `(2,3,7)`; `4/7=24·(1/42)`.
  The coset permutations have cycles `2¹²`, `3⁸`, and `1³7³`, respectively.
- N4 has index four and quotient C₂²; it is not a cyclic order-four extension.

### 5.4 The extension criterion

Fix a row inclusion and its marking. In N1 write `(a,b,c,d)=(a₁,b₁,a₂,b₂)`;
in N2 use `(a,b,x,w)=(a₁,b₁,c₁,c₂)` with `xw[a,b]=1`;
in N3 use `(a,b,x)=(a₁,b₁,c₁)` with `x=[a,b]⁻¹`.
In N4–N5 use `(a,b,c,d)=(c₁,c₂,c₃,c₄)`, and in N6–N8 and T1–T11
use `(a,b,c)=(c₁,c₂,c₃)` in the displayed row order. The branch-first relation in N2–N3
is equivalent to our handle-first relation, since their two products are mutual inverses.
All conjugations in the following conditions mean `u v u⁻¹`, and automorphism products
mean composition. These are conditions on the labelled generators after the chosen marking.

For the normal rows the following assignments must extend to automorphisms A (and B) of G.
Require `A²=1` for N1–N5 and N8, `A³=1` for N6–N7, and `B²=1` where B occurs.

| Row | Images under A | Images under B and compatibility |
| --- | --- | --- |
| N1 | `a↦a⁻¹`, `b↦ab⁻¹a⁻¹`, `c↦(b⁻¹cd)c⁻¹(b⁻¹cd)⁻¹`, `d↦(b⁻¹c)d⁻¹(b⁻¹c)⁻¹` | One involutory lift |
| N2 | `a↦a⁻¹`, `b↦b⁻¹`, `x↦(ab)⁻¹x⁻¹(ba)`; `w=x⁻¹[a,b]⁻¹` determines its image | One involutory lift |
| N3 | `a↦a⁻¹`, `b↦b⁻¹`, `x↦(ba)⁻¹x(ba)` | One involutory lift |
| N4 | `(a,b,c,d)↦(b,a,a⁻¹da,bcb⁻¹)` | `B:(a,b,c,d)↦(d,d⁻¹cd,aba⁻¹,a)`; `BAB=A∘Inn(bd)` |
| N5 | `(a,b,c,d)↦(b,a,a⁻¹da,bcb⁻¹)` | One involutory lift |
| N6 | `(a,b,c)↦(b,c,a)` | One order-three lift |
| N7 | `(a,b,c)↦(b,c,a)` | `B:(a,b,c)↦(c,c⁻¹bc,a)`; `BAB=Inn(c⁻¹)∘A⁻¹` |
| N8 | `(a,b,c)↦(b,a,bcb⁻¹)` | One involutory lift |

Prove necessity and sufficiency row by row. For N4 construct lifts u,v with
`u²=v²=1`, conjugations A,B, and `vuv=u·bd`; the quotient is C₂².
For N7 require `u³=v²=1`, conjugations A,B, and `vuv=c⁻¹u⁻¹`; the quotient is S₃.
Prove the compatibility and group embeddings from the stated assignments; the lifts have
exact orders even when the induced automorphism has smaller order (Bujalance–Cirre–Conder
§3, cases N1–N8, pp.1541–1544).

For each nonnormal row, the condition is the existence of a finite group H containing G
injectively with the table index d, and elements u (and v in T4) satisfying the next table.
H is generated by u and c, except in T2 by a and u and in T4 by u and v.
In the ordinary rows the target triple is `((uc)⁻¹,u,c)`; in T2 it is
`(a,u,(au)⁻¹)`, in T4 `((uv)⁻¹,u,v)`, and in T10 `(u,(cu)⁻¹,c)`.
Require that triple to have the exact orders of σ′. This condition includes generation,
exact index, the displayed word equations, and injectivity of G; it is not a search specification.

| Row | Power relations | Restriction equations |
| --- | --- | --- |
| T1 | `u³=(uc)²=1` | put `t=u⁻¹c²uc⁻²u`; `a=tct⁻¹`, `b=t⁻¹ct` |
| T2 | `u³=(au)⁷=1` | `b=(uau)⁻¹au(uau)`, `c=(uau⁻¹)au(uau⁻¹)` |
| T3 | `u³=(uc)²=1` | `a=uc⁻²uc²u⁻¹`, `b=u⁻¹c²uc⁻²u` |
| T4 | `u³=v⁸=(uv)²=1` | `a=v²`, `b=(uv⁻¹u)v(u⁻¹vu⁻¹)`, `c=(u⁻¹v⁻²u)v(u⁻¹v²u)` |
| T5 | `u³=(uc)²=1` | `a=uc⁻²uc²u⁻¹`, `b=u⁻¹c²u⁻¹cuc⁻²u` |
| T6 | `u³=(uc)²=1` | put `t=uc³u⁻¹`; `a=tct⁻¹`, `b=t⁻¹ct` |
| T7 | `u⁴=(uc)²=1` | `a=u²cuc⁻¹u²`, `b=u⁻¹cuc⁻¹u` |
| T8 | `u³=(uc)²=1` | `a=u⁻¹c⁴u`, `b=u⁻¹c⁻²ucu⁻¹c²u` |
| T9 | `u⁴=(uc)²=1` | `a=uc²u⁻¹`, `b=u²cu²` |
| T10 | `u²=(cu)³=1` | `a=uc(cu)⁻¹c⁻¹u`, `b=uc³u` |
| T11 | `u³=(uc)²=1` | `a=u(uc)u⁻¹`, `b=u⁻¹c²u` |

Prove that these word equations give precisely the restriction of a smooth epimorphism
from the target signature group to H, with the same kernel as the original epimorphism
from the source group to G. Exact target orders give a torsion-free kernel; injectivity and
the equality of indices make the two kernels equal. Conversely an extension supplies these
elements and equations. Include all choices of row marking when deciding whether an
unmarked action has an extension (Bujalance–Cirre–Conder §4, cases T1–T11, pp.1544–1548).
The equal-dimension property in §5.3 makes these generic extensions.
*Needs:* §§0.5, 2.2, 2.6, 3.3–3.4, 5.1–5.3.

**Checks.**

- N2 sends x to `(ab)⁻¹x⁻¹(ba)`, not just w: with `a=(12), b=(23), x=(12)` in S₃,
  `w=(23)`, while the displayed image of x is `(12)`, not w. This is a vector of
  signature `(1;2,2)` and genus four; both peripheral entries retain order two.
- N4 with the abelian vector `(a,b,c,d)=(x,y,−x,−y)` in C₃² has A and B swapping
  coordinates with the specified signs; both square to one and `BAB=A`, since `Inn(bd)=1`.
- N7 in C₄² with `(a,b,c)=(x,y,−x−y)` has `A³=B²=1`, `BAB=A⁻¹`, and `abc=1`.
  Its quotient permutation group has order six, not a cyclic order-six generator.
- In every row verify the restriction product and exact source orders before applying
  the criterion; the powers alone would allow a trivial target triple, excluded by exact orders.

### 5.5 The generic full group

An overgroup datum defines the generic full group of v when it is a generic extension of v
and its extended action is generically full. Prove existence by taking the common stabilizer
on the complement of the proper extra-automorphism loci, and uniqueness up to isomorphism
of the embedded action by comparing stabilizers at a point in the intersection of the two
dense open sets. Its group isomorphism class, signature and family prefix depend only on
the topological action class (Ries §3; Bujalance–Cirre–Conder §1).
*Needs:* §§4.2, 5.2–5.4; TeichmullerGeometry §§3.3, 5.6.

**Checks.**

- For the genus-two hyperelliptic family the generic group is C₂, although a special
  member has C₁₀; the latter datum is excluded by `0<3` for dimensions.
- For `C₂,(1;2,2)` the generic extension has index two, order four and dimension two.
- A datum extending v by index one leaves the generic group unchanged.

### Examples

The index-five C₂⊂C₁₀ genus-two extension occurs at a special point; the bielliptic index-two extension preserves dimension two.

### Dependencies

Layers 2–4; TeichmullerGeometry §§3.3, 5.6, 8.4; FuchsianOrbifolds Layers 1–2. The equal-dimension inclusion classification and row criteria are owned here.

## Layer 6: fixed points, hyperelliptic and cyclic-trigonal families

Sources: Macbeath, *Action of automorphisms of a compact Riemann surface on the first homology
group*, §2 (the fixed-point formula); Breuer §10, p.35 (fixed points); Farkas–Kra III.7;
Swinarski §2.1 (arXiv:1607.04778v1); `HyperellipticCurves` 1.4.

### 6.1 Macbeath's fixed-point formula

For `v : GenVector G σ` realized on `X_v` and `1 ≠ γ ∈ G`:
`#Fix(γ) = |N_G ⟨γ⟩| · Σ_{j=1}^{r} ε_j(γ) / m_j`, where `ε_j(γ) = 1` if `γ` is conjugate to an element
of `⟨c_j⟩` and `0` otherwise; equivalently `|C_G(γ)| · Σ_j #(cl(γ) ∩ ⟨c_j⟩) / m_j`, the centralizer form of the same formula. The sum is in `ℚ` and the result is a natural number. Proof: the fixed
points of `γ` lie over branch points; the fibre over `y_j` is the `G`-set `G/⟨c_j⟩` (1.2–1.3 and 2.3),
`γ` fixes the coset `x⟨c_j⟩` iff `x⁻¹ γ x ∈ ⟨c_j⟩`, and a cyclic group contains at most one subgroup
of each order, so the number of fixed cosets is `|C_G(γ)| · #(cl(γ) ∩ ⟨c_j⟩) / m_j = |N_G ⟨γ⟩| ε_j(γ)/m_j`.
Corollaries: `#Fix(γ) ≤ 2g + 2` (Riemann–Hurwitz for `⟨γ⟩`), fixed-point counts are invariant for labelled topological equivalence and satisfy
`FixCount(α·v,α(γ))=FixCount(v,γ)` for every group automorphism α, and `#Fix(γ) = #Fix(γ^k)` for `k` coprime to `orderOf γ`. *Needs:*
1.2–1.4, 2.3, 3.4.

**Checks.**

- For C₂,(0;2⁶), the nonidentity count is 2·6/2=6; for `(1;2,2)` it is 2·2/2=2.
- For S₃,(0;2,2,3,3), a transposition fixes 2 points and a 3-cycle fixes 4; centralizer sizes 2 and 3 yield the same counts as the normalizer formula.
- In C₃² with `(x,x,x²,x²,y,y²)`, x fixes 12, y fixes 6 and xy fixes 0; exchanging x,y transports these labels. The identity is excluded because it fixes the whole surface.

### 6.2 The hyperelliptic criterion on a group

IsHyperellipticVector v :↔ ∃ ι : G, orderOf ι = 2 ∧ #Fix(ι) = 2g + 2. Prove: such `ι` has
`genus (X_v / ⟨ι⟩) = 0` (Riemann–Hurwitz for `⟨ι⟩`), so `X_v` is hyperelliptic and `ι` is its
hyperelliptic involution, central in Aut X_v and unique (`HyperellipticCurves` 1.4 through `ℳ(X_v)`
and 10B); conversely if `X_v` is hyperelliptic and its involution lies in `G` then the predicate
holds. The predicate is decidable from `v` by 6.1 and invariant under topological equivalence.
*Needs:* 6.1, 1.4; `HyperellipticCurves` 1.4; modular forms 10B.

**Checks.**

- C₂,(0;2⁶) satisfies 6=2·2+2 and has a unique witnessing involution.
- C₂,(1;2,2) has 2≠6 and does not satisfy the predicate on G.
- C₄,(0;2,2,4,4) has count 6 at its involution and satisfies the predicate even though its generic action is not full.

### 6.3 The hyperelliptic family

hyperelliptic v :↔ IsHyperellipticVector (fullCertificate v).w (convention 14): the generic member
of the family is hyperelliptic. Prove: if IsHyperellipticVector v then hyperelliptic v (the
involution of `G` is the involution of `G'`); hyperelliptic v ↔ every surface in the family is
hyperelliptic (the hyperelliptic locus is closed and contains a dense open subset of the
fixed locus); for `g = 2` every `v` is hyperelliptic; and the criterion agrees with the hyperelliptic function-field predicate through ModularForms
10B and HyperellipticCurves §1.4. Construct the hyperelliptic involution as an element of
`{ι : G // orderOf ι=2 ∧ FixCount(v,ι)=2g+2}` only under a proof that this subtype is nonempty.
Otherwise its optional value is none. On a hyperelliptic surface, absence of this involution
from G implies the action is not full; absence from G for the generic member implies failure
of generic fullness. Neither converse holds. *Needs:* §§5.5, 6.2; HyperellipticCurves §1.4.

**Checks.**

- `C₄,(0;2,2,4,4)`, vector `(2,2,1,3)`, has genus 2 and its involution fixes
  `4(1/2+1/2+1/4+1/4)=6` points; it is present despite an index-two generic extension.
- `C₂,(1;2,2)` has only two fixed points in G, while its genus-two surfaces are hyperelliptic;
  the optional involution in G is none.
- For `C₂,(0;2⁶)`, the value is the unique nonidentity element and the count is six.

### 6.4 Cyclic trigonal families

An action contains a cyclic trigonal subgroup when an element τ has order three and
`FixCount(v,τ)=g+2`. Prove equivalence with a degree-three cyclic quotient of genus zero:
Riemann–Hurwitz reads `2g−2=3(−2)+2·FixCount(v,τ)`. Define the family predicate on the
generic full group. Construct a witness in G only from a proof of this existential condition;
its values form a subtype, with τ and τ⁻¹ both allowed. No canonical choice of generator is
asserted. For g≥5 prove uniqueness of the cyclic trigonal subgroup, hence normality: two
distinct degree-three rational subfields generate the curve field, and Castelnuovo–Severi
would force g≤(3−1)(3−1)=4 (AlgebraicCurves Layer 8, Castelnuovo’s inequality).
For g≤4 retain the existential predicate without claiming uniqueness. Prove invariance of the existential predicate under topological equivalence using
§6.1's equivariance, and agreement with the corresponding cyclic degree-three subextension
of the meromorphic function field (Swinarski, §2.1, p.5; Riemann–Hurwitz).
*Needs:* §§1.4, 5.5, 6.1; ModularForms 10B; AlgebraicCurves Layers 6–8, 12.

**Checks.**

- In the S₃ genus-two example, both 3-cycles fix four points: `2=−6+2·4`.
- In the C₃² genus-ten example, x fixes 12 points and y fixes 6; only the former
  gives genus-zero quotient, since `18=−6+24` while `18=6+12` gives quotient genus two.
- C₂ has no element of order three; the witness subtype is empty, so no element is returned.

### Examples

The C₄ genus-two action contains the hyperelliptic involution while remaining non-full; the bielliptic C₂ action does not contain it.

### Dependencies

Layers 1–3 and §5.5; HyperellipticCurves §1.4; ModularForms 10B; AlgebraicCurves Layers 6–8, 12.

## Layer 7: differentials, the Eichler trace formula, and the Jacobian decomposition

Sources: Farkas–Kra V.2.9 (Eichler's trace formula); Chevalley–Weil 1934 with Weil's correction,
in Breuer's discussion of holomorphic differentials (§7, p.25); Kani–Rosen 1989, Theorems A–C;
Lange–Recillas, arXiv:math/0106055v2, §§1–3; Paulhus 2008 (the LMFDB's `jacobian_decomp` source).

### 7.1 The Eichler trace formula

For `1 ≠ γ ∈ G` acting on `X` of genus `g ≥ 2`:
`Tr (γ^* | H⁰(X, Ω)) = 1 + Σ_{P ∈ Fix γ} ζ_P(γ) / (1 − ζ_P(γ))`, with `ζ_P(γ)` the rotation constant
of convention 9; hence `χ_Ω(γ) = 1 + Σ_P \overline{ζ_P(γ)} / (1 − \overline{ζ_P(γ)})` for the
representation of convention 10 (`Fix γ⁻¹ = Fix γ`, `ζ_P(γ⁻¹) = \overline{ζ_P(γ)}`). Proof through the
holomorphic Lefschetz fixed-point formula or, as Farkas–Kra, through the Riemann–Roch count of
the eigenspaces of `γ` on `H⁰(X, Ω)`, i.e. the differentials on `X/⟨γ⟩` with prescribed orders at
the branch points (10B's Riemann–Roch on `X/⟨γ⟩`). *Needs:* 1.2, 1.5; modular forms 10B.

**Checks.**

- For the genus-two hyperelliptic involution, ζ=−1 at six points, so 1+6(−1/2)=−2, its differential trace.
- For a genus-two bielliptic involution, two such points give 1+2(−1/2)=0.
- On the genus-one equianharmonic torus, 1+3ω/(1−ω)=ω; inverse pullback has trace ω². This off-genus test distinguishes the two conventions.

### 7.2 The Chevalley–Weil formula

For `v : GenVector G σ` realized on `X_v` and an irreducible `ρ` of `G` over `ℂ` with character `χ`:
`⟨χ, χ_Ω⟩ = χ(1) (h − 1) + Σ_{j=1}^{r} Σ_{k=1}^{m_j − 1} N_{j,k}(ρ) · k/m_j + [χ = 1]`, where
`N_{j,k}(ρ)` is the multiplicity of `ζ_{m_j}^k` as an eigenvalue of `ρ(c_j)`, and `ζ_{m_j}` is the
rotation constant `ζ_{P_j}(c_j)` at a fixed point `P_j` of `c_j` over the `j`-th branch point, which
convention 8 (counterclockwise `γ_j`, lifted through the local model `z ↦ z^{m_j}`) makes
`exp(2πi/m_j)`. Proof: average 7.1 over `G` using 6.1 for the fixed points of each `c_j^k` and their
rotation constants. The formula determines the labelled character from v and is equivariant:
`χ_(α·v)(α(γ))=χ_v(γ)`, equivalently `χ_(α·v)=χ_v∘α⁻¹`. Thus Aut(G) permutes
constituents rather than fixing their labels; its total `Σ_χ χ(1) ⟨χ, χ_Ω⟩ = g`
is 1.4. The weight `k/m_j` is forced by conventions 8–10: the same formula with weight
`(m_j − k)/m_j` computes the multiplicities for the contravariant action `γ ↦ γ^* = ρ_Ω(γ⁻¹)`, i.e.
reads `N_{j,k}` on `ρ(c_j)⁻¹`, and a source's convention is identified by the checks `y² = x⁵ − 1`
and `(0; 3, 3, 3)` in the worked examples, where the two weights give different answers. *Needs:*
1.5, 6.1, 7.1.

**Checks.**

- For C₂,(0;2⁶), the trivial multiplicity is 0 and the nontrivial one is −1+6/2=2.
- For C₅,(1,1,3), multiplicities of χ₁ through χ₄ are (0,0,1,1); scaling the vector by 2 gives (0,1,0,1).
- For the unramified trivial genus-two action, the sole character has multiplicity (2−1)+1=2; the invariant correction cannot be omitted.

### 7.3 The homology representation and `End(Jac X) ⊗ ℚ`

The period-lattice and Abel–Jacobi comparison of MordellLawrenceVenkatesh §8.11 identifies
`Jac(X)(ℂ)` with `H⁰(X,Ω)^∨ / H₁(X,ℤ)` and identifies its integral homology with that of X,
naturally under curve automorphisms. Consume this comparison, including independence of
base point, and tensor it with ℚ. Use the differential/homology comparison to identify the
character of `H₁(X,ℚ)` as `χ_Ω+χ̄_Ω`. The action on the Jacobian is pushforward (equivalently
inverse pullback on Pic⁰), matching the covariant action on homology. It induces
`ℚ[G] → End(Jac X) ⊗ ℚ → End_ℚ(H₁(X,ℚ))`; prove that this composite is the homology
representation (Lange–Recillas, arXiv:math/0106055v2, §1, Proposition 1.1 and diagram (1.3)).
*Needs:* §§1.5, 7.2; JacobianChallenge Layers D–F; MordellLawrenceVenkatesh §8.11.

**Checks.**

- In genus two the period lattice has integral rank four in a complex dual of dimension two;
  a rank-two lattice in that dual would not give a compact Jacobian.
- On the genus-two hyperelliptic curve the involution acts by −1 on both holomorphic
  differentials and rank-four homology: the traces are −2 and −4, respectively.
- Changing the Abel–Jacobi base point translates the torus and acts by the identity on
  homology; the identity curve automorphism gives the identity endomorphism in the composite.

### 7.4 Kani–Rosen

**Theorem A.** For idempotents `ε₁, …, ε_s, ε'₁, …, ε'_t ∈ ℚ[G]` with `Σ ε_i = Σ ε'_j` (an idempotent
relation), `Π ε_i(Jac X) ∼ Π ε'_j(Jac X)` (isogeny), where `ε(Jac X)` is the image abelian
subvariety of `n ε` for a positive integer `n` clearing denominators. **Theorem B.** For subgroups
`H₁, …, H_s, H'₁, …, H'_t ≤ G` with `Σ ε_{H_i} = Σ ε_{H'_j}` in `ℚ[G]` (`ε_H = |H|^{-1} Σ_{h ∈ H} h`),
`Π Jac(X/H_i) ∼ Π Jac(X/H'_j)`, since `ε_H(Jac X) ∼ Jac(X/H)` with `dim = genus (X/H)` (1.4). **Theorem C** (the form used for the LMFDB's genus-2 records): for subgroups `H₁, …, H_t ≤ G`
with `Σ_i ε_{H_i} = 1 + (t − 1) ε_G` in `ℚ[G]` (an identity checked coefficientwise; Kani–Rosen's
sufficient condition is `H_i H_j = G` for `i ≠ j` together with `Σ_i 1/|H_i| = 1 + (t − 1)/|G|`),
`Jac X × Jac(X/G)^{t−1} ∼ Π_i Jac(X/H_i)`. For `G = C₂ × C₂` with `genus (X/G) = 0` and its three
subgroups of order two this is `Jac X ∼ Jac(X/H₁) × Jac(X/H₂) × Jac(X/H₃)`.
*Needs:* 7.3; Jacobian challenge Layer E (isogenies, images of endomorphisms, `dim`), 1.4.

**Checks.**

- For C₂² and its three order-two subgroups, each nonidentity coefficient in their averaging sum is 1/2 and the identity coefficient is 3/2, agreeing with 1+2ε_G.
- The averaging idempotent for G=1 is 1 and its image is the full Jacobian.
- The zero idempotent has zero-dimensional image; replacing it with the identity gives dimension g, so the image construction cannot ignore the idempotent.

### 7.5 The group-algebra decomposition (Lange–Recillas)

Let `e₁, …, e_s` be the primitive central idempotents of `ℚ[G]` (one per irreducible `ℚ`-character
`W_i`, i.e. per Galois orbit of irreducible `ℂ`-characters; Tau Ceti's `CharacterTable` idempotents
over `ℂ` summed over Galois orbits, with their orthogonality and `Σ e_i = 1`). Then
`Jac X ∼ B₁ × ⋯ × B_s` with `B_i := e_i(Jac X)` (7.4 Theorem A), and each `B_i ∼ A_i^{n_i}` with
`n_i = χ_i(1) / s_i` (`χ_i` an irreducible constituent of `W_i`, `s_i` its Schur index over `ℚ`), the
*group-algebra decomposition*. Dimensions: `dim B_i = ½ · dim_ℚ (e_i H₁(X, ℚ)) = ½ |Gal-orbit of χ_i| · χ_i(1) · (⟨χ_i, χ_Ω⟩ + ⟨\bar χ_i, χ_Ω⟩)`,
computed from 7.2, and `dim A_i = dim B_i / n_i`; `B_i = 0` iff `⟨χ_i, χ_Ω⟩ = 0 = ⟨\bar χ_i, χ_Ω⟩`;
the trivial character gives `B₁ ∼ Jac(X/G)` of dimension `h`. The factors `A_i` need not be
simple and distinct `A_i` may be isogenous (the LMFDB's note); nothing here asserts otherwise.
*Needs:* 7.3–7.4; Mathlib `IsSemisimpleRing.exists_algEquiv_pi_matrix_divisionRing_finite`;
Tau Ceti `CharacterTable.{CentralIdempotent, IdempotentDecomposition}` for the split complex blocks;
ArithmeticGaloisRepresentations §5.6 for rational descent and Schur indices.

**Checks.**

- For the genus-two hyperelliptic action the nontrivial rational component has homology dimension 4, hence abelian dimension 2 and multiplicity 1.
- For the Klein quartic the nontrivial rational component has homology dimension 6, hence dimension 3 and multiplicity 3, yielding an elliptic factor cubed.
- For the trivial action only the trivial idempotent survives, with dimension g; an empty decomposition would have total dimension 0.
- For Q₈ with vector `(i,j,−k)` of signature `(0;4,4,4)`, g=2 and the quaternionic character has multiplicity −2+3=1; its block has `[D:ℚ]=4`, s=2 and complex degree 2, hence n=1, not 2; the nontrivial C₃ block has centre ℚ(ζ₃), s=1, n=1 and rational degree 2.

### 7.6 The LMFDB's decomposition record

jacobianDecomp v : List (ℕ × ℕ) lists `(dim A_i, n_i)` over the `i` with `B_i ≠ 0`, computed from
`v` through 7.2 and 7.5; prove `Σ dim A_i · n_i = g` and invariance under topological equivalence
(§7.2 permutes the rational constituents under Aut(G), so the unlabelled multiset
of dimension/multiplicity pairs is unchanged). The LMFDB's third entry `c` (a Magma character index) is not a
target. For `h = 0`, `B₁ = 0` (no trivial constituent), and when `G` is
abelian every `n_i = 1`. *Needs:* 7.2, 7.5, 3.4.

The list is compared up to permutation; its display order is the LMFDB character order.

**Checks.**

- `2.2-1.0.2-2-2-2-2-2` (`C₂`, `(0; 2⁶)`): `[(2, 1)]`, and `2 · 1 = 2 = g`.
- `2.2-1.1.2-2` (`C₂`, `(1; 2, 2)`): `[(1, 1), (1, 1)]`, one entry from the trivial
  character (`h = 1`); `1 + 1 = 2 = g`.
- `3.168-42.0.2-3-7` (Klein quartic): `[(1, 3)]`, so `Jac ∼ E³` and `1 · 3 = 3 = g`.
- For `h = 0` no entry comes from the trivial character; for abelian `G` every `n_i = 1`.

### Examples

The genus-two hyperelliptic decomposition is [(2,1)]; the Klein-quartic decomposition is [(1,3)].

### Dependencies

§§1.5, 6.1; ModularForms 10B; MordellLawrenceVenkatesh §8.11; JacobianChallenge Layers D–F; ArithmeticGaloisRepresentations §5.6; Tau Ceti CharacterTable idempotents.

## Layer 8: the hgcwa record

### 8.1 Label prefixes

The family prefix is `(g, [G], h, m)`: genus (2.5), the isomorphism class of `G` (displayed as its
small-group identifier, which is not a target), the
quotient genus and the sorted periods (0.1).
The refined-passport prefix adds the class vector `refinedPassport v` as a function
`Fin r → ConjClasses G` (3.1); the suffix `x` ordering those vectors, and the generating-vector suffix
`y`, are not targets. Prove: two generating vectors with different family prefixes are
not topologically equivalent (3.4 preserves `g, [G], σ`; Aut(G) may move the class vector, so two
refined passports can be topologically equivalent — the worked example `3.168-42.0.2-3-7` — and the
ordered class vectors can also be permuted by marked-surface maps). *Needs:*
0.1, 2.5, 3.1, 3.4.

**Checks.**

- The C₂ genus-two signatures `(0;2⁶)` and `(1;2,2)` have different family prefixes and quotient genera 0 and 1.
- The Klein-quartic family has two refined passports but one topological class; different refined prefixes do not imply inequivalence.
- The two unramified C₂² vectors of §8.2 have the same family prefix and empty passport but distinct fundamental classes 1 and 0.

### 8.2 The record as theorems

Define records of intrinsic family data and of a chosen generating vector, with each field
carried by the equivalence relation on which it is well defined. Genus, group isomorphism
class, group order, signature and dimension descend to the family prefix. The ordered
refined passport descends to simultaneous conjugation and is equivariant under Aut(G).
The inner class descends to simultaneous conjugation; the braid class to §3.3; the topological
class, generic full group, family booleans and unlabelled Jacobian decomposition descend
to §3.4. Labelled fixed-point functions, characters and witness elements obey the equivariance
laws of §§6.1–7.2, rather than being invariant as labelled functions or elements.
No assertion makes the topological class or generic full group a function of a passport alone
(Broughton §2, Proposition 2.2; §3.4 here).

**Checks.**

- For `G=C₂²`, `(2;∅)`, the handle tuples `(x,y,0,0)` and `(x,0,y,0)` have the same empty
  passport and genus `1+4·2/2=5`. Their pushed-forward oriented classes in `H₂(G,ℤ)=C₂`
  are `x∧y=1` and `0`, so they lie in different topological classes.
- The two Klein-quartic refined passports are exchanged by Aut(G), giving one topological
  class despite their distinct refined prefixes.
- In C₃², swapping x and y changes the fixed-point count at the label x from 12 to 6;
  at the transported label it remains 12.
- For `C₅,(1,1,3)`, the multiplicities are `(0,0,1,1)`; scaling all entries by two gives
  `(0,1,0,1)`. The sums remain two and the rational decomposition has one pair `(2,1)`.

*Needs:* §§0.3, 3.1–3.7, 5.5, 6.1–7.6. The distinction of the two unramified classes uses
naturality of the oriented fundamental class (AlgebraicTopology Stage 6) and the
calculation H₂(C₂²,ℤ)=∧²(C₂²), obtained from the cyclic resolution and Künneth formula.

### Examples

For C₂²,(2;∅), the same empty passport has both fundamental-class values 0 and 1.

### Dependencies

Layers 0–7; the oriented fundamental-class naturality of AlgebraicTopology Stage 6 and group-homology exterior-square computation for the distinguishing example.

## Worked examples (acceptance criteria)

Counts of vectors below are over all generating vectors, then up to simultaneous conjugation
(0.3), refined passports (3.1), braid classes (3.3) and topological classes (3.4). For a triangle
signature with three distinct periods the pure braid group acts by inner automorphisms (`Q_i²` is
conjugation by `c_i c_{i+1}`), so braid classes equal `Inn(G)`-classes there (3.3); `(0; 3, 15, 15)`
below shows the repeated-period case.

- **`2.2-1.0.2-2-2-2-2-2`** (`C₂`, `(0; 2⁶)`): `μ = 1`, `g = 2`, `dim = 3`. One generating vector,
  one class of every kind. `#Fix(ι) = 2 · 6 · ½ = 6 = 2g + 2`: hyperelliptic with hypInvolution = ι
  (6.2); not cyclic trigonal; generically full (no Singerman row has `σ = (0; 2⁶)` as the
  subgroup); Chevalley–Weil: the nontrivial character has multiplicity `−1 + 6 · ½ = 2`, so
  jacobianDecomp = [(2, 1)].
- **`2.10-2.0.2-5-10`** (`C₁₀`, `(0; 2, 5, 10)`): `μ = 1/5`, `g = 2`, `dim = 0`; the Wiman bound
  `4g + 2 = 10` is attained (4.5). Four generating vectors, four `Inn`-classes (abelian), four
  refined passports, four braid classes, one topological class (Aut(C₁₀) ≅ (ℤ/10)ˣ of order `4`
  permutes them transitively). The involution `5` has `#Fix = 10 (½ + 1/10) = 6`: hyperelliptic;
  the curve is `y² = x⁵ − 1`, full automorphism group `C₁₀`. The sign check of 7.2 on the subgroup
  `C₅ = ⟨γ⟩`, `γ : (x, y) ↦ (ζ₅ x, y)`, signature `(0; 5, 5, 5)`: the branch points are `x = 0` (two
  points, local coordinate `x`, so the monodromy with rotation constant `ζ₅` is `γ`) and `∞` (local
  coordinate `x²/y`, multiplied by `ζ₅²`, so the monodromy there is `γ³`), vector `(1, 1, 3)` in
  `ℤ/5`. `γ^*` acts on `dx/y, x dx/y` by `ζ₅, ζ₅²`, so `ρ_Ω(γ) = (γ⁻¹)^*` has eigenvalues `ζ₅⁴, ζ₅³`
  and `χ_Ω = χ₃ + χ₄` (`χ_k(γ) = ζ₅^k`); 7.2 gives `χ₃ : −1 + 2 · 3/5 + 4/5 = 1`,
  `χ₄ : −1 + 2 · 4/5 + 2/5 = 1`, `χ₁ = χ₂ : 0`, while the weight `(m_j − k)/m_j` would give `χ₁ + χ₂`.
- **`2.6-1.0.2-2-3-3`** (`S₃`, `(0; 2, 2, 3, 3)`): `μ = 1/3`, `g = 2`, `dim = 1`. Twelve generating
  vectors, two `Inn`-classes; for `((23), (23), (132), (123))`, Macbeath gives `#Fix((123)) = 6 · (⅓ + ⅓) = 4`
  (quotient genus `0`) and `#Fix((23)) = 2 · (½ + ½) = 2` (quotient genus `1`). Cyclic trigonal
  with `τ = (123)` (`#Fix = g + 2 = 4`). Not generically full: Singerman's row
  `(0; t₁, t₁, t₂, t₂) ⊂ (0; 2, 2, t₁, t₂)`, index `2` (`μ(0; 2, 2, 2, 3) = 1/6`); the generic full
  group is `S₃ × ⟨hyperelliptic involution⟩ ≅ D₆` of order `12` with `signH = (0; 2, 2, 2, 3)`,
  the family `2.12-4.0.2-2-2-3`. Hyperelliptic (every genus-two curve is) with the involution
  outside `G` (convention 14).
- **`2.2-1.1.2-2`** (`C₂`, `(1; 2, 2)`): `μ = 1`, `g = 2`, `dim = 2`. Four generating vectors
  (`a, b ∈ C₂` free, `c₁ = c₂ = ι`), four `Inn`-classes, one refined passport. `#Fix(ι) = 2 (½ + ½) = 2`,
  quotient genus `1`. Not generically full: row `(1; t, t) ⊂ (0; 2, 2, 2, 2, t)` with `t = 2`,
  index `2`; the generic full group is `C₂ × C₂`, family `2.4-2.0.2-2-2-2-2` (`dim 2` as well).
  Chevalley–Weil: trivial character multiplicity `h = 1`, nontrivial `0 + 2 · ½ = 1`, so
  jacobianDecomp = [(1, 1), (1, 1)]; Kani–Rosen Theorem C with the three subgroups of `C₂ × C₂`
  gives `Jac X ∼ E × E'`.
- **`3.168-42.0.2-3-7`** (`PSL₂(𝔽₇)`, `(0; 2, 3, 7)`, the Klein quartic): `μ = 1/42`, `g = 3`,
  `dim = 0`, `|G| = 168 = 84 (g − 1)`: the Hurwitz bound is attained (4.3). `336` generating
  vectors, two `Inn`-classes, two refined passports (the two classes of elements of order `7`),
  two braid classes, **one** topological class (Aut(G) = PGL₂(𝔽₇) swaps the two classes), so the
  two refined passports `.1`, `.2` are topologically equivalent (8.1). Full. Not hyperelliptic:
  an involution has `|N_G⟨ι⟩| = 8` and `#Fix = 8 · ½ = 4 ≠ 8`; not cyclic trigonal:
  `#Fix(τ) = 6 · ⅓ = 2 ≠ 5`. Chevalley–Weil: for the two `3`-dimensional characters (values in
  `ℚ(√−7)`; `ρ(c₁)` has eigenvalues `1, −1, −1`, `ρ(c₂)` has `1, ζ₃, ζ₃²`, `ρ(c₃)` has `ζ₇, ζ₇², ζ₇⁴`
  for one and `ζ₇³, ζ₇⁵, ζ₇⁶` for the other), `−3 + 2·½ + (⅓ + ⅔) + (1 + 2 + 4)/7 = 0` and
  `−3 + 1 + 1 + (3 + 5 + 6)/7 = 1`, so `H⁰(Ω)` is the second; the `ℚ`-character of degree `6` has
  `n = 3`, `dim B = 3`, and
  jacobianDecomp = [(1, 3)]: `Jac ∼ E³`.
- **`4.120-34.0.2-4-5`** (`S₅`, `(0; 2, 4, 5)`, Bring's curve): `μ = 1/20`, `g = 4`, `dim = 0`;
  `120` generating vectors, one class of every kind; full; `|G| = 120 = 40 (g − 1) > 4 (g − 1)`.
- **`10.9-2.0.3-3-3-3-3-3`** (`C₃ × C₃`, `(0; 3⁶)`): `μ = 2`, `g = 10`, `dim = 3`; `29040`
  generating vectors, each its own `Inn`-class and refined passport. For `(x, x, x², x², y, y²)`:
  `#Fix(x) = 9 · 4 · ⅓ = 12 = g + 2` (cyclic trigonal with `τ = x`), `#Fix(y) = 6`, `#Fix(xy) = 0`.
- **`13.45-2.0.3-15-15`** (`C₃ × C₁₅`, `(0; 3, 15, 15)`): `μ = 8/15`, `g = 13`, `dim = 0`; `192`
  generating vectors, `192` `Inn`-classes and refined passports (abelian, `c₂ ≠ c₃` always), `96`
  braid classes (`Q₂` swaps `c₂, c₃`), one topological class (`|Aut G| = 192` acts freely and
  transitively). Not generically full: row
  `(0; t₁, t₁, t₂) ⊂ (0; 2, t₁, 2t₂)` with `(t₁, t₂) = (15, 3)`, index `2`
  (`μ(0; 2, 6, 15) = 4/15`), overgroup of order `90` with `signH = (0; 2, 6, 15)`; the extension
  condition of 5.4 (an automorphism swapping `c₂` and `c₃`) holds for every vector.
- **Hurwitz curves** `7.504-156.0.2-3-7` (`PSL₂(𝔽₈)`, `504 = 84 · 6`) and `14.1092-25.0.2-3-7`
  (`PSL₂(𝔽₁₃)`, `1092 = 84 · 13`); **`5.192-181.0.2-3-8`** (`μ = 1/24`, `g = 5`, `192 = 48 (g − 1)`).

### Boundary and off-hypothesis checks

- `C₂` with `(0; 2, 2, 2)`: no generating vector (three involutions never multiply to `1`): 0.2
  rejects. `C₄` with `(0; 2, 2, 2, 2)`: `(2, 2, 2, 2)` satisfies the relation and the orders but
  generates `⟨2⟩`: rejected by `closure_eq_top`. `A₅` with `(0; 2, 3, 7)`: no element of order `7`:
  rejected (`A₅` is not a Hurwitz group).
- `(0; 2, 2, 2, 2)`, `(0; 2, 3, 6)`, `(0; 2, 4, 4)`, `(0; 3, 3, 3)`, `(1; ∅)` have `μ = 0`;
  `(0; 2, 3, 5)` has `μ < 0`: `IsHyperbolic` rejects them, and `genusOfOrder` is `1` or `< 1`.
- The Singerman indices: `μ(0; 7, 7, 7)/μ(0; 2, 3, 7) = (4/7)/(1/42) = 24`, `(0; 2, 7, 7)`: `9`,
  `(0; 3, 3, 7)`: `8`, `(0; 4, 8, 8)/(0; 2, 3, 8) = (½)/(1/24) = 12`, `(0; 3, 8, 8)`: `10`,
  `(0; 9, 9, 9)/(0; 2, 3, 9) = (⅔)/(1/18) = 12`, `(0; 4, 4, 5)/(0; 2, 4, 5) = (3/10)/(1/20) = 6`,
  `(0; t⁴)/(0; 2, 2, 2, t) = 4`, `(0; t, t, t)/(0; 3, 3, t) = 3`, `(0; t, t, t)/(0; 2, 3, 2t) = 6`.
- `μ` minima: `(0; 2, 3, 7): 1/42`, `(0; 2, 3, 8): 1/24`, `(0; 2, 4, 5): 1/20`, `(0; 2, 3, 9): 1/18`,
  `(0; 2, 2, 2, 3): 1/6`, `(0; 2⁵): ½`, `(1; 2): ½`.
- The sign convention of 7.2: `C₃` with `c = (1, 1, 1)` on a genus-one curve (`μ = 0`, outside the
  roadmap's hypotheses but a valid check of 7.1–7.2): on `ℂ/ℤ[ω]` with `γ : z ↦ ωz` the three fixed
  points have `ζ_P = ω`, Eichler's formula gives `Tr γ^* = 1 + 3ω/(1 − ω) = ω`, matching
  `γ^* dz = ω dz` directly, so `ρ_Ω(γ) = (γ⁻¹)^*` acts by `\bar ω = ζ₃²`; 7.2 gives the character
  with `χ(c_j) = ζ₃²` multiplicity `−1 + 3 · ⅔ = 1` and the one with `χ(c_j) = ζ₃` multiplicity
  `−1 + 3 · ⅓ = 0`, as it must; the weight `(m_j − k)/m_j` would exchange them.

## Downstream consumers

CanonicalModelsAndGonality consumes the complex action criteria and fixed-point formulas;
FiniteGroupInvariants can compare finite-group data with the action invariants. The supply
runs from this roadmap to those consumers. Belyi applications consume the triangle dictionary,
and Jacobian applications consume the character and isogeny conclusions of Layer 7.

## References

- T. Breuer, *Characters and Automorphism Groups of Compact Riemann Surfaces*, LMS Lecture Note
  Series 280, Cambridge University Press, 2000. §3, p.7 (Fuchsian groups), §4, p.18
  (Riemann–Hurwitz), §7, p.25 (holomorphic differentials), §10, p.35 (fixed points),
  §11, p.38 (rotation constants), §12, p.41 (Eichler trace), §20, p.84 (genera 2 through 48).
- S. A. Broughton, *Classifying finite group actions on surfaces of low genus*, J. Pure Appl.
  Algebra 69 (1991), 233–270. §1 (signatures and Riemann–Hurwitz), §2 (Propositions 2.1–2.2:
  existence through surface-kernel epimorphisms; topological equivalence through Aut(G) × Mod),
  Tables 4–5 (genus `2` and `3`).
- W. J. Harvey, *Cyclic groups of automorphisms of a compact Riemann surface*, Quart. J. Math.
  Oxford (2) 17 (1966), 86–97. Theorem 4 (the cyclic criterion), and the bound `4g + 2`.
- A. Wiman, *Über die hyperelliptischen Curven und diejenigen vom Geschlechte p = 3 …*, Bihang
  Kongl. Svenska Vet.-Akad. Handlingar 21 (1895). The bound `4g + 2`.
- A. M. Macbeath, *Action of automorphisms of a compact Riemann surface on the first homology
  group*, Bull. London Math. Soc. 5 (1973), 103–108. §2 (the fixed-point formula).
- D. Singerman, *Finitely maximal Fuchsian groups*, J. London Math. Soc. (2) 6 (1972), 29–38.
  Theorem 1 (the list of 5.3).
- E. Bujalance, F.-J. Cirre, M. D. E. Conder, *On extendability of group actions on compact Riemann
  surfaces*, Trans. Amer. Math. Soc. 355 (2003), 1537–1557. §§3–4 (the extension conditions
  of 5.4).
- J. F. X. Ries, *Subvarieties of moduli space determined by finite groups acting on surfaces*,
  Trans. Amer. Math. Soc. 335 (1993), 385–406. §3 (generic full automorphism groups).
- H. M. Farkas, I. Kra, *Riemann Surfaces*, 2nd ed., GTM 71, Springer, 1992. III.7 (quotients by
  finite groups), V.1 (Hurwitz's theorem), V.2.9 (the Eichler trace formula).
- R. Miranda, *Algebraic Curves and Riemann Surfaces*, GSM 5, AMS, 1995. III.3 (group actions,
  the quotient, Riemann–Hurwitz for quotients).
- C. Chevalley, A. Weil, *Über das Verhalten der Integrale 1. Gattung bei Automorphismen des
  Funktionenkörpers*, Abh. Math. Sem. Univ. Hamburg 10 (1934), 358–361; with Weil's correction,
  see Breuer §7, p.25 for the holomorphic-differential character.
- E. Kani, M. Rosen, *Idempotent relations and factors of Jacobians*, Math. Ann. 284 (1989),
  307–327. Theorems A, B, C.
- H. Lange, S. Recillas, *Abelian varieties with group action*, J. reine angew. Math. 575 (2004),
  135–155. The version used is arXiv:math/0106055v2: §1, Proposition 1.1 (isotypical
  decomposition), §2, Theorem 2.2 (isogeny factors), §3 (Jacobians).
- J. Paulhus, *Decomposing Jacobians of curves with extra automorphisms*, Acta Arith. 132 (2008),
  231–244; *A database of group actions on Riemann surfaces*, in *Birational geometry,
  Kähler–Einstein metrics and degenerations*, Springer Proc. Math. Stat. 409 (2023), 693–708
  (the LMFDB's data and its conventions).
- D. Swinarski, *Equations of Riemann surfaces with automorphisms*, arXiv:1607.04778v1, §2.1 (the LMFDB's
  hyperelliptic and cyclic-trigonal tests).
- The LMFDB knowls `curve.highergenus.aut.*` and `lmfdb/higher_genus_w_automorphisms/main.py`.
