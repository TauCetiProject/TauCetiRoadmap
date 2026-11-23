# Roadmap: geometric representation categories and coherent local transport

**Summary.** Let `G` be a connected, simply connected, simple complex algebraic group with Lie
algebra `𝔤`, let `G∨` be its Langlands dual, of adjoint type, and let `H = G(ℂ((t)))` be its loop
group. At the critical level `κc = −½ Killing`, the completed enveloping algebra `A` of the affine
Kac–Moody algebra has a large centre `Z`, which the Feigin–Frenkel theorem identifies with the
functions on the space of `G∨`-opers on the punctured disc. Each oper `p` therefore gives a central
character `χp`, and with it the category `Ccrit(p)` of smooth critical-level modules on which `Z`
acts through `χp`. The loop group acts on `A` fixing `Z` pointwise, so it acts on every `Ccrit(p)`.
Frenkel and Gaitsgory propose that `Ccrit(p)`, as a category with an action of `H`, depends only on
the local system underlying `p`. This roadmap builds the structures in which that proposal is a
precise statement, and proves the unconditional results around it. A family of categories needs
more than an equivalence for each pair of isomorphic parameters: transport must compose coherently,
commute coherently with the symmetries, and remember the automorphisms of each parameter.

The headline results are these.

- For every oper `p`, the action of `H` on `Ccrit(p)` is coherent, with the cells of restriction of
  scalars; with the formal coordinate changes, which move the oper, these actions form a family of
  categories over the action groupoid of `H ⋊ Aut(ℂ[[t]])` on opers.
- Coherent equivariant transport along a parameter groupoid, a pseudofunctor out of the product of
  the groupoid with `H`, is biequivalent to normalized transport data on the prescribed fibres.
- Since the groupoid of opers and isomorphisms of their underlying local systems is equivalent, on
  complex points, to the groupoid of local systems on the punctured disc, a coherent lift along it
  descends to local systems, uniquely up to pseudonatural equivalence.
- The outer derivations of `A` produced by deforming the level form a continuous map
  `θ : Ω¹_cont(Z) → OutDer_cont(A)` of Lie–Rinehart algebras whose anchor is the Poisson bracket of
  `Z`; with the self-extensions of modules along derivations it gives, for every smooth critical
  module `M`, a `Z`-linear map `Ω¹_cont(Z) → Ext¹(M, M)` natural in `M`.

The local Langlands endpoint is the *critical categorical-lift conjecture*: a precisely typed,
complex-linear, `H`-equivariant coherent lift of the family `Ccrit(p)` along that groupoid of opers.
Its existence is conjectural and is never asserted; an Artinian-relative refinement of it is stated
in the same way.

The roadmap sits between two others. [AffineLieAlgebras](../AffineLieAlgebras/README.md) supplies
`A`, its smooth modules, the loop and coordinate actions on `A`, the Feigin–Frenkel isomorphism and
the deformation of the level. [FormalConnectionsOpers](../FormalConnectionsOpers/README.md) supplies
opers, their evaluation characters, the isomonodromy groupoid with its Lie algebroid, and the theorem
that every local system on the punctured disc carries an oper structure. The Tau Ceti library
supplies, in generic form, the discrete and smooth module categories, their strict
central-character fibres and the completed enveloping algebra on which these constructions are made.

## How to read the build

The layers below are R1 to R5. R1 fixes the categorical vocabulary: actions of a group on a category,
their pseudofunctors, equivariant functors and invariant full subcategories, and objectwise
congruence invariance. R2 makes the twisting actions on module categories and on their
central-character fibres coherent, and fixes the cells of the rank-one critical fibres. R3 builds the
critical family `Ccrit(p)` with its loop-group and coordinate symmetries, and separates coherent weak
equivariance from rational integration. R4 treats coherent transport along a parameter groupoid,
compares it with normalized data and states the categorical-lift conjecture. R5 descends lifts to
local systems (R5.1), builds the infinitesimal bridge `θ` with its extension classes (R5.2), and
states the relative refinement over finite Artinian coefficient algebras (R5.3). Sections are
numbered within their layer: §2.3 is the third section of R2, and §§5.1–5.3 are R5.1–R5.3. Each
section's *Needs:* line lists its inputs, so that a target proved by another route is not blocked
behind an unrelated section. An item that the pinned Tau Ceti library proves ends with a line that
names the declarations realising it.

## Conventions

1. **Groups and levels.** `G` is a connected, simply connected, simple complex algebraic group, `𝔤`
   its Lie algebra and `G∨` the Langlands dual group, of adjoint type. The representation-side loop
   group is `H = G(ℂ((t)))`, the complex points of FormalConnectionsOpers §3.1's `LG`. The critical
   form is `κc = −½ Killing`; `κ0` is AffineLieAlgebras A2.2's normalized form, with
   `κc = −h∨ κ0`. The distinguished central generator `K` acts as the identity.
2. **The completed algebra.** `A = Ûκc` is the left-ideal completion of AffineLieAlgebras A4.1 at
   the critical level, the inverse limit of the module quotients `Q_N = Uκc/I_N`. In Tau Ceti it is
   `TauCeti.CurrentAlgebra.CompletedEnveloping` for the form `Φ = −κc` and the central value `1`,
   since that library writes the residue cocycle as `Res(f dg) Φ(x, y)` and the level cocycle is
   `−κ(x, y) Res(f dg)`. `Z` is `Subalgebra.center ℂ A`.
3. **Topologies.** Formal coefficient rings and modules carry the discrete coefficient topology,
   and `A` carries its inverse-limit topology. Generic statements take the actual topological
   algebra and its continuity hypotheses explicitly; the affine application uses the completion
   topology of AffineLieAlgebras A4.1. Ordinary complex-point Lie groups of
   FormalConnectionsOpers keep their usual complex topology.
4. **Smoothness.** A module is smooth in the vectorwise sense `∀ v ∃ N > 0, t^N 𝔤[[t]] · v = 0`; on
   `A` this is continuity of every orbit map into the discrete module, `TauCeti.discreteModules A`.
   No single congruence stabilizer for a whole module is assumed: AffineLieAlgebras A3.2's uniform
   rational integration to `K_N` requires finite generation, and the unrestricted smooth category
   keeps the vectorwise condition. Mere objectwise isomorphisms `T_g M ≅ M` are not coherent
   equivariance.
5. **Composition order.** For a left action, `T_(gh) = T_g ∘ T_h`, written `T_h ⋙ T_g` in Lean.
   In `SingleObj H` the composite `g ≫ h` is the product `h * g`. Mathlib's endofunctor tensor is
   `F ⊗ G = F ⋙ G`, so a left action is a monoidal functor into the monoidal opposite of the
   endofunctor category, as in `MonoidalLeftAction.curriedActionMop`. Every comparison and
   transported action below uses this order.
6. **The parameter groupoid.** `Γ = IsomOp` has the `G∨`-opers `p` on the punctured disc as
   objects; its arrows `p → q` are **all isomorphisms of the underlying `G∨`-local systems**,
   automorphisms included (FormalConnectionsOpers §8.1). After trivialization an arrow is a triple
   `(p, q, g)` with `g ∈ G∨(ℂ((t)))`; it need not preserve the oper Borel reduction. The composite of
   `g : p → q` and `h : q → r` is `hg`. This is not the groupoid of Borel-preserving oper
   isomorphisms and not a global action of `G∨((t))` on a Drinfeld–Sokolov slice. The group `H`
   acts within each character fibre and is unrelated to the dual gauge group.
7. **Strict characters.** The critical-character condition is an equation, not a quotient:
   `z · v = χp(z) v` for every central `z` and every vector `v` (`TauCeti.centralCharacterModules`).
   Restrictions of `ModuleCat` and of the smooth category are `ObjectProperty.FullSubcategory`.
8. **Universes.** Module categories over `A : Type u` live in `ModuleCat.{max u w} A`, the universe
   in which `TauCeti.hasExt_discreteModules` provides `Ext` (AffineLieAlgebras A5.2).
9. **Names.** Lean names in code font are Mathlib's or Tau Ceti's; names in the namespace
   `CategoryTheory` are written without that prefix. The targets of this roadmap are named in prose,
   and `Suggested.lean` explains which headline results are statable at the pinned libraries.

## R1: categorical actions and invariant full subcategories

This layer fixes the categorical vocabulary of the roadmap: actions of a group on a category, their
presentation as pseudofunctors, equivariant functors and transformations, restriction to invariant
full subcategories and transport along equivalences, and the objectwise congruence condition. Every
item is used below by the names given here, and the Checks pin the conventions. Each of these
interfaces comes with its complete API: constructors, extensionality on components, identity and
product simplifications, the inverse-action comparison, naturality of the inclusions, invariance
under equivalence and the associated coherence lemmas.

### 1.1 Actions and their classifying pseudofunctors

An action of a group `H` on a category `C` is `MonoidalLeftAction (Discrete H) C`; write `T_h` for
its action functor at `h`. Prove the formulas for units, products, inverses and morphisms: the
action functor of a product `g h` is isomorphic to `T_h ⋙ T_g`, with components the associator;
`T_g` is an equivalence with inverse `T_(g⁻¹)`; and the morphisms of `Discrete H` act by
`eqToHom`. Construct the comparison of an action with a pseudofunctor
`LocallyDiscrete (SingleObj H) ⥤ᵖ Cat` whose value at the unique object is `C`, sending `g` to
`T_g`, with unit comparison the left unitor and composition comparison at `g ≫ h` the associator
`T_(h*g) ≅ T_g ⋙ T_h`; conversely, read an action off such a pseudofunctor, and prove that both round
trips are equalities that include the unitor and the associator, so that the comparison is a
bijection between actions on `C` and pseudofunctors with value `C`. The comparison transports the
unit and associativity coherence, rather than merely matching action functors. The curried form is
the monoidal functor `MonoidalLeftAction.curriedActionMop` into the monoidal opposite of the
endofunctors, with `MonoidalLeftAction.curriedActionMopMonoidal`. The trivial action of `H` on `C`
has every `T_h` the identity functor and identity cells. An action of the group of complex points, by functors
`F_g` with isomorphisms `F_(gh) ≅ F_g ∘ F_h` satisfying the cocycle identity, is that of Frenkel,
§1.3.3, p. 25 (there `F_1` is the identity functor; here it comes with a unit isomorphism
`F_1 ≅ Id`); Frenkel–Gaitsgory, §20.1, pp. 120–121, give the algebraic form for an affine group
scheme, with its unit and associativity constraints. Pseudofunctors, strong transformations and
modifications are those of Johnson–Yau, Definitions 4.1.2, 4.2.1 and 4.4.1, pp. 103–104, 117–118
and 126–127. *Needs:* Mathlib `MonoidalLeftAction`,
`MonoidalLeftAction.curriedActionMop`, `SingleObj`, `LocallyDiscrete`, `Cat`, `Pseudofunctor`.

*In Tau Ceti:* `MonoidalLeftAction.actionLeftTensorIso`, `MonoidalLeftAction.actionLeftEquivalence`, `MonoidalLeftAction.actionHomLeft_eq_eqToHom`, `MonoidalLeftAction.pseudofunctor`, `Pseudofunctor.monoidalLeftAction`, `MonoidalLeftAction.monoidalLeftAction_pseudofunctor`, `Pseudofunctor.pseudofunctor_monoidalLeftAction`, `MonoidalLeftAction.pseudofunctorEquiv`, `TauCeti.trivialAction`.

**Checks.**
- For `H = (ℤ/2)²` acting on finite-dimensional complex vector spaces, the trivial action and the
  cocycle pseudofunctor of §4.5 for the bicharacter
  `c((a, b), (a′, b′)) = (−1)^(b a′)` have the same action functors, all identities, and different
  composition cells: `c` takes the value `−1` at `((0, 1), (1, 0))`. A comparison of actions and
  pseudofunctors that matched only the action functors would identify them; they are not even
  equivalent, because `c` is not a coboundary (§1.3).

### 1.2 Equivariant functors, restriction and transport

An equivariant functor between categories with actions is a functor `F` with a structure
`Functor.LeftLinear (Discrete H)`; it carries natural isomorphisms `T_g^C ⋙ F ≅ F ⋙ T_g^D`
satisfying the unit and product diagrams. Prove that identities and composites of equivariant
functors are equivariant, and define equivariant natural transformations as those compatible with
these isomorphisms. Prove that equivariant functors `C → D` are exactly the strong transformations
between the classifying pseudofunctors of §1.1, by mutually inverse constructions, and that
equivariant natural transformations are exactly the modifications between the corresponding strong
transformations, compatibly with identities and composites.

For an object property `P` stable under the action, in the sense that every `T_h` carries objects
with `P` to objects with `P`, prove that the action restricts to `P.FullSubcategory`; that the fully
faithful inclusion is equivariant with identity lineators; that for `P ≤ Q` the inclusion of
`P.FullSubcategory` into `Q.FullSubcategory` is equivariant; that restricting first by `P` and then
by `Q` is equivariantly equivalent to restricting by `P ⊓ Q`, with equivariant unit and counit; and
that the lift through `P.FullSubcategory` of an equivariant functor landing in `P` is equivariant.
An action transports along an equivalence `e : D ≌ D′`: prove that `e.functor` is then equivariant
and that the inverse of an equivariant equivalence is equivariant. On linear categories the restricted
and transported action functors stay additive and scalar-linear. If `D` is abelian and `P` contains
zero and is closed under finite products, kernels and cokernels, then `P.FullSubcategory` is abelian
(Mathlib's instance on such full subcategories); prove that an action of `D` by exact functors
restricts to an action by exact functors of the inherited abelian structure, preserving its kernels
and cokernels. For the strict central-character fibres of R2 these closure properties follow from
the scalar equation; no closure under arbitrary ambient extensions is inferred. *Needs:* Mathlib
`Functor.LeftLinear`, `ObjectProperty.FullSubcategory`, `ObjectProperty.ι`, `ObjectProperty.ιOfLE`,
`ObjectProperty.lift`, `Pseudofunctor.StrongTrans`, `Functor.Linear`, the abelian structure on full
subcategories; §1.1.

*In Tau Ceti:* `Functor.commActionLeftIso`, `Functor.LeftLinear.comp`, `NatTrans.IsLeftLinear`, `MonoidalLeftAction.strongTrans`, `MonoidalLeftAction.functorOfStrongTrans`, `MonoidalLeftAction.strongTransEquiv`, `MonoidalLeftAction.modification`, `MonoidalLeftAction.modificationEquiv`, `MonoidalLeftAction.strongTransIdIso`, `MonoidalLeftAction.strongTransCompIso`, `ObjectProperty.IsStableUnderLeftAction`, `ObjectProperty.fullSubcategoryMonoidalLeftAction`, `ObjectProperty.leftLinearι`, `ObjectProperty.leftLinearιOfLE`, `ObjectProperty.iteratedFullSubcategoryEquivalence`, `ObjectProperty.iteratedFullSubcategoryEquivalenceFunctorLeftLinear`, `ObjectProperty.leftLinearLift`, `Equivalence.transportMonoidalLeftAction`, `Equivalence.functorLeftLinearOfTransport`, `Equivalence.inverseLeftLinear`, `Equivalence.linear_actionLeft_transport`, `ObjectProperty.preservesFiniteLimits_actionLeft`, `ObjectProperty.preservesFiniteColimits_actionLeft`.

**Checks.**
- Over `ℂ[x]`, the modules on which `x` acts by a fixed scalar `λ` form a full subcategory containing
  zero and closed under kernels, cokernels and finite products, hence abelian; it is not closed under
  extensions: `ℂ²` with `x` acting by the Jordan block `[[λ, 1], [0, λ]]` is an extension of `ℂ_λ` by
  `ℂ_λ` on which `x − λ` is nonzero. A closure hypothesis "closed under extensions" would exclude the
  strict character fibres.

### 1.3 Objectwise congruence invariance

For a family `K : ℕ → Subgroup H`, define the *congruence-invariant* objects as those `M` that some
`K N` with `N > 0` fixes up to isomorphism, `∀ g ∈ K N, Nonempty (T_g M ≅ M)`, and call the action
*objectwise congruence invariant* if every object is congruence invariant, with `N` depending on the
object. This is the objectwise stability of Frenkel, §1.3.4, pp. 26–27. Prove that objectwise
congruence invariance is invariant under equivariant equivalence and passes to invariant full
subcategories. The predicate asks only for objectwise isomorphisms; coherent rational integration
with a prescribed Lie derivative is separate data (§3.5). *Needs:* Mathlib `Subgroup`; §1.2.

*In Tau Ceti:* `TauCeti.congruenceInvariant`, `TauCeti.IsObjectwiseCongruenceInvariant`, `TauCeti.isObjectwiseCongruenceInvariant_iff_of_equivalence`, `TauCeti.IsObjectwiseCongruenceInvariant.fullSubcategory`.

**Checks.**
- In the cocycle action of `(ℤ/2)²` of §1.1, every object is fixed by every element, so the
  predicate holds for every `K`. The line `ℂ` nevertheless carries no family of isomorphisms
  `T_g ℂ ≅ ℂ` compatible with the composition cells: compatibility would write `c(g, h)` as
  `b(g) b(h) / b(gh)` for scalars `b`, and such a coboundary is symmetric in `g, h` because the group
  is abelian, while `c((0, 1), (1, 0)) = −1 ≠ 1 = c((1, 0), (0, 1))`. Objectwise invariance does not
  detect coherence.

### Examples

- Twisting a category of modules by algebra automorphisms, with unit and composition cells the
  comparison isomorphisms of restriction of scalars.
- The trivial action and the cocycle actions of `(ℤ/2)²` of §4.5, which share action functors and
  differ in their cells.
- Modules on which a central subalgebra acts by a fixed character: an invariant full subcategory, for
  a centre-fixing action, with inherited abelian structure.

### Dependencies

Mathlib: monoidal left actions and their curried form, `SingleObj`, locally discrete bicategories,
pseudofunctors, strong transformations and modifications, full subcategories and their abelian
structure, linear functors.

## R2: coherent twists on the supplied module categories

Twisting a module by an algebra automorphism defines a categorical action of any group acting on the
algebra, and that action restricts to the discrete modules and to their strict central-character
fibres. The categories themselves, their closure properties, the central-character categories,
their quotient presentations and the twist functor of a single automorphism have one owner,
AffineLieAlgebras A5; this layer builds the categorical coherence of the twists on those supplied
categories. It fixes the actions with their cells, and specializes them to the rank-one critical
fibres, where the cells are pinned exactly.

### 2.1 Twisting actions on module categories

For a monoid homomorphism `a : H →* RingAut A`, construct the twisting action of `H` on
`ModuleCat A`: `T_h` is restriction of scalars `ModuleCat.restrictScalars` along `(a h)⁻¹`, so the
twisted module has the same underlying group with `x` acting as `(a h)⁻¹ x`. The identity
`(a (g h))⁻¹ = (a h)⁻¹ ∘ (a g)⁻¹` gives `T_(gh) = T_g ∘ T_h`. Prove that its unit and associator are
exactly `ModuleCat.restrictScalarsId'` and `ModuleCat.restrictScalarsComp'`, whose underlying linear
maps are identities, in both directions: the hom and inverse components are these maps, not scalar
multiples of them. For a group acting by continuous algebra automorphisms of a `ℂ`-algebra, the
action is given through `MulSemiringAction.toRingEquiv`; prove that its action functors are additive
equivalences and `ℂ`-linear. Its classifying pseudofunctor is that of §1.1, so its associativity and
identity coherence, its inverse equivalences and its naturality are those of §1.1. The discrete
modules of a topological algebra are stable when each `a h` is a homeomorphism, and the smooth
modules for a family of left ideals are stable when each twist preserves the family up to cofinality
(AffineLieAlgebras A5.3; in Tau Ceti `MonoidHom.isStableUnderLeftAction_discreteModules` and
`MonoidHom.isStableUnderLeftAction_smoothModules`), so the action restricts to them by §1.2. Prove
that restriction of scalars along a ring homomorphism intertwining two such actions is equivariant
with identity lineators. For a monoid acting on `A` and on a set `X` of parameters, construct the
pseudofunctor out of the action category formed by the same twists, with the same unit and
composition cells. The twisting action of the loop group on smooth modules is Frenkel,
§1.3.4–1.3.5, pp. 26–27; the weak action of an affine group scheme on the discrete modules over a
topological algebra it acts on is Frenkel–Gaitsgory, §20.1, p. 121. *Needs:* Mathlib
`ModuleCat.restrictScalars`, `ModuleCat.restrictScalarsId'`, `ModuleCat.restrictScalarsComp'`,
`MulSemiringAction.toRingEquiv`, `ActionCategory`; AffineLieAlgebras A5.3; §§1.1–1.2.

*In Tau Ceti:* `MonoidHom.restrictScalarsMonoidalLeftAction`, `MonoidHom.actionUnitNatIso_restrictScalarsMonoidalLeftAction`, `MonoidHom.actionLeftTensorIso_restrictScalarsMonoidalLeftAction`, `MonoidHom.linear_actionLeft_restrictScalarsMonoidalLeftAction`, `RingHom.leftLinearRestrictScalars`, `TauCeti.actionCategoryTwist`.

**Checks.**
- On `A = ℂ[x]`, let `g` and `h` be the automorphisms `x ↦ 2x` and `x ↦ x + 1`, so that `g h` is
  `x ↦ 2x + 1`. On the line `ℂ_λ` where `x` acts by `λ`, `T_h ℂ_λ = ℂ_(λ−1)` (there `x` acts as
  `x − 1`), `T_g T_h ℂ_λ = ℂ_((λ−1)/2)` and `T_(gh) ℂ_λ = ℂ_((λ−1)/2)`, as `(2x + 1)⁻¹` sends `x` to
  `(x − 1)/2`; but `T_(hg) ℂ_λ = ℂ_(λ/2 − 1)`. The opposite composition order is detected.
- Twisting along `a h` instead of `(a h)⁻¹` would give `T_h ℂ_λ = ℂ_(λ+1)` above, and would turn the
  left action into a right action: `T_(gh)` would then equal `T_h ∘ T_g`.

### 2.2 Discrete modules, strict character fibres and their twists

AffineLieAlgebras A5.1–A5.3 supplies the categories, in the following generic forms of the Tau Ceti
library. For a topological algebra `A`, `TauCeti.discreteModules A` is the property that every orbit map
`a ↦ a · v` is continuous into the discrete module, equivalently that annihilators of vectors are open
(`TauCeti.discreteModules_iff_isOpen`); for a decreasing family of left ideals `J_N`,
`TauCeti.smoothModules J` asks each vector to be killed by some `J_N`, and the two agree when the `J_N`
form a basis of neighbourhoods of zero (`TauCeti.smoothModules_eq_discreteModules`). Both are closed
under subobjects, quotients, colimits (in particular arbitrary direct sums,
`TauCeti.smoothModules_directSum`) and finite limits; products are the smooth part of the ordinary
product (`TauCeti.smoothPartFunctor`). For a character `χ` of the centre,
`TauCeti.centralCharacterModules χ` is the equation `z · m = χ(z) m`, and
`TauCeti.discreteCentralCharacterModules χ` its intersection with the discrete modules; both full
subcategories are abelian, closed under subobjects, quotients and finite limits, by the scalar
equation alone. An algebra isomorphism `e` with continuous inverse carries the fibre of `χ` to the
fibre of `χ` precomposed with the inverse of `e` on the centres (`TauCeti.discreteCentralCharacterTwist`).

Let `a : H →* (A ≃ₐ[ℂ] A)` be a monoid homomorphism by algebra automorphisms with continuous
inverses fixing the centre pointwise. By A5.3's centre-fixing theorem every strict fibre is stable
(in Tau Ceti `MonoidHom.isStableUnderLeftAction_discreteCentralCharacterModules_of_centerFixed`).
Construct the fibrewise coherent action of `H` on each strict fibre, and prove that its unit and
associator are the restrictions of `ModuleCat.restrictScalarsId'App` and
`ModuleCat.restrictScalarsComp'App`, the associator at `g * h` having target `T_h ⋙ T_g`. Prove
that its inclusion into all modules is equivariant with identity lineators and that its twists are
`ℂ`-linear. Prove that A5.3's presentation of the fibre as discrete modules over the quotient by the
closed ideal generated by the kernel of `χ` (in Tau Ceti
`AlgHom.discreteCentralCharacterQuotientEquivalence`) is equivariant in both directions with
identity lineators; the restriction in two steps, first to discrete modules and then to the fibre,
is compared by §1.2. When automorphisms move the characters, A5.3's twist functor carries the fibre
of `χ` to that of `χ ∘ a_h⁻¹`; construct the pseudofunctor over the action category of the
parameters formed by these twists, restricting the pseudofunctor of §2.1, and its inclusion into all
modules as a strong transformation with identity naturality isomorphisms. The fibres are those of
Frenkel, §10.1, p. 308, and AffineLieAlgebras A5.3. *Needs:* AffineLieAlgebras A5.1–A5.3; Mathlib
`Subalgebra.center`, `ActionCategory`; §§1.2, 2.1.

*In Tau Ceti:* `MonoidHom.discreteCentralCharacterMonoidalLeftAction`, `MonoidHom.discreteCentralCharacterMonoidalLeftAction_unit`, `MonoidHom.discreteCentralCharacterMonoidalLeftAction_assoc`, `MonoidHom.leftLinearInclusionDiscreteCentralCharacterMonoidalLeftAction`, `MonoidHom.linear_actionLeft_discreteCentralCharacterMonoidalLeftAction`, `MonoidHom.leftLinearDiscreteCentralCharacterQuotientEquivalenceFunctor`, `MonoidHom.leftLinearDiscreteCentralCharacterQuotientEquivalenceInverse`, `TauCeti.discreteCentralCharacterObjectProperty`, `TauCeti.discreteCentralCharacterFamily`, `TauCeti.discreteCentralCharacterFamilyι`.

**Checks.**
- On the discrete algebra `ℂ[y]` (its own centre), let `χ(y) = 1` and `a : y ↦ y + 1`. On a module of
  the fibre of `χ`, the twisted module lets `y` act as `a⁻¹(y) = y − 1`, that is by `0`, so the twist
  lands in the fibre of `χ ∘ a⁻¹`, where `y ↦ 0`. Restricting along `a` instead would land in the fibre
  `y ↦ 2`.
- For `A = ℂ[[x]]` with `J_N = x^N A`, the vector `(1, 1, …)` of the ordinary product `∏_N A/x^N` is
  killed by no `x^M`, so products in the discrete category must be the smooth part of the ordinary
  product, as `TauCeti.smoothPartFunctor` has it.

### 2.3 The rank-one fibres with fixed cells

Take `G = SL₂`, so `G∨ = PGL₂`. AffineLieAlgebras A8.3 selects a continuous Feigin–Frenkel isomorphism
for `sl₂`, sending the normally ordered Sugawara modes `S_n` to the oper coordinates
`q_(−n−2) = Res(t^(n+1) q dt)`, and supplies the loop automorphism homomorphism of
`SL₂(ℂ((t)))` on `A = Ûκc(sl₂)` with its matrix and Hopf dictionary and its pointwise fixation of the
centre. For a `PGL₂`-oper `p`, the *rank-one fibre* is `TauCeti.discreteCentralCharacterModules χp`
with `χp` the selected isomorphism followed by evaluation at `p` (FormalConnectionsOpers §5.2). Define
the *rank-one action* on it as `MonoidHom.discreteCentralCharacterMonoidalLeftAction` for that
homomorphism, and the *rank-one pseudofunctor* as its classifying pseudofunctor (§1.1). Its cells are
then fixed exactly, by `MonoidHom.discreteCentralCharacterMonoidalLeftAction_unit` and
`MonoidHom.discreteCentralCharacterMonoidalLeftAction_assoc` applied to A8.3's homomorphism: the unit
of the rank-one action, transported through the fully faithful inclusion, is the restriction of
`ModuleCat.restrictScalarsId'App`, which we call the rank-one twist unit; its associator at `g, h` is
the restriction of `ModuleCat.restrictScalarsComp'App` for `(a_g)⁻¹, (a_h)⁻¹, (a_(gh))⁻¹`, which we
call the rank-one twist compositor at `(p, h, g)`, since `(g ⊗ h) · M = g · (h · M)` corresponds to
the functor order `T_h ⋙ T_g`. By `MonoidalLeftAction.monoidalLeftAction_pseudofunctor`, the action
recovered from the rank-one pseudofunctor by `Pseudofunctor.monoidalLeftAction` is the rank-one
action itself: the action functors, and the unit and associator as natural isomorphisms, including
their hom and inverse components. Equality of action functors alone would not specify these cells.
*Needs:* AffineLieAlgebras A8.3, A4.2, A5.4; FormalConnectionsOpers §5.2; Tau Ceti
`MonoidHom.discreteCentralCharacterMonoidalLeftAction` and its unit and associator lemmas,
`MonoidalLeftAction.monoidalLeftAction_pseudofunctor`; §§1.1, 2.2.

### Examples

- The affine substitutions of `ℂ[x]` in §2.1 and the translation of `ℂ[y]` in §2.2, which move a
  character.
- The rank-one fibres of §2.3, where `S_(−2)` acts by the constant coefficient `q_0` of the oper.

### Dependencies

R1. Mathlib: restriction of scalars and its comparison isomorphisms, centres, action categories.
Tau Ceti: the generic forms of AffineLieAlgebras A5.1–A5.3, namely discrete and smooth modules, strict
central-character fibres, their twists, stability and quotient presentations. AffineLieAlgebras A2.3,
A4.2, A5.1–A5.4, A8.3; FormalConnectionsOpers §5.2.

## R3: the critical representation family

This layer builds the categories `Ccrit(p)` and their symmetries: the loop group within each fibre,
the formal coordinate changes between fibres, and the semidirect product that combines them. It
also separates objectwise congruence invariance from coherent weak equivariance and from rational
integration. The arithmetic analogy of the sources motivates the construction and is not a target.

### 3.1 The critical category and its fibres

Let `Ccrit` be the full subcategory `TauCeti.discreteModules A` of `ModuleCat.{max u w} A`, the
discrete continuous `A`-modules; by AffineLieAlgebras A5.4 it is equivalent to the category of smooth
`ĝκc`-modules on which `K` acts as `1` (AffineLieAlgebras A3.1). For a `G∨`-oper `p` on the punctured
disc, let `χp : Z → ℂ` be the continuous Feigin–Frenkel isomorphism `Z ≅ Fun Op_(G∨)(D×)` of
AffineLieAlgebras A8.1 and A8.3 followed by evaluation at `p` (FormalConnectionsOpers §5.2), and let
`Ccrit(p)` be `TauCeti.discreteCentralCharacterModules χp`, the modules on which `z` acts by `χp(z)`
(Frenkel–Gaitsgory, §5.1, pp. 47–48, with Theorem 5.1.1; Frenkel, §10.1, p. 308). In rank one this is
the rank-one fibre of §2.3. Prove that A5.4's comparison of the Lie-module and completed-module
presentations is equivariant for the twisting actions of §2.1 and restricts to the fibres, so that
the fibres and their twists may be computed in either presentation, and that this comparison and
the twist functors on `Ccrit` and on each `Ccrit(p)` preserve kernels, cokernels and arbitrary
direct sums. *Needs:* AffineLieAlgebras A3.1,
A4.1, A5.4, A8.1, A8.3; FormalConnectionsOpers §5.2; Tau Ceti
`TauCeti.CurrentAlgebra.CompletedEnveloping`, `TauCeti.discreteModules`,
`TauCeti.discreteCentralCharacterModules`; §§2.1–2.2.

**Checks.**
- The vacuum module `Q_0` lies in `Ccrit` but in no fibre: for `sl₂`,
  `S_(−2) · |0⟩ = f_(−1) e_(−1)|0⟩ + ½ h_(−2)|0⟩ + ¼ h_(−1)²|0⟩`, a nonzero vector of PBW degree
  two, not a multiple of `|0⟩`, while `S_0 · |0⟩ = 0`. The fibres do not exhaust `Ccrit`.
- For the `PGL₂`-opers `q = 0` and `q = 1`, `S_(−2)` acts by `q_0`, that is by `0` and by `1`, so
  `Ccrit(0)` and `Ccrit(1)` meet only in the zero module.

### 3.2 The loop-group action on each fibre

Let `a : H →* (A ≃ₐ[ℂ] A)` be AffineLieAlgebras A4.2's completed loop lift, by continuous algebra
automorphisms with continuous inverses, which fixes `Z` pointwise (AffineLieAlgebras A8.3). Construct
the coherent action of `H` on each `Ccrit(p)` as `MonoidHom.discreteCentralCharacterMonoidalLeftAction`
for `a`; its unit, product and inverse functors are those of §1.1. Both `Ccrit(p)` and `Ccrit`
carry the restrictions of the twisting action on all modules
(`MonoidHom.isStableUnderLeftAction_discreteModules`), so the inclusion `Ccrit(p) ⊆ Ccrit` is
equivariant by `ObjectProperty.leftLinearιOfLE` (§1.2), and the inclusion of `Ccrit(p)` into all
modules by `MonoidHom.leftLinearInclusionDiscreteCentralCharacterMonoidalLeftAction` (Frenkel,
§10.1, p. 308, where `G((t))` acts along the fibres because it fixes the centre). This is an
unconditional construction. A dual gauge arrow `g : p → q` of `IsomOp` gives no algebra automorphism
of `A` and, by definition, no functor between the fibres; such functors are the subject of the
conjecture of §4.4. *Needs:* AffineLieAlgebras A4.2, A8.3; FormalConnectionsOpers §3.1; Tau Ceti
`MonoidHom.discreteCentralCharacterMonoidalLeftAction`,
`MonoidHom.isStableUnderLeftAction_discreteCentralCharacterModules_of_centerFixed`,
`MonoidHom.isStableUnderLeftAction_discreteModules`, `ObjectProperty.leftLinearιOfLE`,
`MonoidHom.leftLinearInclusionDiscreteCentralCharacterMonoidalLeftAction`; §§1.1, 1.2, 3.1.

### 3.3 Coordinate automorphisms

Let `S = Aut_cont,ℂ(ℂ[[t]])` be the group of continuous algebra automorphisms of `ℂ[[t]]`, extended
to `ℂ((t))`, and write `σφ(f)(t) = f(φ(t))` for the automorphism with `σφ(t) = φ(t)`. Then
`σφ σψ = σ_(ψ∘φ)`, where `(ψ∘φ)(t) = ψ(φ(t))`; so the right action `(p^φ)^ψ = p^(φ∘ψ)` of coordinate
changes on opers (FormalConnectionsOpers §§1.2, 5.1) is the left action `σφ · p = p^φ` of `S`. Let
`aσ` be the completed coordinate automorphism of `A` (AffineLieAlgebras A2.3 and A4.2;
`TauCeti.CurrentAlgebra.coordinateCompletedEnvelopingAut`), with the Feigin–Frenkel equivariance of
AffineLieAlgebras A8.3 pinned as `aσ(F) = F ∘ σ⁻¹` on oper functions. The coordinate character
equation `χ_(σ·p) = χp ∘ aσ⁻¹` is A8.3's `eval_(σp) = eval_p ∘ a_σ⁻¹` with `χp` for `eval_p`, and
A8.3's pullback along `aσ⁻¹` from the fibre at `p` to the fibre at `σ·p` is, on the strict fibres,
the functor `Ccrit(p) → Ccrit(σ·p)` of `TauCeti.discreteCentralCharacterTwist`. For the rescaling
`φ(t) = at` with `a ∈ ℂ^×` in rank one, prove that `aσ` multiplies the quadratic current mode `S_n` by
`a^n`, `aσ(S_n) = a^n S_n`, whereas the oper coefficient `L_n = Res(t^(n+1) q dt)` is multiplied by
`a^(−n)`, `L_n(p^φ) = a^(−n) L_n(p)`, and that both sides of the coordinate character equation then
take the value `a^(−n) L_n(p)` at `S_n`. *Needs:*
AffineLieAlgebras A2.3, A4.2, A8.3; FormalConnectionsOpers §§1.2, 5.1, 5.2; Tau Ceti
`TauCeti.CurrentAlgebra.coordinateCompletedEnvelopingAut`, `TauCeti.discreteCentralCharacterTwist`;
§3.1.

**Checks.**
- For `φ = 2t` and `ψ = t + t²`, `σφ(σψ(t)) = σφ(t + t²) = 2t + 4t²`, which is `(ψ∘φ)(t)`, not
  `(φ∘ψ)(t) = 2t + 2t²`.
- For `φ = at` in rank one, `aσ(S_n) = a^n S_n`, as `σφ(t^m) = a^m t^m` for every mode, while
  `q^φ(t) = a² q(at)`, so the oper coefficient `L_n = Res(t^(n+1) q dt)` satisfies
  `L_n(p^φ) = Res(t^(n+1) a² q(at) dt) = a^(−n) L_n(p)` after substituting `u = at`. Both sides of
  the character equation then give `a^(−n) L_n(p)` at `S_n`: `χ_(σ·p)(S_n) = L_n(p^φ)` and
  `χp(aσ⁻¹ S_n) = χp(a^(−n) S_n)`. With `aσ` in place of `aσ⁻¹` the right side would be
  `a^n L_n(p)`, wrong unless `a^(2n) = 1`.

### 3.4 The semidirect product and the action groupoid

Define `β : S → MulAut H` by coefficient substitution, `βσ(h) = σ(h)`, and use Mathlib's
`SemidirectProduct β`, written `H ⋊ S`, with product `(h, σ)(k, τ) = (h βσ(k), στ)`; it acts on opers
through `S`. By AffineLieAlgebras A4.2's semidirect conjugacy `aσ a_h aσ⁻¹ = a_(σ(h))`, the map
`(h, σ) ↦ a_h ∘ aσ` is a homomorphism `H ⋊ S →* (A ≃ₐ[ℂ] A)`. Construct the complex-linear family of
categories as the pseudofunctor `TauCeti.discreteCentralCharacterFamily` out of
`LocallyDiscrete (ActionCategory (H ⋊ S) Op)`, with `Op` the complex points of `Op_(G∨)(D×)`, sending
the arrow `(h, σ) : p → σ·p` to `T_h^(σ·p) ∘ T_σ^p`; its character equation on `H ⋊ S` is that of
§3.3, since `a_h` fixes `Z` (AffineLieAlgebras A8.3). Prove that the restriction of the family to the
arrows `(h, 1)` at a fixed `p` is the action of §3.2. The covariance isomorphism
`T_σ ∘ T_h ≅ T_(βσ h) ∘ T_σ` is then the composite of the family's `Pseudofunctor.mapComp` cells at the
two factorizations `(1, σ)(h, 1) = (βσ h, σ) = (βσ h, 1)(1, σ)` of the arrow `(βσ h, σ) : p → σ·p`, and
the product and unit coherence are the pseudofunctor axioms of the family. Coordinate arrows belong
to this action groupoid and do not become dual local-system arrows of `IsomOp`; the conjecture of §4.4
prescribes equivariance for the original loop group only and asks for no coordinate extension.
*Needs:* Mathlib `SemidirectProduct`, `ActionCategory`, `Pseudofunctor.mapComp`; AffineLieAlgebras
A4.2, A8.3; FormalConnectionsOpers §5.1; Tau Ceti `TauCeti.discreteCentralCharacterFamily`; §§3.2–3.3.

**Checks.**
- For `h = diag(t, t⁻¹)` in `SL₂(ℂ((t)))` and `φ = at`: `aσ⁻¹(e_n) = a^(−n) e_n`,
  `a_h(e_n) = e_(n+2)` and `aσ(e_(n+2)) = a^(n+2) e_(n+2)`, so `aσ a_h aσ⁻¹(e_n) = a² e_(n+2)`, which is
  `a_(σ(h))(e_n)` for `σ(h) = diag(at, a⁻¹t⁻¹)`. For `a² ≠ 1` the coordinate and loop twists do not
  commute, so the family is indexed by `H ⋊ S`, not by `H × S`.

### 3.5 Congruence invariance and coherent weak equivariance

For finitely generated smooth modules, use AffineLieAlgebras A3.2's compatible rational integration
to `K_N` to prove that the full subcategory of finitely generated objects of `Ccrit` satisfies
`TauCeti.IsObjectwiseCongruenceInvariant K` for the congruence subgroups `K_N` of
FormalConnectionsOpers §3.1 (Frenkel, §1.3.4, Lemma 1.3.1, pp. 26–27, stated for `𝔤((t))`, and
§1.3.6, p. 29, for `ĝκ`). In rank one, map FormalConnectionsOpers §3.1's positive-loop congruence
subgroups into the Laurent loops
`Matrix.SpecialLinearGroup (Fin 2) (LaurentSeries ℂ)` through the coefficient inclusion and
AffineLieAlgebras A8.3's Hopf and matrix dictionary, and prove that this map is injective and that the
resulting family of subgroups of Laurent loops is antitone. The predicate is instantiated on the
action read off the rank-one pseudofunctor by the comparison of §1.1, which by §2.3 is the rank-one
action itself, with the same action functors, unit and associator, all data compared and not only
the action functors.

Also apply AffineLieAlgebras A3.1's family `Q_M = Uκ/Uκ · t^M 𝔤[[t]]`, at the level `κ` of that
section and in particular at `κc`. Prove that coefficientwise conjugation by `G(ℂ[[t]])` normalizes
the defining left ideal and gives isomorphisms `T_g Q_M ≅ Q_M`, so that the direct sum `⊕_(M>0) Q_M`
is objectwise invariant under all of `G(ℂ[[t]])`; by AffineLieAlgebras A3.2 no single `K_N`
integrates its given left current action. Prove that each conjugation action is rational, by a finite window of PBW degree
and current order factoring through a finite jet, with locally nilpotent positive-current adjoint
operators. Assemble the natural conjugation maps into a strict coherent weak
`G(ℂ[[t]])`-equivariance of each `Q_M` and of the direct sum: isomorphisms `φ_g : T_g X ≅ X`
compatible with the unit and associator of the action (Frenkel–Gaitsgory, §20.2, pp. 121–122, weakly
equivariant objects). Its derivative is `ad(x) = left(x) − right(x)`, not the given left action on all
summands. This example separates coherent weak equivariance from rational integration with the
prescribed Lie derivative. *Needs:* AffineLieAlgebras A2.4, A3.1, A3.2, A8.3; FormalConnectionsOpers
§3.1; Mathlib `Matrix.SpecialLinearGroup`, `LaurentSeries`; Tau Ceti
`TauCeti.IsObjectwiseCongruenceInvariant`; §§1.1, 1.3, 2.3, 3.2.

**Checks.**
- For `g ∈ G(ℂ[[t]])` and a current `x ∈ t^M 𝔤[[t]]`, `Ad_g x` lies in `t^M 𝔤[[t]]` and the central
  correction `Res κ(g⁻¹dg, x)` vanishes, as `g⁻¹dg ∈ 𝔤[[t]] dt` pairs with `x` to a series with no
  `t⁻¹ dt` term; so conjugation preserves `Uκ · t^M 𝔤[[t]]`. For `g ∈ G(ℂ((t)))` with a pole, such as
  `diag(t, t⁻¹)`, `Ad_g` sends `e_M` to `e_(M+2)` but `f_M` to `f_(M−2)`, and the ideal is not preserved.
- In `Q_1` for `sl₂`, the derivative of conjugation by `exp(s h_0)` kills the cyclic vector, as
  `[h_0, 1] = 0`, while the given left action sends it to the nonzero PBW vector `h_0 · 1`
  (AffineLieAlgebras A2.4): the two actions of `𝔤[[t]]` differ.

### Examples

- The `sl₂` fibres `Ccrit(q)` for the `PGL₂`-opers `q = 0` and `q = 1`, disjoint full subcategories.
- The loop `diag(t, t⁻¹)` and the rescaling `φ = at`, whose twists satisfy the semidirect relation.
- The family `Q_M`, objectwise invariant and coherently weakly equivariant under `G(ℂ[[t]])` without a
  common integrating congruence subgroup.

### Dependencies

R1 and R2. AffineLieAlgebras A2.3, A2.4, A3.1, A3.2, A4.1, A4.2, A5.4, A8.1, A8.3;
FormalConnectionsOpers §§1.2, 3.1, 5.1, 5.2. Mathlib: semidirect products, action categories, special
linear groups over Laurent series. Tau Ceti: the completed enveloping algebra and its coordinate
automorphisms, discrete modules and strict character fibres with their twists.

## R4: equivariant groupoid transport and the categorical-lift conjecture

This layer fixes coherent equivariant transport of a family of categories with actions along a
parameter groupoid, compares it with normalized transport data on the prescribed fibres, and states
the critical categorical-lift conjecture.

### 4.1 Lift packages and their transport

For a category `Γ` (a groupoid in the applications), a group `H` and actions
`actions p : LocallyDiscrete (SingleObj H) ⥤ᵖ Cat` for `p : Γ`, define a *lift package* (coherent
equivariant transport) as a pseudofunctor `F : LocallyDiscrete (Γ × SingleObj H) ⥤ᵖ Cat` together
with, for each `p`, a strong transformation from the restriction of `F` to `{p} × SingleObj H`, by
Mathlib's `Prod.sectR` and `Functor.toPseudofunctor`, to `actions p`, whose component `e_p` is an
equivalence. This fixes the fibres and their actions up to equivariant equivalence and keeps all
isotropy of `Γ`. Construct the transport functors on the prescribed fibres,
`E_g = e_p⁻¹ ⋙ F(g, 1) ⋙ e_q`, with unit isomorphisms, composition isomorphisms
`E_g ⋙ E_h ≅ E_(g ≫ h)` and commuting isomorphisms `T_a ⋙ E_g ≅ E_g ⋙ T_a`, and prove that the
composition isomorphisms are associative and unital and that the commuting isomorphisms satisfy the
mixed unit, associativity and product diagrams. The mixed diagrams come from the two factorizations
`(𝟙 p, a) ≫ (g, 1) = (g, a) = (g, 1) ≫ (𝟙 q, a)` in the product category. Prove that for an
isomorphism `g` the functor `E_g` is an equivalence with inverse `E_(g⁻¹)`, that transport is a
pseudofunctor on `Γ`, and that the automorphism group of each object acts on its fibre. Define
*normalized transport data* on the prescribed fibres `C_p`: transport functors `E_g : C_p ⥤ C_q`,
unit isomorphisms, composition isomorphisms and commuting isomorphisms subject to all unit,
associativity and mixed diagrams. Construct the normalized data of a lift, conjugating the joint
functors by chosen inverses of the fibre comparisons, and the lift reconstructed from normalized
data with identity fibre comparisons, with isomorphisms comparing the transports of the
reconstruction with the given ones. Define morphisms of lifts as strong transformations of the
joint pseudofunctors with invertible modifications to the fibre comparisons, and their 2-morphisms
as the compatible modifications; prove that a morphism induces isomorphisms of transport functors,
with their component formulas, and that lifts, their morphisms and 2-morphisms form a bicategory.
Independent choices of an equivalence for each arrow are not assumed to admit coherent composition.
The shape of these data, with `E_Id = Id` and composition isomorphisms satisfying the cocycle
condition, is Frenkel, Conjecture 10.3.10, p. 335. *Needs:* Mathlib `Pseudofunctor`,
`Pseudofunctor.StrongTrans`, `Prod.sectR`, `Functor.toPseudofunctor`; §1.1.

*In Tau Ceti:* `TauCeti.EquivariantGroupoidLift`, `Pseudofunctor.restrictFiber`, `TauCeti.EquivariantGroupoidLift.fiber`, `TauCeti.EquivariantGroupoidLift.transport`, `TauCeti.EquivariantGroupoidLift.transportId`, `TauCeti.EquivariantGroupoidLift.transportComp`, `TauCeti.EquivariantGroupoidLift.transportComp_associativity`, `TauCeti.EquivariantGroupoidLift.transportComp_left_unitality`, `TauCeti.EquivariantGroupoidLift.transportComp_right_unitality`, `TauCeti.EquivariantGroupoidLift.transportCommIso`, `TauCeti.EquivariantGroupoidLift.transportCommIso_comp`, `TauCeti.EquivariantGroupoidLift.transportCommIso_id`, `TauCeti.EquivariantGroupoidLift.transportCommIso_actComp`, `TauCeti.EquivariantGroupoidLift.transportCommIso_actId`, `TauCeti.EquivariantGroupoidLift.transportEquivalence`, `TauCeti.EquivariantGroupoidLift.transportPseudofunctor`, `TauCeti.EquivariantGroupoidLift.endAction`, `TauCeti.EquivariantGroupoidLift.NormalizedTransport`, `TauCeti.EquivariantGroupoidLift.normalizedTransport`, `TauCeti.EquivariantGroupoidLift.NormalizedTransport.joint`, `TauCeti.EquivariantGroupoidLift.NormalizedTransport.toLift`, `TauCeti.EquivariantGroupoidLift.NormalizedTransport.toLiftTransportIso`, `TauCeti.EquivariantGroupoidLift.NormalizedTransport.toLiftTransportHom`, `TauCeti.EquivariantGroupoidLift.NormalizedTransport.toLiftTransportInv`, `TauCeti.EquivariantGroupoidLift.Hom`, `TauCeti.EquivariantGroupoidLift.Hom.Hom₂`, `TauCeti.EquivariantGroupoidLift.Hom.isoMk`, `TauCeti.EquivariantGroupoidLift.Hom.transportIso`, `TauCeti.EquivariantGroupoidLift.instBicategory`.

**Checks.**
- For `Γ` the one-object groupoid of a group `Π` and `H` trivial, a lift makes `Π` act on the fibre
  through its isotropy action; a family that records one equivalence for each pair of isomorphic parameters
  records a single autoequivalence of the fibre here and loses that action.

### 4.2 The biequivalence with normalized transport data

Make the normalized transport data on the prescribed fibres into a bicategory with only identity
2-morphisms: a morphism `N → N′` is a family of natural isomorphisms `E_g ≅ E′_g`, one for each arrow
`g`, compatible with the unit, composition and commuting isomorphisms of `N` and `N′`. Prove that
`Hom.transportIso` makes normalization `normalizedTransport` a pseudofunctor from the sub-bicategory of
lifts whose 1-morphisms are equivalences and whose 2-morphisms are invertible compatible modifications,
and that it is a biequivalence, with reconstruction `NormalizedTransport.toLift` as quasi-inverse.
Construct the unit and counit as strong equivalences, the unit at `L` an equivalence in the bicategory
of lifts between `L` and the reconstruction of its normalized data, and their modifications. This is
not an equivalence of the raw package types. *Needs:* Mathlib `Bicategory.Equivalence`; Tau Ceti
`TauCeti.EquivariantGroupoidLift.normalizedTransport`, `NormalizedTransport.toLift`,
`NormalizedTransport.toLiftTransportIso`, `Hom.transportIso`, `instBicategory`; §4.1.

**Checks.**
- Take `Γ` and `H` trivial and the prescribed fibre the category of finite-dimensional complex vector
  spaces. The lift whose joint fibre is the skeletal category of matrices (objects `n ∈ ℕ`, morphisms
  `m × n` matrices), with comparison `n ↦ ℂⁿ`, is not isomorphic to any reconstructed lift, whose
  joint fibre is the prescribed category itself, because a skeletal category is not isomorphic to one
  with distinct isomorphic objects; it is equivalent to one in the bicategory of lifts.

### 4.3 Linear refinement and exactness

For complex-linear fibres, define the *linear lifts* by imposing `ℂ`-linearity, Mathlib's
`Functor.Linear`, on the actual transported functors `E_g` after the fibre comparisons. Prove that
linearity is invariant under a strong transformation of transport pseudofunctors with linear
equivalence components and under pullback, and that it makes each transport equivalence linear.
Equivalences of the abelian fibre categories preserve their exact structures, since an equivalence
creates limits and colimits (`Functor.createsLimitsOfIsEquivalence`,
`Functor.createsColimitsOfIsEquivalence`). The critical conjecture uses this linear refinement, not
arbitrary semilinear functors between the fibres. *Needs:* Mathlib `Functor.Linear`,
`Functor.createsLimitsOfIsEquivalence`, `Functor.createsColimitsOfIsEquivalence`; §4.1.

*In Tau Ceti:* `TauCeti.EquivariantGroupoidLift.IsLinear`, `TauCeti.EquivariantGroupoidLift.isLinear_iff_of_strongTrans`, `TauCeti.EquivariantGroupoidLift.isLinear_pullback`, `TauCeti.EquivariantGroupoidLift.linear_transportEquivalence_functor`.

**Checks.**
- Complex conjugation `V ↦ V̄` (the same abelian group with `λ` acting as `λ̄`) is an additive
  autoequivalence of complex vector spaces sending `λ f` to `λ̄ F(f)`; it is not `ℂ`-linear, as
  `F(i f) = −i F(f)` for `f ≠ 0`. A lift transporting along an arrow by conjugation satisfies the
  unrefined definition and is not a linear lift.

### 4.4 The critical categorical-lift conjecture

Let `Γ = IsomOp` on complex points (FormalConnectionsOpers §8.1), let `H = G(ℂ((t)))`, and let
`actions p` be the classifying pseudofunctor (§1.1) of the action of §3.2 on `Ccrit(p)`. Define the
**critical categorical-lift conjecture** as the assertion that the type of lifts
`L : TauCeti.EquivariantGroupoidLift Γ actions` with `IsLinear ℂ L` is nonempty. Formalize this
package type and its consequences: a lift gives, for each arrow `g : p → q` of `IsomOp`, a `ℂ`-linear
`H`-equivariant equivalence `Ccrit(p) ≃ Ccrit(q)`, which is the statement of Frenkel, Conjecture 10.1.2,
p. 311; these equivalences compose coherently, as in Frenkel, Conjecture 10.3.10, p. 335, for regular
opers; and the automorphism group of `p` in `IsomOp`, the automorphisms of the underlying local system,
acts on `Ccrit(p)` commuting with `H`. The source asks for such a lift and presents its existence as
conjectural, so no theorem of this roadmap asserts the nonemptiness. An unqualified global geometric
Langlands theorem is not this conjecture. *Needs:* FormalConnectionsOpers §8.1; Tau Ceti
`TauCeti.EquivariantGroupoidLift`, `TauCeti.EquivariantGroupoidLift.IsLinear`,
`TauCeti.EquivariantGroupoidLift.transportEquivalence`, `TauCeti.EquivariantGroupoidLift.transportCommIso`,
`TauCeti.EquivariantGroupoidLift.endAction`; §§3.2, 4.1, 4.3.

**Checks.**
- For `G = SL₂`, the `PGL₂`-opers `q = 0` and `q = 1` are regular with isomorphic underlying local
  systems, both trivial, so `IsomOp` has arrows between them; a lift would give a `G((t))`-equivariant
  linear equivalence between `Ccrit(0)` and `Ccrit(1)`, which meet only in the zero module (§3.1).
  The conjectured transport is not an inclusion of full subcategories.
- For a regular oper `p` of `PGL₂`, the underlying local system is trivial, and its automorphisms in
  `IsomOp` form a group isomorphic to `PGL₂(ℂ)`, the horizontal automorphisms of the trivial
  connection; a lift makes this group act on `Ccrit(p)` commuting with `G((t))`, as Frenkel notes
  after Conjecture 10.3.10.

### 4.5 Trivial groups and the cocycle obstruction

For the trivial group, construct the lift of the trivial actions given by a pseudofunctor `F` on
`Γ`, and prove that its transport pseudofunctor is equivalent to `F`, by strong transformations in
both directions with invertible modifications between their composites and the identities. In the
one-object scalar case, with identity transport functors and compositors among the central units of
the category, the units of `CatCenter C` (the scalar-central-automorphism hypothesis), a chosen
compositor is a unit-valued 2-cochain: prove that associativity of the compositors is the 2-cocycle
equation, construct the pseudofunctor of a 2-cocycle, and prove that a change of trivializations
acts by the corresponding coboundary: between the pseudofunctors of two cocycles `c` and `c′`, the
identity components with naturality cells the central units `b(g)` form a strong transformation
exactly when `c′` is `c` multiplied by the coboundary of `b`. This shows that the coherence condition
has mathematical content. Transport along a groupoid equivalence is R5.1. *Needs:* Mathlib
`CatCenter`; §4.1.

*In Tau Ceti:* `Pseudofunctor.toEquivariantGroupoidLift`, `Pseudofunctor.toEquivariantGroupoidLiftTransportIso`, `Pseudofunctor.toEquivariantGroupoidLiftTransportHom`, `Pseudofunctor.toEquivariantGroupoidLiftTransportInv`, `Pseudofunctor.toEquivariantGroupoidLiftTransportHomInvIso`, `Pseudofunctor.toEquivariantGroupoidLiftTransportInvHomIso`, `TauCeti.centralUnitIso`, `TauCeti.centralUnitIso_associativity_iff`, `TauCeti.centralCocyclePseudofunctor`, `TauCeti.centralUnitIso_naturality_comp_iff`, `TauCeti.centralCocycleStrongTrans`.

**Checks.**
- On `ℤ/2 = {1, s}`, the cochain with `c(s, s) = −1` and `c = 1` otherwise is a cocycle, and the
  change of trivializations by `b(1) = 1`, `b(s) = i` turns it into the trivial cochain, since
  `b(s) b(s) / b(1) · c(s, s) = 1`: the obstruction vanishes, although `c` is not trivial.
- On `(ℤ/2)²`, the bicharacter `c((a, b), (a′, b′)) = (−1)^(b a′)` is a cocycle but not a coboundary,
  since coboundaries of an abelian group are symmetric and `c` is not: its pseudofunctor is a coherent
  action with identity action functors that is not equivalent to the trivial action.

### Examples

- The one-object groupoid of a group, where a lift is an action of that group on the fibre.
- The trivial-group lifts of pseudofunctors on `Γ`, and the cocycle actions of `(ℤ/2)²`.
- The regular `PGL₂`-opers `q = 0` and `q = 1`, joined by arrows of `IsomOp`.

### Dependencies

R1 and R3. Mathlib: pseudofunctors, strong transformations, modifications, equivalences in a
bicategory, linear functors, creation of limits by equivalences, the centre of a category.
FormalConnectionsOpers §8.1.

## R5: descent, outer derivations and relative transport

This layer descends lifts from opers to local systems (R5.1, §5.1), builds the unconditional
infinitesimal bridge from the cotangent algebroid of the centre to outer derivations and
self-extensions (R5.2, §5.2), and states the relative refinement of the conjecture over finite
Artinian coefficient algebras (R5.3, §5.3).

### 5.1 Complex-point descent

For an equivalence `e : Γ ≌ Λ`, construct the induced equivalence of the products with `SingleObj H`
(`Equivalence.prod e (Equivalence.refl)`) and the biequivalence of the bicategories of pseudofunctors
`LocallyDiscrete (Γ × SingleObj H) ⥤ᵖ Cat` and `LocallyDiscrete (Λ × SingleObj H) ⥤ᵖ Cat` given by
precomposition (`Pseudofunctor.precomp`): construct its quasi-inverse, its unit and counit from the
unit and counit of `e` (`Pseudofunctor.precompNatIso`, `Pseudofunctor.mapNatIso`), and its comparisons
on strong transformations and modifications. Prove that this biequivalence is compatible with the
prescribed fibre actions, pulling a lift back along a functor keeping its fibre comparisons and
transporting along the image (`TauCeti.EquivariantGroupoidLift.pullback`,
`TauCeti.EquivariantGroupoidLift.pullback_transport`). A fully faithful,
essentially surjective functor is first made an equivalence with chosen data (`Functor.IsEquivalence`,
`Functor.asEquivalence`).

Apply this to the functor `IsomOp → Loc_(G∨)(D×)` on complex points, into the gauge groupoid of
FormalConnectionsOpers §3.4: it is fully faithful by the definition of the arrows of `IsomOp`
(FormalConnectionsOpers §8.1), and essentially surjective by the oper-reduction theorem of
FormalConnectionsOpers §6.1, which settles Frenkel's Conjecture 10.1.1, p. 310. Conditional on a lift of
§4.4, construct its descent to local systems, the pullback along a chosen quasi-inverse, and prove its
independence of the choice up to pseudonatural equivalence and modification. A local-system fibre is
therefore a category up to coherent equivalence; choosing an oper lift presents it as the
corresponding full subcategory `Ccrit(p)`, and no intrinsic full subcategory independent of that
choice is selected. This is descent on complex points, not a claim of fpqc essential surjectivity over
all coefficient algebras. It is the complex-point form of the base change `ĝc-mod ≃ C ×_(Loc) Op` of
Frenkel, §10.1, (10.1-3), p. 310, and of Frenkel–Gaitsgory, §0.5, (0.9). *Needs:* Mathlib `Equivalence.prod`,
`Functor.IsEquivalence`, `Functor.asEquivalence`; Tau Ceti `Pseudofunctor.precomp`,
`Pseudofunctor.precompNatIso`, `Pseudofunctor.mapNatIso`, `TauCeti.EquivariantGroupoidLift.pullback`;
FormalConnectionsOpers §§3.4, 6.1, 8.1; §§4.1, 4.4.

**Checks.**
- The connection `d` with `A = 0` is an object of the gauge groupoid but not the image of any oper, as
  Drinfeld–Sokolov representatives `∂_t + p₋₁ + v(t)` have `p₋₁ ≠ 0`; it is isomorphic to the image of
  the oper `q = 0`. The functor is an equivalence but not surjective on objects, so descent needs a
  chosen quasi-inverse; two choices give joint pseudofunctors related by `Pseudofunctor.mapNatIso`.

### 5.2 The unconditional infinitesimal bridge

Put `A = Ûκc` and `Z = Subalgebra.center ℂ A`. Consume AffineLieAlgebras A6.3's flat full
`ℂ[[ℏ]]`-deformation `A_ℏ` at `κc + ℏκ0`, for A2.2's root-normalized `κ0`, its compatible truncations
modulo `ℏ^r`, and the central Poisson bracket `{z, w} = ([z̃, w̃]/ℏ) mod ℏ`. Derivations of `A` are
`TauCeti.derivationLieAlgebra ℂ A`, a Lie subalgebra of `Module.End ℂ A` with the associative Leibniz
equation; Mathlib's commutative `Derivation` is used only on `Z`. Define the continuous derivations
as the Lie subalgebra of derivations whose underlying map is continuous, with the topology of
pointwise convergence induced from `A^A`; prove that the actual image of the inner derivations is a
Lie ideal of it, and define `OutDer_cont(A)` as the quotient by that image with the quotient
topology, not by its closure: the inner natural isomorphisms below use actual elements of `A`.
Prove that two continuous derivations have the same class exactly when they differ by `ad_b` with
`b ∈ A`, that `OutDer_cont(A)` is a `Z`-module, and that every derivation preserves `Z`, with inner
derivations restricting to zero there, so that restriction to the centre is a Lie homomorphism from
`OutDer_cont(A)` to the derivations of `Z`. The source of this subsection is Frenkel–Gaitsgory, §7.4,
Lemma 7.4.1, Theorem 7.4.2 and the map (7.2), pp. 54–55.

*In Tau Ceti:* `TauCeti.continuousDerivationLieAlgebra`, `TauCeti.continuousInnerDerivation`, `TauCeti.continuousInnerDerivation_isIdealMorphism`, `TauCeti.ContinuousOuterDerivation`, `TauCeti.ContinuousOuterDerivation.mkQ_eq_mkQ_iff`, `TauCeti.ContinuousOuterDerivation.instModuleCenter`, `TauCeti.ContinuousOuterDerivation.restrictCenter`.

*The map `θ`.* Consume A6.3's continuous coefficient-linear ordered-PBW specialization section
`s : A → A_ℏ`, its compatibility with the stage kernels, its division-by-`ℏ` estimates and its
continuous product defect `c(z, w) = (s(zw) − s(z)s(w))/ℏ mod ℏ`. For `z ∈ Z` and an admissible lift
`z_ℏ ∈ A_ℏ`, consume A6.3's continuous operator `δ_z(a) = [z_ℏ, a_ℏ]/ℏ mod ℏ`, its independence of
`a_ℏ`, its Leibniz identity and the change-of-lift formula `δ_(z_ℏ+ℏb_ℏ) = δ_z + ad_b`, and package it in
`TauCeti.continuousDerivationLieAlgebra ℂ A` without reconstructing the operator or its division
bounds. Construct the continuous `Z`-linear map `θ : Ω¹_cont(Z) → OutDer_cont(A)`, `θ(dz) = [δ_z]`,
through the completed-coordinate chart of FormalConnectionsOpers §5.2 and the central generators `S_a`
of AffineLieAlgebras A8.1. For `ξ = Σ_a f_a dS_a`, construct the representative
`D_ξ(a) = Σ_a f_a δ_(s(S_a))(a)` by stagewise convergence, and prove its existence, its continuity in
`a` and in `ξ`, and its scalar linearity. Prove `z ∈ Z ∩ ker π_N ⇒ zA ⊆ ker π_N`, and combine it with
A6.3's right-multiplication estimates and the `ℏ`-torsion-freeness of the stages to control arbitrary
central coefficients. For two continuous stage-compatible sections, prove that the representatives
differ by `ad_b` for the actual convergent sum `b = Σ_a f_a b_a ∈ A`.

*The ordered lift.* Construct a separate coefficient-linear central-monomial lift `s̃ : Z → A_ℏ`: lift
each `S_i[r]` by `s(S_i[r])`; for the weight `w_i = d_i + 1`, order the factors of a monomial by
increasing depth `⌊r / w_i⌋` from left to right, breaking ties by a fixed order on the finite generator
index and then on `r`. By AffineLieAlgebras A8.1's threshold `S_i[r] ∈ ker π_N ⇔ r ≥ w_i N`, a factor
lies in the stage kernel exactly when its depth is at least `N`, so if any factor does, the rightmost
one does. Each stage has the coordinates `r < w_i N`, each polynomial uses finitely many of them, and
A8.1's quotient polynomial chart and its bounded-index transitions apply. In rank one all `w_i = 2`,
and the order is that of increasing mode index; when the weights differ, the raw mode index alone does
not have this property. The lift is linear and ordered, not an algebra homomorphism. Prove its
continuous extension, its stage-kernel compatibility, and `δ_(s̃(z)) = D_(dz)` for every `z ∈ Z`. Define
the continuous inner correction `b(z) = (s(z) − s̃(z))/ℏ mod ℏ` by A6.3's division estimates, and prove
`θ(dz) = [δ_(s(z))]` for every `z`. Use the same ordering to compute the inner correction of the
cotangent Lie bracket below, and prove that this correction converges in `A`. No convergence is
claimed for a sum of product-defect terms in arbitrary factor order: changing the order can accumulate
divergent central terms although the inner derivations converge. Define `θ(ξ)` as the class of `D_ξ`,
and prove its independence of the admissible lift sections. The differential chart is topologically
free on its coordinate differentials, with no unspecified presentation relations. The quotient by the
actual inner image need not be separated, so no complete separated universal property of that quotient
is used.

*The anchor and the Lie–Rinehart identities.* Prove that restriction to the centre gives the anchor
`θ(dz)(w) = {z, w}` (through `TauCeti.ContinuousOuterDerivation.restrictCenter`), and the Lie–Rinehart
identities `θ([ξ, η]) = [θξ, θη]` and `[ξ, fη] = f[ξ, η] + anchor(ξ)(f) η`, using A6.3's comparison of
order `ℏ²` with the full family. Under AffineLieAlgebras A8.3 the original `κ0` pairs with the dual
inverse Cartan form `κ0∨` of FormalConnectionsOpers §7.2, and this normalization is kept in the
Poisson and anchor comparison. The continuous differential module, the cotangent bracket and its
identification with the source-fixed dual-gauge Lie algebroid are FormalConnectionsOpers §§7.1–7.2 and
§8.2, not constructed again here; §8.2's sign is kept: the Hamiltonian cotangent label `dH_x`
corresponds to the left-gauge label `−x`.

*Self-extensions and their classes.* For a derivation `δ` and an `A`-module `M`, construct the
self-extension `E_δ(M) = M ⊕ M` with `a · (u, v) = (a · u + δ(a) · v, a · v)`, with injection
`u ↦ (u, 0)`, projection `(u, v) ↦ v`, and prove that `0 → M → E_δ(M) → M → 0` is short exact. For
`δ′ = δ + ad_b`, prove that `(u, v) ↦ (u + b · v, v)` is a natural isomorphism of extensions
`E_δ(M) ≅ E_δ′(M)`. For `δ` continuous and `M` discrete, prove that `E_δ(M)` is discrete, lift the
actual short complex, both maps included, to the discrete category through `ObjectProperty.homMk`,
and prove that it is short exact there. Define the class of `E_δ(M)` as
`ShortComplex.ShortExact.extClass` in the discrete category, in the module universe `max u w` of
AffineLieAlgebras A5.2's `Ext` (in Tau Ceti `TauCeti.hasExt_discreteModules`, from enough injectives
by Mathlib's `hasExt_of_enoughInjectives`); an ambient `ModuleCat` sequence alone does not define
that class. For any abelian category with `Ext`, prove that the pullback-pushout Baer sum of two
short exact sequences has the sum of their classes; prove that the Baer sum of `E_δ` and `E_η` has
the class of `E_(δ+η)`, so that the class is additive in `δ`. Prove that the class is linear for
central scalars, unchanged by inner changes, and natural: for `f : M → M′`, pushforward of the class
of `M` equals pullback of the class of `M′` in `Ext¹(M, M′)`. It therefore descends to a `Z`-linear
map `OutDer_cont(A) → Ext¹(M, M)`, natural in `M`.

*In Tau Ceti:* `TauCeti.DerivationExtension`, `TauCeti.DerivationExtension.inlHom`, `TauCeti.DerivationExtension.sndHom`, `TauCeti.DerivationExtension.shortComplex`, `TauCeti.DerivationExtension.shortExact_shortComplex`, `TauCeti.DerivationExtension.innerEquiv`, `TauCeti.DerivationExtension.innerEquiv_trans`, `TauCeti.DerivationExtension.functorInnerIso`, `TauCeti.discreteModules_derivationExtension`, `TauCeti.DerivationExtension.discreteShortComplex`, `TauCeti.DerivationExtension.shortExact_discreteShortComplex`, `TauCeti.DerivationExtension.extClass`, `ShortComplex.baerSum`, `ShortComplex.ShortExact.extClass_baerSum`, `TauCeti.DerivationExtension.extClass_baerSum`, `TauCeti.DerivationExtension.extClass_add`, `TauCeti.DerivationExtension.extClass_center_smul`, `TauCeti.DerivationExtension.extClass_smul`, `TauCeti.DerivationExtension.extClass_eq_of_inner`, `TauCeti.DerivationExtension.extClass_eq_zero_iff`, `TauCeti.DerivationExtension.extClass_naturality`, `TauCeti.DerivationExtension.outerExtClass`, `TauCeti.DerivationExtension.outerExtClass_naturality`.

*The extension classes of `θ`.* Prove that the composite
`Ω¹_cont(Z) → OutDer_cont(A) → Ext¹_Ccrit(M, M)` of `θ` with this class map is `Z`-linear and natural
in `M`, which is the map (7.2) of Frenkel–Gaitsgory.

*The character.* For `M ∈ Ccrit(p)`, prove that a central `z` acts on `E_δ(M)` by the block matrix
`[[χp(z), χp(δz)], [0, χp(z)]]`; with `ε(u, v) = (v, 0)` this is the dual-number character
`χp + ε (χp ∘ δ|Z)`. It is an ambient smooth extension and a first-order motion of the character:
prove that `E_δ(M)` lies in the fixed strict-character category exactly when every scalar
`χp(δz)`, `z ∈ Z`, annihilates `M`, so that it is generally not an extension inside that category.

*In Tau Ceti:* `TauCeti.DerivationExtension.center_smul`, `TauCeti.derivationLieAlgebra.characterDeformation`, `TauCeti.DerivationExtension.center_smul_eq_iff`.

*The character and the anchor.* Prove that for `δ` representing `θ(ξ)` the first-order motion
`χp ∘ δ|Z` is the anchor of `ξ` evaluated at `p`. These constructions give the infinitesimal
extension class; they are not a theorem integrating an action of outer derivations to groupoid
transport. *Needs:* AffineLieAlgebras A2.2, A5.2, A6.3, A8.1, A8.3; FormalConnectionsOpers §§5.2,
7.1, 7.2, 8.2; Mathlib `Derivation`, `ShortComplex.ShortExact.extClass`, `hasExt_of_enoughInjectives`,
`ObjectProperty.homMk`; Tau Ceti `TauCeti.derivationLieAlgebra`, `TauCeti.hasExt_discreteModules`;
§§2.2, 3.1.

**Checks.**
- Replacing the lift `z_ℏ` by `z_ℏ + ℏ b_ℏ` changes `[z_ℏ, a_ℏ]/ℏ` by `[b_ℏ, a_ℏ]`, whose reduction is
  `ad_b(a)`: the class `[δ_z]` is independent of the lift, while the derivation `δ_z` is not, so `θ` must
  take values in outer derivations.
- On the discrete algebra `ℂ[x]`, with `δ = d/dx` and `M = ℂ_λ`, `E_δ(M)` is `ℂ²` with `x` acting by
  the Jordan block `[[λ, 1], [0, λ]]`: the extension does not split, its class in
  `Ext¹(ℂ_λ, ℂ_λ) ≅ ℂ` is nonzero, and `E_δ(M)` leaves the strict fibre of `x ↦ λ`, as the block matrix
  predicts with `χ(δx) = χ(1) = 1`.
- For `sl₃`, with weights `w_1 = 2` and `w_2 = 3`, the factors `S_1[4]` and `S_2[5]` have depths `2` and
  `1`. At `N = 2`, `S_1[4]` lies in the stage kernel (`4 ≥ 4`) and `S_2[5]` does not (`5 < 6`). Ordering
  by depth puts `S_1[4]` on the right, so the product lies in the left ideal `ker π_2`; ordering by
  raw mode index puts `S_2[5]` on the right, and the left-ideal property gives nothing.

### 5.3 Relative module family and the formal refinement question

*Coefficient algebras and module families.* Let `Art_ℂ` be the category of finite-dimensional
commutative augmented local Artinian `ℂ`-algebras with residue field `ℂ`, with augmentation-preserving
algebra maps. For `R ∈ Art_ℂ`, use the polynomial affine Lie algebra at level `κc` over `R` and its
vectorwise smooth modules, all of them and not only the flat ones. Construct the finite
scalar-extension adapter to AffineLieAlgebras A5's completion from its left-ideal module quotients:
prove that finite coefficient extension commutes with those quotients and with their compatible
families, that the action extends uniquely, and that the two module presentations agree. Extend
AffineLieAlgebras A2.3's loop automorphism formula coefficientwise to `H_R = G(R((t)))`, with its
order-shift and product laws. This subsection owns these finite-Artinian scalar-extension adapters to
AffineLieAlgebras A2, A4 and A5; AffineLieAlgebras owns the general completion, lift and category
foundations. Prove that `H_R` fixes `R ⊗_ℂ Z` pointwise, by the finite coefficient comparison and
AffineLieAlgebras A8.3's centre-fixing identities, so that the strict `R`-character fibres are stable.

Use FormalConnectionsOpers §5.2's oper evaluation over `R`, with its common pole bound and base-change
laws, and AffineLieAlgebras A8's centre isomorphism to define `χ_p` for every
`p ∈ Op_(G∨)(D×)(R)`, and the strict character equation of §2.2 to form `C_R(p)`. For `u : R → S`,
construct `B_u(p) : C_R(p) → C_S(u p)` by `M ↦ S ⊗_R M`, prove its smoothness and its comparison with
the completed actions, and build its unit, tensor-composition and associativity comparisons. Prove
`u`-semilinearity on morphisms, `B_u(r f) = u(r) B_u(f)`, and the equivariance
`B_u(p) ∘ T_h^p ≅ T_(u h)^(u p) ∘ B_u(p)` with its unit and product diagrams. These functors need not be
equivalences. Flat modules form a separate object property.

*Relative lifts.* Use FormalConnectionsOpers §8.1's groupoid `Γ_R = IsomOp(R)` and the actual `H_R`
actions. A relative lift consists of joint pseudofunctors
`F_R : LocallyDiscrete (Γ_R × SingleObj H_R) ⥤ᵖ Cat` with equivalences `e_(R,p) : F_R(p, ⋆) ≌ C_R(p)`
respecting the original-loop actions, as in §4.1, with `R`-linearity of each actual fibre transport
after these comparisons. For `u : R → S`, use the domain functor `D_u(g, h) = (u g, u h)` and a strong
base-change transformation `β_u : F_R ⇒ F_S ∘ D_u` with specified invertible 2-cells

    β_u(p) ⋙ e_(S,u p).functor ≅ e_(R,p).functor ⋙ B_u(p).

These cells respect both gauge-arrow and `H_R` naturality, including the equivariance of `B_u` above.
Specify the modification identifying `β_id` with the identity and the compositor identifying two
successive `β`'s with `β_(v∘u)`; for three coefficient maps the two composites coincide after the
associator, and both identity triangles hold. These data are compatible with the unit and product
compositors of the joint pseudofunctors. This specifies a family on the Grothendieck construction with
the actual prescribed fibre and base-change comparisons.

*The first-order data.* The formal refinement question asks for a relative lift of this complete type
together with the following compatible infinitesimal data. For `R = ℂ[ε]/ε²`, fix the source to the
constant lift of `p` and consider arrows reducing to `id_p`. Use FormalConnectionsOpers §8.2's
source-fixed algebroid fibre, choose a global cotangent extension of `ξ` at `p`, and use §5.2's
stage-compatible representative `D_ξ`. Prove that two extensions differing by the closed span of
`m_p · Ω¹_cont(Z)` act identically on the strict-character module: central coefficients in `m_p` kill
`M`, and the relevant convergent limits act by zero by its discrete continuity. Index all further
comparisons of representatives by actual elements `b ∈ A` with `δ′ = δ + ad_b`, supply the natural
comparison `(u, v) ↦ (u + b v, v)`, and require its identity, addition and composition diagrams. For
`c ∈ Z`, keep its automorphism `1 + ε χ_p(c)` rather than identifying the choices `b` and `b + c`;
these central comparison cells are part of the refinement data.

The actual first-order transport is compared with restriction through `(id − εδ)⁻¹ = id + εδ`, with
target character `χp + ε χp ∘ δ|Z` and underlying extension `E_δ`, and the comparison is
`H_R`-equivariant. From A6.3's level-dependent action on `A_ℏ` and the chosen PBW lifts, construct
actual coherent elements `b(γ, ξ)`: on a coordinate differential `dS_a` use A6.3's divided change of
`s(S_a)`, and extend `Z`-linearly by the convergent coefficient presentation of `D_ξ`. For every `z`
this is `b(γ, dz) = (a_(ℏ,γ)(s̃(z)) − s̃(z))/ℏ mod ℏ`, with the same ordered lift as in
`D_(dz) = δ_(s̃(z))`; prove the equality with the coefficient formula, A6.3's lift-quantified export
applying to `s̃(z)`. For the alternative representative `δ_(s(z)) = D_(dz) + ad_(b(z))` the correction is
instead `b(γ, dz) + (a_γ − 1) b(z)`; keep that comparison of actual elements and do not identify the
two representatives' corrections. Prove `a_γ δ a_γ⁻¹ = δ + ad_(b(γ,ξ))` and the unit and product laws
`b(1, ξ) = 0`, `b(γγ′, ξ) = b(γ, ξ) + a_γ b(γ′, ξ)`, and use their inner natural isomorphisms in the
commuting comparison with `T_γ`. For an infinitesimal original loop `1 + η y`, with `y` its actual
current image in `A`, prove `[δ, ad_y] = ad_(δ(y))` and impose the corresponding `εη` comparison with
the first-order gauge transport. These comparison cells supply the original-loop infinitesimal
equivariance.

*The mixed second-order data.* For `ℂ[ε, η]/(ε², η²)`, consume FormalConnectionsOpers §8.2's mixed
dual-gauge calculation and keep its cotangent sign. With `a_g = id − εδ_x` and `a_h = id − ηδ_y`, prove
that the flow product `g_h⁻¹ g_g⁻¹ g_h g_g` gives module restriction through `id + εη[δ_x, δ_y]`, and
require its compositor comparison, independence under the indexed inner changes, unit identities and
naturality for scalars and base change. FormalConnectionsOpers owns the gauge Lie-algebroid calculation;
this subsection owns these comparisons of categories and inner cells.

*The refinement types.* Define the two-jet refinement by restricting this relative package to `R` whose
maximal ideal has cube zero, and the all-Artinian refinement by the full `Art_ℂ` package. Construct the
forgetful maps from the all-Artinian type to the two-jet type and to the complex-point type of §4.4,
and the comparison with §5.2's extension classes extracted from any compatible refinement. Their
nonemptiness is a separately named conjectural question: neither the outer-derivation results of §5.2
nor the pointwise conjecture of §4.4 asserts it. This makes the proposed integration of the algebroid
to a lift precise without asserting an unconditional integration theorem. *Needs:* AffineLieAlgebras
A2.3, A4, A5, A6.3, A8, A8.3; FormalConnectionsOpers §§5.2, 8.1, 8.2; Tau Ceti
`TauCeti.EquivariantGroupoidLift`, `TauCeti.DerivationExtension.innerEquiv`; §§2.2, 4.1, 4.4, 5.2.

**Checks.**
- For `c = 1 ∈ Z`, `ad_1 = 0`, so `b` and `b + 1` give the same derivation `δ + ad_b`; their comparisons
  `(u, v) ↦ (u + b v, v)` and `(u, v) ↦ (u + b v + v, v)` differ by `(u, v) ↦ (u + v, v)`, the
  automorphism `1 + ε` of `E_(δ+ad_b)(M)` in the coordinates `v + εu`. Identifying `b` with `b + 1` would make
  this automorphism the identity.
- With `X = δ_x` and `Y = δ_y`, `(1 + ηY)(1 + εX)(1 − ηY)(1 − εX) = 1 − εη[X, Y]`, so the twist by the
  flow product restricts along its inverse `id + εη[δ_x, δ_y]`; the opposite order of factors gives
  `id − εη[δ_x, δ_y]`.
- Over `ℂ[ε]/ε²`, restriction of `M ⊗ ℂ[ε]` through `id + εδ` lets `a` act on `v + εu` by
  `a v + ε(a u + δ(a) v)`, which is `E_δ(M)` in the coordinates `(u, v)`; central elements act by
  `χp(z) + ε χp(δz)`.

### Examples

- The groupoid with two objects and exactly one arrow between any two is equivalent to the trivial
  groupoid; descent along this equivalence presents a lift by the fibre over one object with its
  action, the other fibre being recovered by transport.
- The Jordan-block self-extension of `ℂ[x]`-modules, and the rank-one critical centre with `S_n` of
  weight two, where the ordered lift is ordered by mode index.
- The first-order data over `ℂ[ε]/ε²` and the mixed data over `ℂ[ε, η]/(ε², η²)`.

### Dependencies

R2–R4. Mathlib: equivalences of categories and their products, derivations, short exact sequences
and their `Ext` classes. Tau Ceti: precomposition of pseudofunctors and the equivalences induced by
natural isomorphisms, derivations of associative algebras, `Ext` of discrete modules.
AffineLieAlgebras A2.2, A2.3, A4, A5, A6.3, A8.1, A8.3; FormalConnectionsOpers §§3.4, 5.2, 6.1, 7.1,
7.2, 8.1, 8.2.

## Scope and ownership

**This roadmap owns** R1 to R5 above: the categorical actions, their pseudofunctors, equivariant
functors, invariant full subcategories, transport along equivalences and objectwise congruence
invariance (R1); the coherent twisting actions on the supplied module categories and their
central-character fibres, their equivariant inclusions and quotient presentations, the family over
an action category and the cells of the rank-one fibres (R2); the critical category, its fibres
`Ccrit(p)`, the coherent loop-group action on each fibre, the pseudofunctor over the action groupoid
of `H ⋊ S`, objectwise congruence invariance of finitely generated critical modules and the coherent
weak equivariance of the family `Q_M` (R3); lift packages, their transport, normalized data,
morphisms and bicategory, the biequivalence with normalized transport data, the linear refinement,
the statement of the critical categorical-lift conjecture and its consequences, and the trivial-group
comparison with the cocycle obstruction (R4); descent of lifts along equivalences of parameter
groupoids and along `IsomOp → Loc_(G∨)(D×)` (R5.1); continuous outer derivations, the map `θ`, its
representatives and ordered lift, its anchor and Lie–Rinehart identities, the self-extensions
`E_δ(M)` with their classes and the map `Ω¹_cont(Z) → Ext¹(M, M)` (R5.2); and the finite-Artinian
scalar-extension adapters, the relative fibres and base-change functors, the relative lift type and
the formal refinement question (R5.3). The declarations of the Tau Ceti library that realise these
items are named in the items above. The coherent categorical actions, fibres and descent over opers,
the outer-derivation comparison with `Ext¹` and the finite-Artinian adapters are assigned to this
roadmap by AffineLieAlgebras.

**Already in the libraries and consumed here.** Each object has one owner; the exact declarations are
listed under the supplier contracts.

- *Discrete and smooth modules, strict character fibres and their twists* (R2, R3, R5.2): the Tau Ceti
  library has discrete and smooth modules with their closure properties, coinduction, enough
  injectives and `Ext`, the strict character fibres, the twist of a fibre by one automorphism, the
  stability of the fibres under centre-fixing automorphisms and the central-quotient presentation.
  These are the generic forms of AffineLieAlgebras A5.1–A5.3, which owns them and their affine
  instances.
- *The completed enveloping algebra and its coordinate automorphisms* (R3): the Tau Ceti library has
  the left-ideal completion of the level enveloping algebra, its centre and its coordinate
  automorphisms; AffineLieAlgebras owns them as A4.1, A4.2 and A5.4.
- *Precomposition of pseudofunctors* (R5.1): the Tau Ceti library has precomposition of
  pseudofunctors as a pseudofunctor and the equivalences induced by natural isomorphisms, from which
  R5.1 builds its biequivalence.
- *Derivations of associative algebras* (R5.2): the Tau Ceti library has the Lie algebra of
  derivations of an associative algebra, inside its linear endomorphisms, and inner derivations;
  Mathlib has abelian categories with `Ext` and the abelian structure on full subcategories closed
  under kernels, cokernels and finite products.

**Owned elsewhere and consumed here.** AffineLieAlgebras owns the smooth and completed module
categories and their equivalence, the loop and coordinate lifts, rational integration to `K_N`, the
deformation family with its sections and divided operators, the completed centre and the
Feigin–Frenkel normalizations, including the coordinate character equation, the rank-one isomorphism
and the loop-group action fixing the centre (A2–A6, A8). FormalConnectionsOpers owns the loop groups
and congruence subgroups, coordinate automorphisms, opers, their function algebras and evaluation,
the gauge groupoid, the oper-reduction theorem, the Drinfeld–Sokolov Poisson structure and cotangent
algebroid, and `IsomOp` with its differentiation (§§1.2, 3.1, 3.4, 5.1, 5.2, 6.1, 7.1, 7.2, 8.1,
8.2). Formal algebraic gauge foundations and finite-dimensional smooth groupoid foundations have
different owners; this roadmap uses the former. The local Langlands motivation of the sources, the
arithmetic analogy, is motivation only: no equivalence between these categories and arithmetic
representations is a target, and the examples keep that distinction. The unrestricted existence of
the categorical lift (§4.4) and of the relative refinements (§5.3) are conjectures, stated as precise
types and never asserted.

## Exact supplier contracts

### From Mathlib

- Monoidal actions: `MonoidalLeftAction`, its action functors `MonoidalLeftAction.actionLeft`, the curried
  form `MonoidalLeftAction.curriedActionMop` into the monoidal opposite of the endofunctors, with
  `MonoidalLeftAction.curriedActionMopMonoidal`, and equivariant functors `Functor.LeftLinear`
  (`Mathlib/CategoryTheory/Monoidal/Action/`). The composition-order design is that of the Zulip
  discussion listed in the references.
- Bicategories: `SingleObj` (with `g ≫ h = h * g`), `LocallyDiscrete`, `Cat`, `Pseudofunctor`,
  `Pseudofunctor.StrongTrans`, `Pseudofunctor.StrongTrans.Modification`, `Functor.toPseudofunctor`,
  `Prod.sectR`, `Bicategory.Equivalence`, `CatCenter`.
- Full subcategories: `ObjectProperty.FullSubcategory`, `ObjectProperty.ι`, `ObjectProperty.ιOfLE`,
  `ObjectProperty.lift`, `ObjectProperty.homMk`, `ObjectProperty.ContainsZero`,
  `ObjectProperty.IsClosedUnderKernels`, `ObjectProperty.IsClosedUnderCokernels`,
  `ObjectProperty.IsClosedUnderFiniteProducts`, and the instance making such a full subcategory of an
  abelian category abelian (`Mathlib/CategoryTheory/Abelian/Subcategory.lean`).
- Modules: `ModuleCat.restrictScalars`, `ModuleCat.restrictScalarsId'`, `ModuleCat.restrictScalarsComp'`
  and their components `ModuleCat.restrictScalarsId'App`, `ModuleCat.restrictScalarsComp'App`, whose
  underlying linear maps are identities; `MulSemiringAction.toRingEquiv`; `Subalgebra.center`.
- Groups: `SemidirectProduct`, `ActionCategory`, `Matrix.SpecialLinearGroup`, `LaurentSeries`.
- Linear and homological algebra: `Functor.Linear`, `Derivation`, `ShortComplex.ShortExact`,
  `ShortComplex.ShortExact.extClass` and `ShortComplex.ShortExact.extClass_naturality`,
  `Abelian.Ext`, `HasExt`, `hasExt_of_enoughInjectives`, `EnoughInjectives`.
- Equivalences: `Equivalence.prod`, `Equivalence.refl`, `Functor.IsEquivalence`,
  `Functor.asEquivalence`, `Functor.createsLimitsOfIsEquivalence`,
  `Functor.createsColimitsOfIsEquivalence`.

### From Tau Ceti

Each is assumed as stated at the pinned library. Names in the namespace `CategoryTheory` are written
without that prefix. The declarations of the library that realise this roadmap's own items are named
in those items, on their *In Tau Ceti:* lines, and are not repeated here.

- Discrete and smooth modules (`Algebra/Category/ModuleCat/Smooth/`), the generic forms of
  AffineLieAlgebras A5.1–A5.2: `TauCeti.smoothModules`, `TauCeti.discreteModules`,
  `TauCeti.discreteModules_iff_isOpen`, `TauCeti.smoothModules_eq_discreteModules`,
  `TauCeti.smoothModules_directSum`, `TauCeti.smoothPartFunctor`, `TauCeti.coinduction`,
  `TauCeti.enoughInjectives_smoothModules`, `TauCeti.hasExt_discreteModules` (`Ext` in the module
  universe `max u w` over `A : Type u`), `Ideal.discreteQuotientEquivalence`.
- Strict character fibres and the twist of one automorphism
  (`Algebra/Category/ModuleCat/CentralCharacter/`, `Algebra/Category/ModuleCat/Twist.lean`), the generic
  forms of AffineLieAlgebras A5.3: `TauCeti.centralCharacterModules`,
  `TauCeti.discreteCentralCharacterModules`, `TauCeti.centerCongr`, `TauCeti.discreteCentralCharacterTwist`,
  `MonoidHom.isStableUnderLeftAction_discreteCentralCharacterModules_of_centerFixed`,
  `MonoidHom.isStableUnderLeftAction_discreteModules`, `MonoidHom.isStableUnderLeftAction_smoothModules`,
  `AlgHom.discreteCentralCharacterQuotientEquivalence`.
- Precomposition (`CategoryTheory/Bicategory/FunctorBicategory/`,
  `CategoryTheory/Bicategory/NaturalTransformation/LocallyDiscrete.lean`): `Pseudofunctor.precomp`,
  `Pseudofunctor.precompNatIso`, `Pseudofunctor.mapNatIso`, `Pseudofunctor.whiskerLeft`.
- Derivations of associative algebras (`Algebra/Lie/Derivation/`): `TauCeti.derivationLieAlgebra`,
  `TauCeti.innerDerivation`.
- Currents (`Algebra/Lie/Current/`), the generic forms of AffineLieAlgebras A4.1–A4.2:
  `TauCeti.CurrentAlgebra.CompletedEnveloping` (the completion `lim_N U/I_N` at a central value, a
  topological ring), `TauCeti.CurrentAlgebra.centerOrderIdeal`,
  `TauCeti.CurrentAlgebra.coordinateCompletedEnvelopingAut`,
  `TauCeti.CurrentAlgebra.smoothModules_iff_exists_surjective_pi_orderQuotient`.

### From TauCetiRoadmap.AffineLieAlgebras

A2.2 (the forms `κ0`, `κc = −h∨ κ0`); A2.3 (the affine loop lift and the coordinate group, with the
composition order of substitutions); A2.4 (the level quotient `Uκ`, the left ideals `I_N` and the
module quotients `Q_N`); A3.1 (smooth modules, the family `Q_M`); A3.2 (rational integration to `K_N`
of finitely generated smooth modules, and the absence of a common `K_N` for `⊕ Q_M`); A4.1 (the
completion `Ûκ`); A4.2 (completed loop and coordinate lifts by continuous automorphisms with continuous
inverses, with the semidirect conjugacy `aσ a_g aσ⁻¹ = a_(σ(g))`); A5.1–A5.4 (smooth and continuous
module properties, continuous coinduction, enough injectives and `Ext`, central characters and
automorphism pullback, the smooth/completed module equivalence); A6.3 (the deformation `A_ℏ` at
`κc + ℏκ0`, its truncations, the section `s`, the product defect, the divided commutators `δ_z` with the
change-of-lift formula, the divided loop changes quantified over lifts, the order-`ℏ²` comparison and
the critical Poisson bracket); A8.1 (the completed critical centre, the generators `S_i[r]`, the
threshold `S_i[r] ∈ ker π_N ⇔ r ≥ w_i N` and the quotient polynomial charts); A8.3 (the Feigin–Frenkel
normalizations, `aσ(F) = F ∘ σ⁻¹` on oper functions, the character equation
`eval_(σp) = eval_p ∘ a_σ⁻¹` with pullback along `a_σ⁻¹` carrying the fibre at `p` to the fibre at
`σp`, pointwise fixation of the centre by the original loop group, the selected rank-one isomorphism
with `S_n ↦ q_(−n−2)`, the rank-one loop automorphism homomorphism and the Hopf and matrix
dictionary). Assumed as stated there.

### From TauCetiRoadmap.FormalConnectionsOpers

§1.2 (coordinate automorphisms and the right action `(q^φ)^ψ = q^(φ∘ψ)`); §3.1 (the loop groups `LG`,
`L⁺G`, the congruence subgroups `K_N` and the coefficient inclusions); §3.4 (the gauge groupoid and
`Loc_G(D×)`); §5.1 (the coordinate action on opers); §5.2 (the oper function algebras, the evaluation
characters over every coefficient algebra with their base-change laws, and the continuous cotangent
module); §6.1 (every flat bundle on the punctured disc has an oper reduction, on complex points); §7.1
and §7.2 (the Drinfeld–Sokolov Poisson structure, the cotangent Lie–Rinehart algebroid and the form
`κ0∨`); §8.1 (`IsomOp`, its arrows the isomorphisms of underlying local systems, with composition
`hg`); §8.2 (the source-fixed differentiation, the identification `dH_x ↦ −x` and the mixed `εη`
calculation). Assumed as stated there.

## References

- Edward Frenkel, [*Langlands Correspondence for Loop Groups*](https://math.berkeley.edu/~frenkel/loop.pdf),
  Cambridge Studies in Advanced Mathematics 103 (2007): §1.3.3, p. 25 (an action of a group of complex
  points on a category); §1.3.4 with Lemma 1.3.1, pp. 26–27 (smooth representations, objectwise
  stability under congruence subgroups, integrability of finitely generated smooth
  `𝔤((t))`-modules); §1.3.5, p. 27 (smooth modules with the loop-group action as the categorical
  analogue of smooth representations); §1.3.6, p. 29 (Lemma 1.3.1 for `ĝκ`); §10.1, pp. 307–311 (the
  fibres `ĝc-mod_χ` over opers, the loop-group action along the fibres, the base change (10.1-3),
  Conjectures 10.1.1 and 10.1.2);
  §10.3.7, pp. 334–335 (the groupoid of isomorphisms of underlying local systems and Conjecture 10.3.10).
- Edward Frenkel and Dennis Gaitsgory, [*Local geometric Langlands correspondence and affine Kac–Moody
  algebras*](https://arxiv.org/abs/math/0508382): §0.5, (0.8)–(0.9) (the categories over the stack of
  local systems); §4.1, p. 37 (the isomonodromy groupoid); §5.1, pp. 47–48, and Theorem 5.1.1 (the
  categories of discrete modules, the completed enveloping algebra and its centre); §7.4, Lemma 7.4.1,
  Theorem 7.4.2 and (7.2), pp. 54–55 (outer derivations from the deformation of the level, the
  identification `Ω¹(Z) ≅ isomOp`, the map `Ω¹(Z) → Ext¹(M, M)`); §§20.1–20.2, pp. 120–122 (weak actions
  of an affine group scheme on a category and weakly equivariant objects).
- Niles Johnson and Donald Yau, [*2-Dimensional Categories*](https://arxiv.org/abs/2002.06055), Oxford
  University Press (2021), cited by the numbering and pages of arXiv v3: Definitions 4.1.2, 4.2.1 and
  4.4.1, pp. 103–104, 117–118 and 126–127 (pseudofunctors, strong transformations, modifications);
  Theorem 8.4.1, p. 238 (coherence for bicategories).
- Mathlib's [monoidal action definitions](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/CategoryTheory/Monoidal/Action/Basic.lean),
  [endofunctor comparison](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/CategoryTheory/Monoidal/Action/End.lean),
  [locally discrete bicategories](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/CategoryTheory/Bicategory/LocallyDiscrete.lean)
  and [pseudofunctor and strong-transformation API](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/CategoryTheory/Bicategory/NaturalTransformation/Pseudo.lean).
- The [Zulip discussion of composition order](https://leanprover.zulipchat.com/#narrow/near/523092176)
  for left and right actions, whose design the conventions follow.
- The Mathlib [pull request on pseudofunctor evaluation](https://github.com/leanprover-community/mathlib4/pull/32410),
  which develops `eval` and `evaluation` for pseudofunctors: a design reference only, as the pinned
  Mathlib has neither and §5.1 is built on Tau Ceti's precomposition of pseudofunctors.
