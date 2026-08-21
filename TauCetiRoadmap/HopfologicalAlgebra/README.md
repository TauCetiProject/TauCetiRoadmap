# Hopfological algebra

Hopfological algebra replaces the single square-zero differential of ordinary homological
algebra by an action of a finite-dimensional Hopf algebra.  Its first layer is already useful:
the stable category of modules over a finite-dimensional Hopf algebra is triangulated monoidal.
Its relative layer starts with a left module algebra `A`, forms the smash product `A # H`, and
uses a stronger, `A`-relative null-homotopy relation before localizing at the morphisms which
become invertible in the stable category of `H`-modules.  This roadmap builds those reusable
layers, their compact and Grothendieck-group theories, and the standard differential and
root-of-unity examples.

The constructions here do not select a Hopf algebra for an ADE or E8 problem.  They do not
quotient an affine null root, assert an E8 finiteness or specialness statement, or construct or
categorify a lattice.  Roots of unity and the Jones--Wenzl projector appear only where a cited
published theorem supplies a reusable example of the general theory.

## Dependency boundary

This roadmap extends, rather than replaces, four neighboring roadmaps.

- [Grothendieck groups, Euler forms, and numerical quotients](../GrothendieckEulerForms/README.md)
  supplies exact- and triangulated-category Grothendieck groups, quotient presentations,
  graded `K₀`, and the distinction between `K₀` and `G₀`.  This roadmap instantiates those
  constructions and proves the Hopfological relations; it does not build a second `K₀` engine.
- [DG and A-infinity algebra](../DGAInfinity/README.md) supplies ordinary cohomological DG
  categories, perfect objects, derived localization, and ordinary chain homotopy.  The exterior
  Hopf-superalgebra example below is compared to that implementation.  General hopfological
  homotopy is not defined to be DG homotopy.
- [Frobenius, stable, periodic, and curved homological algebra](../StablePeriodicCurved/README.md)
  supplies Frobenius and self-injective algebras, exact Frobenius categories, stable morphisms
  modulo projective-injectives, triangulated stable categories, and the periodic and curved
  interfaces.  This roadmap proves finite Hopf algebras meet those hypotheses, proves that the
  Hopf tensor product descends to make their stable category tensor-triangulated, and builds a
  new **relative** Frobenius exact structure on smash-product modules.  It consumes the published
  interface of that roadmap without prescribing a private implementation.
- Tau Ceti already supplies Mathlib's `Bialgebra` and `HopfAlgebra` structures together with
  antipode compatibility, the binomial coproduct of a primitive element, bialgebra quotients,
  and Tau Ceti's right-comodule API.  Every milestone below uses those declarations directly.

## Conventions

These choices are part of the specification.

| Item | Convention |
|---|---|
| Base | `k` is a field.  The core hopfological theory assumes `H` is a nonzero finite-dimensional Hopf algebra over `k`. |
| Antipode | `S` is Mathlib's `HopfAlgebra.antipode`.  Its bijectivity is proved from finite-dimensionality.  Any theorem stated beyond the finite-dimensional setting carries bijectivity explicitly. |
| Modules | All unqualified algebra modules and Hopf modules are **left** modules. |
| Module algebra | `A` is a left `H`-module algebra: `h·1 = ε(h)1` and `h·(ab) = Σ(h₁·a)(h₂·b)`. |
| Comodule algebra | Tau Ceti's convention is right coaction `ρ : A → A ⊗ H`.  A right comodule algebra has `ρ(1)=1⊗1` and `ρ(ab)=ρ(a)ρ(b)`. |
| Smash product | `B = A # H` has carrier `A ⊗ H`, unit `1 # 1`, and `(a # h)(b # l) = Σ a(h₁·b) # h₂l`. |
| Tensor action | On left modules, `h·(m⊗n)=Σ(h₁·m)⊗(h₂·n)` and `h·c=ε(h)c` on the monoidal unit. |
| Integral | A left integral is `0 ≠ Λ ∈ H` with `hΛ=ε(h)Λ`.  Left and right integrals and cointegrals are separate notions. |
| Grading | Gradings are by `ℤ`.  An element of degree `i` in `M` has degree `i+r` in `M{r}`.  The class of `{1}` is the Laurent variable.  The triangulated suspension `T` is not the internal shift `{1}`. |
| Differential degree | The structural DG, `p`-DG, and one-generator `N`-complex APIs put `d` in degree `+1`.  Regraded degree-`+2` `p`-DG aliases and theorems are supplied for the Qi--Sussan convention.  Laugwitz--Qi's `d_k` has degree `n/p_k`. |
| Braiding and signs | Ordinary vector-space tensor products have no Koszul sign.  Super and `q`-graded examples use their braided tensor multiplication; the braiding, not an ad hoc rewrite, produces the sign or `q`-factor. |
| Null ideal | In `A # H`-modules, hopfological null maps factor through an object `N ⊗ H`, equivalently through `m ↦ m⊗Λ`.  This is distinct from factoring through an ordinary `A # H`-projective. |
| Stable notation | `H-StMod` is the stable quotient of **all** left `H`-modules and has arbitrary coproducts.  `H-stmod` is its essentially small finite-dimensional full subcategory, used for rigidity and `K₀`. |
| Quasi-isomorphism | A morphism in the relative homotopy category is a quasi-isomorphism when restriction to `H` is an isomorphism in the large ordinary stable category `H-StMod`. |

Sweedler notation in prose always denotes a finite representation of Mathlib's
`Coalgebra.comul`; Lean statements use `Coalgebra.Repr` or equality of tensor-product maps and
do not assume a chosen basis.

## Existing API inventory

- `TauCeti.Algebra.Bialgebra.Primitive` proves the binomial formula for
  `Δ(a^n)` when `a` is primitive.  This is the required input for the characteristic and sign
  tests below.
- `TauCeti.Algebra.Bialgebra.Quotient` constructs quotient bialgebras and their lift.
- `TauCeti.Algebra.HopfAlgebra.Basic` and `.Antipode` provide preservation of antipodes and
  anti-comultiplicativity.
- `TauCeti.Algebra.Coalgebra.Comodule.Basic` provides right comodules and morphisms.  The
  finite-comodule development already supplies monoidal and rigid categories where its
  hypotheses apply.
- Neither Mathlib nor Tau Ceti contains integrals of Hopf algebras, the finite-Hopf-to-Frobenius
  theorem, Hopf module algebras, smash products, the stable category of Hopf modules, or the
  relative hopfological category.  Those are real targets here.

There is no competing implementation or settled spelling for Hopf-module monoidality, stable
categories of Hopf modules, or smash products.  New upstream Mathlib work is adopted if it lands,
following Mathlib's naming and deleting the corresponding Tau Ceti duplicate.

## Layer 1: finite Hopf algebras are Frobenius

Build a usable theory of integrals before using the word Frobenius.

1. Define submodules of left and right integrals in `H`:
   `hΛ=ε(h)Λ` and `Λh=ε(h)Λ`.  Define left and right cointegrals as the corresponding
   invariance equations in `H*`.  Prove closure, functoriality under Hopf equivalences, behavior
   under the antipode, and the left/right conversions when the antipode is bijective.
2. For nonzero finite-dimensional `H`, prove that each integral space is one-dimensional and
   contains a nonzero element.  State precisely which result chooses a left integral in `H` and
   which chooses a right cointegral in `H*`; do not conflate the two one-dimensional spaces.
3. Prove the Larson--Sweedler Frobenius theorem in a form consumed by the Frobenius roadmap:
   a nonzero right cointegral `λ : H → k` makes `(x,y) ↦ λ(xy)` nondegenerate, equivalently
   `x ↦ (y ↦ λ(xy))` is a linear equivalence `H ≃ₗ[k] H*`.  Construct Frobenius dual bases and
   pin the handed Nakayama convention.  For a chosen nonzero left integral `Λ`, define the
   modular character `α : H → k` by `Λh=α(h)Λ`.  Define `ν` by
   `λ(xy)=λ(ν(y)x)`.  With this convention prove

   `ν(h)=Σ α(h₁)S²(h₂)
         = a⁻¹(Σ α(h₂)S⁻²(h₁))a`,

   where `a` is the distinguished group-like element of `H`; changing the cointegral or
   defining-equation convention must change the displayed winding formula explicitly.  The
   stable/Frobenius dependency uses the convention
   `λ(ab)=λ(bν_S(a))`.  Nondegeneracy of `(x,y)↦λ(xy)` gives uniqueness and the required
   orientation bridge `ν_H=ν_S⁻¹`; pass `ν_S=ν_H⁻¹`, not `ν_H`, to that interface.  Prove
   the exact published criterion: a finite-dimensional Hopf algebra is symmetric **if and only
   if** it is unimodular and `S²` is inner.  Symmetry is never inferred from finite
   dimensionality alone.
4. Prove that the antipode of a finite-dimensional Hopf algebra over a field is bijective.  Use
   this theorem, rather than adding bijectivity redundantly to every finite-Hopf result.
5. Instantiate the Frobenius/self-injective interface from `StablePeriodicCurved`.  Prove for
   arbitrary left `H`-modules, not just finite-dimensional ones, that projective and injective
   objects coincide.  Separate the finite-dimensional essentially small subcategory used for
   `K₀` from the large module category used for coproducts and compact generation.

The main algebraic source for this layer is Larson--Sweedler.  Khovanov and Qi may be used for
the consequences for module categories, but not as a substitute for the Frobenius proof.

## Layer 2: Hopf modules and their stable monoidal category

Construct left `H`-modules and their monoidal API over the existing bialgebra structure.

- Define the diagonal action on `M ⊗ N`, prove it is independent of a chosen coproduct
  representation, and construct associator and unit compatibility.  This layer needs only a
  bialgebra.
- For a Hopf algebra with bijective antipode, define dual actions on finite-dimensional modules
  and prove rigidity.  Pin the action on the linear dual and relate left and right duals to `S`
  and `S⁻¹`.
- Prove `M ⊗ P`, `Hom_k(M,P)`, and `Hom_k(P,M)` are projective when `P` is projective, with
  the correct antipode action on internal Hom.  These results make the ideal of morphisms
  through `H`-projectives a tensor ideal.
- Form the large category `H-StMod` from all modules using the ordinary Frobenius
  stable-category interface, and define `H-stmod` as its essentially small full subcategory on
  finite-dimensional modules.  The suspension on either category can be modeled, after choosing
  `Λ`, by
  `T(M)=M⊗(H/kΛ)` and its inverse by `M⊗ker ε`; prove independence up to natural isomorphism.
  In the graded case, shift the homogeneous integral so that `m ↦ m⊗Λ` has degree zero.
- Prove `H-StMod` is triangulated monoidal, has the coproducts required later, and tensoring in
  either variable is exact.  Prove its finite-dimensional subcategory `H-stmod` is closed under
  tensor, suspension, and duals.  Both are symmetric monoidal when `H` is cocommutative.  For a
  general `H` they are only monoidal; a braiding requires a quasitriangular or braided-Hopf
  hypothesis and is never inferred from finite-dimensionality.

This is the **ordinary stable quotient**: a morphism is zero exactly when it factors through an
`H`-projective.  Later ideals are compared to it, not identified with it by notation.

## Layer 3: module algebras, comodule algebras, and smash products

### Left module algebras

Define a left `H`-module algebra using an action linear in `H` and `A`, the module laws, and the
two displayed unit and product equations from the convention table.  Supply:

- equivariant algebra morphisms, restriction along bialgebra morphisms, invariant subalgebras,
  opposite and tensor constructions with exactly the cocommutativity or braiding hypotheses they
  need;
- the equivalence between left modules over `B=A#H` and left `A`-modules `M` with a left
  `H`-action satisfying
  `h·(am)=Σ(h₁·a)(h₂·m)`;
- the smash-product algebra on `A ⊗ H`, associativity and unit from the literal formula
  `(a#h)(b#l)=Σa(h₁·b)#h₂l`, and the canonical embeddings of `A` and `H`;
- functoriality of `A#H` in equivariant algebra maps and Hopf maps, together with the expected
  universal property.  The implementation reuses the existing quotient-bialgebra API when an
  example is presented by generators and relations.

The prototype therefore bundles an actual `k`-algebra `B`, a linear equivalence
`B ≃ₗ[k] A⊗H`, pure-tensor multiplication and unit theorems, the two algebra embeddings, a
pure-tensor spanning theorem, and the covariance universal property.  A type synonym for
`A⊗H` which ignores the action is not a smash product.

### Right comodule algebras

Extend Tau Ceti's right `Comodule k C A` with the equations making the coaction an algebra
map.  First instantiate the tensor-product algebra structure on `A ⊗ H` from the existing
algebra structures, so the literal equation `ρ(ab)=ρ(a)ρ(b)` has its intended multiplication;
do not hide this behind an unverified equality signature.  Build comodule-algebra morphisms and
prove that the smash product has the right
`H`-coaction

`ρ(a#h) = Σ(a#h₁) ⊗ h₂`.

Khovanov's original paper often starts with a left comodule algebra and also writes an example
using a right module algebra.  Those are translated into the primary convention explicitly;
there is no second overload of `smashProduct` with silently reversed sides.

### Finite-dual bridge

For finite-dimensional `H`, construct the Hopf structure on `H*` and prove that a left
`H`-module algebra structure on `A` is equivalent to a right `H*`-comodule algebra structure.
For a finite basis `(e_i)` with dual basis `(e_i*)`, expose the formula

`ρ(a)=Σ(e_i·a)⊗e_i*`

and prove it is basis-independent.  State the inverse by evaluation.  Generalize over a
commutative base ring only under the finite-projective and required flatness hypotheses; do not
replace finite projectivity by finite generation.  Relate the module-algebra smash product to the
finite-dual comodule construction and record all op/cop and left/right translations.

## Layer 4: the relative hopfological category

Fix `B=A#H`.  Give `B-Mod` the exact structure whose conflations are the short exact sequences
which split after restriction to `A`.  Prove, using finite-dimensionality of `H`, bijectivity of
its antipode, and the Frobenius result, that this is a Frobenius exact category.  Identify its
projective-injective objects as retracts of the appropriate induced/coinduced objects and reconcile
that description with the objects `N⊗H` carrying diagonal `B`-action.

Choose a nonzero left integral `Λ`.  For a `B`-module `M`, construct the `B`-linear map

`λ_M : M → M⊗H,   m ↦ m⊗Λ`.

A `B`-linear morphism `f : M → N` is **hopfologically null-homotopic** when either of the
following equivalent conditions holds:

1. `f` factors through `X⊗H` for some `B`-module `X`;
2. `f` factors through `λ_M`;
3. under the invariant description of `B`-linear maps, `f=Λ·g` for an `A`-linear map `g`.

For the third condition, construct Qi's `H`-action on `Hom_A(M,N)`:

`(h·g)(m)=Σ h₂·g(S⁻¹(h₁)·m)`.

Prove `Hom_B(M,N)=Hom_A(M,N)^H` and identify the hopfological morphism space with

`Hom_A(M,N)^H / (Λ·Hom_A(M,N))`.

The quotient category is `C(A,H)`, the stable category of the `A`-split relative Frobenius
structure.  Construct its triangles, suspension and inverse suspension, and its right action by
`H-StMod`; tensoring a hopfological module on the right by an arbitrary `H`-module is exact.
At signature level, objects and conflation arrows are genuine `B`-modules and `B`-linear maps;
only the chosen retraction/section is `A`-linear.  Likewise the Hom action is constructed on
literal `Hom_A`, its invariants are identified with literal `Hom_B`, and the property-(P)
filtration below consists of `B`-submodules with `B`-linear cell-layer identifications.

The following comparison is mandatory.

- The ordinary stable category of the algebra `B` kills maps through **`B`-projectives**.
- `C(A,H)` kills maps through the generally larger class `X⊗H` of relative
  projective-injectives.  Every ordinary `B`-projective gives a relative projective, but equality
  is not asserted.  When `A=k`, the relative quotient on all modules recovers `H-StMod`; its
  finite-dimensional full subcategory recovers `H-stmod`.
- Ordinary chain homotopy is the formula `f=dh+hd` in the exterior Hopf-superalgebra example.
  The integral ideal above specializes to it only after the super grading and signs are installed.
- A Verdier quotient localizes a triangulated category at a thick subcategory.  It is introduced
  in the next layer and is not the additive ideal quotient used to define `C(A,H)`.

## Layer 5: derived localization, property (P), and compact objects

Restriction along `H ↪ A#H` gives an exact functor `C(A,H) → H-StMod`.  Define a morphism
to be a quasi-isomorphism when its restriction is invertible.  Prove that these morphisms form a
localizing class and that the following constructions agree:

`D(A,H) = C(A,H)[quasi-isomorphisms⁻¹]
         ≃ C(A,H) / (H-acyclic objects)`.

Here `M` is `H`-acyclic exactly when its restriction is zero in `H-StMod`, equivalently is
projective as an `H`-module.  The second expression is a Verdier quotient by the thick
subcategory of acyclics.  Build cones and prove the localization is triangulated and remains a
right triangulated module category over `H-StMod`.

### Cofibrant and property-(P) modules

A `B`-module `P` is cofibrant when every `B`-map from `P` to the target of a surjective
quasi-isomorphism lifts to its source.  Equivalently, the induced map on the invariant spaces
`Hom_A(P,-)^H` is surjective.  Prove Qi's characterization: `P` is projective as an `A`-module
and `Hom_A(P,K)` is `H`-projective for every acyclic `K`.

Call a module **cellular property-(P)** when it has an exhaustive filtration

`0 ⊂ F₀ ⊂ F₁ ⊂ ⋯ ⊂ P`

such that every inclusion is split as an `A`-module map and `F₀` and each
`F_{r+1}/F_r` are direct sums of modules `A⊗V`, with `V` an indecomposable `H`-module.
Equivalently, arbitrary `H`-modules may be used as the cells.  Following Qi's actual
definition, a module satisfies property (P) when it is isomorphic in `C(A,H)` to a cellular
property-(P) module.  Keep that homotopy-invariant condition separate from the data of a chosen
filtration.  Every filtration stage is a `B`-submodule, every inclusion is `B`-linear, and its
chosen splitting is only `A`-linear.  Each displayed layer is identified by a `B`-linear
isomorphism with `A⊗V` carrying
`(a#h)(b⊗v)=Σa(h₁·b)⊗h₂·v`; merely identifying underlying `A`-modules is insufficient.  Prove:

- property (P) implies cofibrant;
- every module has a functorial surjective quasi-isomorphism from a property-(P) bar
  replacement;
- the cofibrant objects are exactly the `B`-module direct summands of property-(P) objects;
- morphisms out of a cofibrant/property-(P) object agree in `C(A,H)` and `D(A,H)`;
- the homotopy categories of property-(P) and cofibrant objects are each equivalent to
  `D(A,H)`.

Do not rename every cofibrant object “property P”: the idempotent-completion distinction is a
theorem and is visible in the API.

### Compact generation and finiteness

Define compactness by preservation of the actual categorical coproducts by the preadditive
representable `Hom(P,-) : D(A,H) → AddCommGrp`; equivalently, require preservation of every
small discrete colimit, whose comparison is canonically induced by the coproduct injections.
Do not store an arbitrary object-valued “coproduct” function or comparison bijection.  Prove `D(A,H)`
is compactly generated by the finite set `{A⊗V}`, where `V` ranges over representatives of the
simple finite-dimensional `H`-modules.  Then prove the Ravenel--Neeman description used by Qi:
the compact subcategory `Dᶜ(A,H)` is the thick idempotent closure of these generators, and every
compact object is a direct summand of a finite extension of shifts `T^n(A⊗V)`.

The following finiteness words have fixed, noninterchangeable meanings.

- Prove Qi's finite-Hopf smash-product result that `A` is left Noetherian if and only if `A#H`
  is left Noetherian.  For the nontrivial direction, use finite freeness on the correct `A`-side
  (the antipode gives the right-sided normal form), faithful flatness, and descent of finite
  generation; finite freeness only on the evident left side is not a proof.  Under these
  equivalent hypotheses, `Dᵇ(A,H)` is the strictly full subcategory of objects isomorphic to
  a finitely generated `A`-module.
- `Dᶠ(A,H)` consists of objects isomorphic to a finite-length `A`-module.  It is contained in
  `Dᵇ`; if `A` is finite-dimensional over `k`, they coincide.
- If `A` is Artinian, a compact object is isomorphic in the derived category to a finite
  projective `A`-module.
- Qi's “smooth basic” comparison assumes `A` is Artinian (or graded finite-dimensional), basic
  in its Morita class, smooth in the precise sense that `A` has a finite projective resolution as
  an `(A,A)`-bimodule, and has **trivial `H`-action**.  Under those hypotheses
  `Dᶜ(A,H) ≃ Dᶠ(A,H)`.
- In the specialized `p`-DG terminology of Qi--Sussan, property (P) has filtration quotients
  which are sums of `p`-DG direct summands of `A`; a finite-cell module has property (P) and is
  finitely generated as an `A`-module.  This is not a synonym for compactness in an arbitrary
  hopfological category.

Implement the exact published Qi--Sussan finiteness test as a scoped worked theorem.  For their
specific `p`-DG algebras `A=A_n^!` and `C=C_n` over a field of characteristic prime `p`, the
categorified Jones--Wenzl functor `P` is represented by a finite-cell `(A,A)`-bimodule **if and
only if `p` divides `n-1`**.  Outside that divisibility condition their Theorem 5.5 says this
specific projector has no finite-cell representative.  It says neither that arbitrary
hopfological objects are infinite nor that a particular root system has a finiteness property.

## Layer 6: Grothendieck groups and rings

Use the Grothendieck/Euler roadmap's construction throughout.

1. For the essentially small stable category of finite-dimensional (graded) `H`-modules,
   construct `K₀(H-stmod)`.  Tensor product makes it a ring, possibly noncommutative.  It is
   commutative when the stable category is symmetric, in particular when `H` is cocommutative.
   Prove the quotient from the ordinary representation ring by the classes of projectives.
2. Define the hopfological Grothendieck group to be `K₀(Dᶜ(A,H))`, not the group of the entire
   large derived category.  Prove it is a right module over `K₀(H-stmod)`.
3. Define `G₀(A,H)` from `Dᵇ(A,H)` and `G₀ᶠ(A,H)` from `Dᶠ(A,H)` under the Noetherian
   hypotheses above.  Construct Qi's derived pairing
   `Dᶜ(A,H) × Dᶠ(A,H) → Dᶠ(k,H)` there, and its sesquilinear Grothendieck-group
   specialization under the Artinian hypotheses used in his smooth-basic section.
4. If an internal tensor product of compact hopfological `A`-modules is constructed, state all
   hypotheses making the diagonal action descend through the `A`-balanced tensor product.
   Under those hypotheses prove that `K₀(A,H)` is a ring.  Commutativity requires a symmetric
   or adequately braided structure; commutativity of `A` alone does not make `H` cocommutative.
5. For a smooth basic `A` with trivial `H`-action, prove Qi's comparison
   `K₀(A,H) ≅ K₀(A) ⊗_ℤ K₀(H-stmod)`, and its graded tensor product over
   `ℤ[q,q⁻¹]`.  Preserve every hypothesis from Layer 5.

The examples below must prove their displayed relation as a theorem about these general
constructions, not install the desired quotient ring as a definition.

## Layer 7: differential, super, Nichols, Sweedler, and Taft examples

### Why ordinary dual numbers fail in characteristic zero

Suppose an ordinary bialgebra over `k` contains a primitive `d` with `d²=0`.  Tau Ceti's
primitive binomial theorem gives

`Δ(d²)=d²⊗1 + 2(d⊗d) + 1⊗d²`.

Since `Δ(0)=0`, square-zero forces `2(d⊗d)=0`.  Over a field with `char k ≠ 2`, a nonzero
`d` has nonzero pure tensor `d⊗d`, so this is impossible.  In particular the quotient
`k[d]/(d²)` cannot carry an **ordinary** characteristic-zero Hopf structure with the class of
`d` nonzero and primitive.  `Suggested.lean` includes the binomial signature, a proof that a
nonzero self-tensor over a field is nonzero, and the resulting contradiction.  The roadmap must
also construct the failed quotient attempt through Tau Ceti's bialgebra-quotient criterion and
show exactly where preservation of `(d²)` fails.

There are two correct sign repairs.

- In super vector spaces, take the exterior Hopf superalgebra `E(d)` with `d` odd,
  `d²=0`, `Δd=d⊗1+1⊗d`, `εd=0`, and `Sd=-d`.  The super tensor multiplication
  `(x⊗y)(x'⊗y')=(-1)^{|y||x'|}xx'⊗yy'` makes the two middle terms cancel.  A left
  module-superalgebra is an ordinary DG algebra with
  `d(ab)=d(a)b+(-1)^|a| a d(b)` for `a` in an actual component of its internal grading;
  homogeneity is not an independent predicate.
- Bosonize parity to Sweedler's ordinary four-dimensional Hopf algebra `H₄`: for
  `char k ≠ 2`, use generators `g,d` with
  `g²=1`, `d²=0`, `gd=-dg`,
  `Δg=g⊗g`, `Δd=d⊗1+g⊗d`,
  `εg=1`, `εd=0`, `Sg=g`, and `Sd=-gd`.
  Then
  `Δ(d)²=d²⊗1+(dg+gd)⊗d+g²⊗d²=0`.
  On a module algebra with internal decomposition `A=⊕_r A_r`, prove
  `g·a=(-1)^r a` for `a∈A_r` and `d·A_r⊆A_{r+1}`; then `d` obeys the signed Leibniz rule.
  Thus `g` is tied to the actual grading rather than merely called a parity operator.  `H₄`
  records parity, while the compatible `ℤ`-grading records the full DG degree.

Prove that the hopfological null ideal in these super/bosonized models recovers the ordinary
chain-homotopy formula with its signs.  This is a comparison theorem to the DG roadmap, not a
new definition of chain homotopy.

### Characteristic-`p` truncated primitives and `p`-DG algebras

Let `p` be prime and `k` have characteristic `p`.  Construct

`H_p=k[d]/(d^p),  Δd=d⊗1+1⊗d,  εd=0,  Sd=-d`.

The intermediate binomial coefficients vanish in characteristic `p`, so `(d^p)` is a Hopf
ideal.  Give the generator degree `+1` (and the explicit degree-`+2` regrading).  Module
algebras are `p`-DG algebras with `d^p=0` and unsigned Leibniz rule
`d(ab)=d(a)b+a d(b)`.  For `p`-complexes, prove that a degree-zero map is null exactly when

`f = Σ_{i=0}^{p-1} d_N^i h d_M^{p-1-i}`

for a map `h` of the required degree.  Construct the slash-homology groups of a finite-dimensional
graded `p`-complex using the exact Khovanov--Qi formula

`H^{/k}(M)=ker(d^{k+1})/(im(d^{p-k-1})+ker(d^k)),   0≤k≤p-2`.

Prove homotopy invariance and, for finite-dimensional `M`, the detection theorem that all slash
groups vanish **if and only if** `M` is projective (equivalently free) over `H_p`.  If `d` has
degree `+1`, the homotopy `h` in the displayed `p`-null formula has degree `1-p`; in the
Qi--Sussan degree-`+2` regrading it has degree `2-2p`.  Identify the resulting
quasi-isomorphism test with restriction to `H_p-stmod`.  Attribute slash homology and its
detection theorem to Khovanov--Qi (2015), as recalled for example by Qi--Sussan (2022), not to
the 2017 hopfological-finiteness paper.

For finite-dimensional graded modules, prove

`K₀(H_p-stmod) ≅ ℤ[q,q⁻¹]/(1+q+⋯+q^{p-1})
                  = ℤ[q,q⁻¹]/(Φ_p(q))`.

The equality with one cyclotomic polynomial uses that `p` is prime.  Do not state the same
identity for composite `N`.

### One-dimensional Nichols algebras and Taft algebras

First build the reusable ambient theory for `G`-graded vector spaces with braiding on homogeneous
tensors determined by a multiplicative bicharacter `χ : G×G → kˣ`.  It must cover
`G=ℤ` and `χ(i,j)=q^{ij}`, which is the ambient used by Laugwitz--Qi.  The super category is the
specialization `G=ℤ/2`, `χ(i,j)=(-1)^{ij}`.  Model the grading as the canonical internal
decomposition into subspaces, require `1∈A_0` and `A_gA_h⊆A_{g+h}`, require the coproduct to
land in the sum of bidegrees `(r,s)` with `r+s=g`, and require the counit to vanish off degree
zero and the antipode to preserve degree.  Graded module actions must send
`H_g·M_h` into `M_{g+h}`.  In that general ambient construct
algebra/coalgebra/bialgebra/Hopf-algebra objects, braided primitives and Hopf ideals,
Yetter--Drinfeld modules, Nichols algebras in the finite diagonal cases used here, and the
Radford--Majid bosonization.  Prove the monoidal equivalence between modules internal to the
braided category and the appropriate rational modules over the bosonization.  The exterior and
Laugwitz--Qi algebras instantiate this API; they are not isolated structures with copied Hopf
axioms.

Let `q` be a primitive `N`th root in a field whose characteristic does not divide `N`.  In the
braided category of `q`-graded vector spaces, construct the one-dimensional Nichols algebra
`B(V)=k[d]/(d^N)` with braided-primitive `d`.  Prove the `q`-binomial coproduct and show the
intermediate Gaussian coefficients vanish at the primitive root.  At `q=-1`, this is the exterior
superalgebra.

Its cyclic bosonization is the Taft Hopf algebra in the pinned convention:

`K^N=1,  d^N=0,  Kd=q dK`,

`ΔK=K⊗K,  Δd=d⊗1+K⊗d`,

`εK=1,  εd=0,  SK=K⁻¹,  Sd=-K⁻¹d`.

Prove all Hopf equations, finite dimension `N²`, the integral and Frobenius data, and the
module-algebra skew Leibniz equation

`d(ab)=d(a)b+(K·a)d(b)`.

Sweedler `H₄` is the `N=2`, `q=-1` case.  A rational graded Taft module has
`K·m=q^|m|m`; under that restriction the skew Leibniz equation is the usual `q`-Leibniz rule.

For every named example, separate **construction** from **recognition**.  Construct the algebra
as the stated free-algebra/polynomial quotient, descend coproduct, counit, and antipode through
the relation ideal, and prove the standard monomials form a basis.  The recognition records in
`Suggested.lean` deliberately demand bases `d^i`, `g^i d^j`, `K^i d^j`, or the corresponding
multi-monomials; hence `H=k`, `K=1`, `d=0` cannot inhabit them as fake Sweedler, Taft, or
Laugwitz--Qi data.  Recognition data do not replace the quotient constructors.

For Khovanov's graded Taft stable category, prove the relation

`K₀ ≅ ℤ[q,q⁻¹]/(1+q+⋯+q^{N-1})`.

When `N` is composite, `1+q+⋯+q^{N-1}` is not `Φ_N(q)`.  Thus a Taft stable category alone
does not categorify the full ring of `N`th cyclotomic integers.

## Layer 8: the Laugwitz--Qi characteristic-zero cyclotomic construction

Implement the published construction for every integer `n≥2`, including characteristic zero,
with its assumptions visible in every top-level theorem.

Write

`n=∏_{k=1}^t p_k^{a_k}`, `m=∏p_k`, `N=n²/m`,
`n_k=n/p_k`, and `m_k=m/p_k`.

The factorization object records `n≥2`, `t>0`, primality and pairwise distinctness of the
`p_k`, positivity of every `a_k`, and the complete equality `n=∏p_k^{a_k}`.  Thus the prime
list cannot omit a divisor.  The values `m`, `N`, `n_k`, and `m_k` are definitions derived from
that object, never unrelated parameters.

Let `k` contain a primitive `N`th root `q`; this implies `char k ∤ N`.  Put
`ξ=q^(n/m)`, a primitive `n`th root, and `ξ_k=ξ^{m_k}=q^{n_k}`.  Record the order of `ξ_k`
correctly: `gcd(N,n_k)=n_k`, so

```text
ord(ξ_k) = N/n_k = p_k·(n/m),
```

which is `p_k` exactly when `n` is squarefree.  For `n=4` and `p₁=2`, for instance, `ξ₁=q²` has
order `4`, not `2`.  What is a primitive `p_k`th root is the **self-braiding** parameter of the
generator, `ξ_k^{n_k}=q^{n_k²}`, whose order is `p_k` for every `n`; that is the number which
makes the one-generator Nichols algebra truncate at `d_k^{p_k}`, and no theorem may assert
primitivity of order `p_k` for `ξ_k` itself.  In `q`-graded vector spaces define

`H_n=k[d₁,…,d_t]/(d₁^{p₁},…,d_t^{p_t}),   deg d_k=n_k`,

with commuting generators, braided-primitive coproduct, zero counit, and `S(d_k)=-d_k`.
Prove the braided Hopf equations, the Nichols-algebra description, Frobenius trace on the top
monomial, and integral `Λ=∏d_k^{p_k-1}`.

Although each generator is braided primitive, do not infer braided cocommutativity: for the
Laugwitz--Qi braiding, the square of the braiding on `H_n ⊗ H_n` is generally nontrivial.

Construct the ordinary Radford--Majid bosonization by `C_N`, with generator `K` and the exact
relations

`K^N=1`, `Kd_k=ξ_k d_kK`, `d_k^{p_k}=0`, `[d_k,d_l]=0`,

`ΔK=K⊗K`, `Δd_k=d_k⊗1+K^{n_k}⊗d_k`,

`SK=K⁻¹`, `Sd_k=-K^{-n_k}d_k`, `εK=1`, `εd_k=0`.

The bosonization constructor consumes the factorization and root objects above, so its type uses
the derived `N`, `n_k`, `m_k`, `ξ`, and `ξ_k`; it cannot accept inconsistent copies of those
numbers.  Prove that the ordered monomials
`K^j d_1^{e_1}⋯d_t^{e_t}` (`0≤j<N`, `0≤e_k<p_k`) form a basis, hence its dimension is
`N·m` and the braided algebra `H_n` has dimension `m`.

Prove that rational graded modules, on which `K` acts in degree `i` by `q^i`, recover modules
over the braided `H_n`, monoidally.  Do not claim the whole bosonization module category is the
same graded category.

The stable category first has

`K₀(H_n-gmod) ≅ ℤ[ν,ν⁻¹] /
  ( ∏_{k=1}^t ([n]_ν/[n_k]_ν) )`,

where `[r]_ν=1+ν+⋯+ν^{r-1}`.  Implement Laugwitz--Qi Definition 4.5 literally.  Let
`H_{n_k}=k[d_k]/(d_k^{p_k}) ⊂ H_n`, with `k` its trivial module.  When `t>1`, put

`W_k = H_n ⊗_{H_{n_k}} k`.

The API constructs each `H_{n_k}` as the injectively embedded subalgebra generated by the
concrete `d_k` in the fixed `CyclotomicBraidedDatum`, with its truncated-monomial basis and
augmentation.  It defines `W_k` by the balanced-tensor universal property (or exposes a graded
`H_n`-linear equivalence to that literal carrier); neither `H_n`, the inclusions, nor `W_k` is an
independent family parameter.

Then `I_k` is the full subcategory of direct summands of modules having a **finite** filtration
by graded `H_n`-submodules whose successive quotients are genuine internal grading shifts
`W_k{r}`, identified by degree-zero `H_n`-linear maps.  When
`t=1`, Definition 4.5 instead takes `I_1` to be the projective-injective objects.  Definition
4.12's `I` consists of objects isomorphic to finite direct sums
`U_1⊕⋯⊕U_t` with `U_k∈I_k`; it is not the union of the `I_k`.  Prove Proposition 4.16 in the
needed handed form: if `k≠l`, every degree-zero graded `H_n`-map from an object of `I_k` to an
object of `I_l` factors through a graded projective and is null-homotopic.  First prove the
cross-freeness statement for shifts of the concrete induced cells from the standard
multi-monomial basis and the distinct prime factors, then deduce the filtered/retract case by
devissage.  No such theorem is asserted for arbitrary algebras or arbitrary cell families.
This cross-`I_k` vanishing is an explicit input to the proof that the
image of `I` in the stable category is thick.  Prove in addition that it is a triangulated tensor
ideal, and form the **Verdier quotient**

`O_n = (H_n-gmod)/I`.

Finally prove their Theorem 5.15:

`K₀(O_n) ≅ ℤ[ν,ν⁻¹]/(Φ_n(ν))`.

This quotient is a third categorical operation: it follows the ordinary stable quotient and is
not the relative hopfological ideal in `A#H`-modules.  For `n=p^a`, explain and prove the
specialization to `p`-complexes with differential degree `p^{a-1}`.  In characteristic zero it is
a braided/root-of-unity lift, never an ordinary primitive truncated-polynomial Hopf algebra.

The tensor-triangulated category `O_n` and its Grothendieck ring are reusable input for
root-of-unity and quantum-topological constructions.  This roadmap stops there: it does not
build a Jones invariant, choose an ADE object, or infer a lattice categorification.

## Implementation order and completion criteria

The layers are implemented in order, with reusable files rather than one theorem per source.

1. Integrals, cointegrals, antipode bijectivity, Frobenius duality, and the bridge to the ordinary
   stable interface.
2. Monoidal Hopf modules, duals, internal Hom, tensor-triangulated `H-StMod`, and its
   finite-dimensional subcategory `H-stmod`.
3. Left module algebras, right comodule algebras, finite duals, and smash products.
4. The `A`-split relative Frobenius category, integral null ideal, and `C(A,H)`.
5. Quasi-isomorphisms, the Verdier derived category, property (P), cofibrant replacements,
   compact generation, and finiteness subcategories.
6. Stable and compact-derived `K₀`, module/ring structures, and smooth-basic comparisons.
7. Super/exterior, characteristic-`p`, Sweedler, Nichols, and Taft examples, including the
   characteristic-zero obstruction.
8. Laugwitz--Qi's multi-differential bosonization, tensor ideal, and cyclotomic Verdier quotient;
   the scoped Qi--Sussan finite-cell theorem.

A layer is not complete when only the displayed headline theorem exists.  Definitions require
the normal morphism, functoriality, equivalence, grading-shift, op/cop, and simp/ext APIs needed
by the next layer.  Every quotient comes with its universal property and comparison functor;
every equivalence identifies the underlying carrier/action maps; and every finiteness theorem
states field characteristic, Hopf dimension, antipode, Noetherian/Artinian, flatness,
finite-projective, property-(P), and compactness assumptions at the point where they are used.

## Source-to-layer map

| Source | Roadmap layers | Exact imported content and restrictions |
|---|---|---|
| Larson--Sweedler; Pareigis; Fischman--Montgomery--Schneider | 1 | Finite-dimensional Hopf algebras over a field are Frobenius via integrals/cointegrals; the handed winding/Nakayama formulas and the exact symmetric criterion.  Symmetry is not automatic. |
| Khovanov | 2, 4, 6, 7 | Tensor-triangulated stable Hopf-module categories, the comodule/module-algebra hopfological quotient, prime-characteristic truncated primitives, and Taft stable `K₀`.  His prime cyclotomic equality is not extended to composite order. |
| Khovanov--Qi; Qi--Sussan (2022) | 7 | Slash homology `H^{/k}`, homotopy invariance, and finite-dimensional projectivity detection for `p`-complexes. |
| Qi | 2--6 | The left-module-algebra and smash convention, relative null ideal, triangles, quasi-isomorphisms, derived localization, property (P), cofibrant replacement, compact generators, and the Noetherian/Artinian/smooth-basic results with their stated hypotheses. |
| Qi--Sussan (2017) | 5, 7 | `p`-DG conventions, finite-cell modules, and the scoped Jones--Wenzl finite-cell theorem in characteristic prime `p`: exactly `p ∣ n-1`. |
| Radford and Majid | 7, 8 | Biproduct/bosonization and the passage from braided Hopf algebras to ordinary Hopf algebras. |
| Laugwitz--Qi | 8 | The exact factorization data, braided multi-differential Hopf algebra, `C_N` bosonization, stable relation, thick tensor ideal, Verdier quotient, and `K₀(O_n)=ℤ[ν,ν⁻¹]/(Φ_n)`, over any field containing the specified primitive `N`th root. |
| Kapranov | 7, 8 | The characteristic-zero `q`-homological/`N`-complex motivation.  The implemented Hopf objects follow the braided/Taft hypotheses above. |

## References

- M. Khovanov, [*Hopfological algebra and categorification at a root of unity: the first
  steps*](https://doi.org/10.1142/S021821651640006X), J. Knot Theory Ramifications 25
  (2016), no. 3, 1640006, 26 pp. (preprint first circulated in 2005/06).
- Y. Qi, [*Hopfological algebra*](https://doi.org/10.1112/S0010437X13007380), Compos. Math. 150
  (2014), 1--45.
- Y. Qi and J. Sussan, [*Categorification at prime roots of unity and hopfological
  finiteness*](https://doi.org/10.1090/conm/683/13721), Contemp. Math. 683 (2017), 261--286.
- M. Khovanov and Y. Qi, [*An approach to categorification of some small quantum
  groups*](https://doi.org/10.4171/QT/63), Quantum Topol. 6 (2015), 185--311.
- Y. Qi and J. Sussan, [*On some p-differential graded link
  homologies*](https://doi.org/10.1017/fmp.2022.19), Forum Math. Pi 10 (2022), e26.
- R. Laugwitz and Y. Qi, [*A categorification of cyclotomic
  rings*](https://arxiv.org/abs/1804.01478), Quantum Topol. 13 (2022), 539--577,
  [doi:10.4171/QT/172](https://doi.org/10.4171/QT/172).
- R. G. Larson and M. E. Sweedler, [*An associative orthogonal bilinear form for Hopf
  algebras*](https://doi.org/10.2307/2373270), Amer. J. Math. 91 (1969), 75--94.
- B. Pareigis, [*When Hopf algebras are Frobenius
  algebras*](https://doi.org/10.1016/0021-8693(71)90141-4), J. Algebra 18 (1971),
  588--596.
- S. Montgomery, [*Hopf Algebras and Their Actions on Rings*](https://bookstore.ams.org/cbms-82),
  CBMS 82, AMS, 1993.
- D. Fischman, S. Montgomery, and H.-J. Schneider, [*Frobenius extensions of subalgebras
  of Hopf algebras*](https://doi.org/10.1090/S0002-9947-97-01814-X), Trans. Amer. Math.
  Soc. 349 (1997), 4857--4895.
- K. Erdmann, Ø. Solberg, and X. Wang, [*On the structure and cohomology ring of connected
  Hopf algebras*](https://doi.org/10.1016/j.jalgebra.2019.02.030), J. Algebra 527 (2019),
  366--398, Theorem 2.2 (published restatement of the Nakayama and symmetric criteria).
- D. E. Radford, [*The structure of Hopf algebras with a
  projection*](https://doi.org/10.1016/0021-8693(85)90124-3), J. Algebra 92 (1985), 322--347.
- S. Majid, [*Comments on bosonisation and
  biproducts*](https://arxiv.org/abs/q-alg/9512028), 1995; and *Foundations of Quantum Group
  Theory*, Cambridge University Press, 1995.
- M. Kapranov, [*On the q-analog of homological
  algebra*](https://arxiv.org/abs/q-alg/9611005), 1996.
