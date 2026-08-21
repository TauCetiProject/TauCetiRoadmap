# Roadmap: stable, periodic, and curved homological algebra

Stable categories turn exact algebra into triangulated algebra by killing the
projective-injective objects. Periodic complexes repeat a finite amount of differential data.
Curved complexes replace `d² = 0` by a controlled equation `d² = w`. These constructions meet at
Frobenius algebras, hypersurface singularities, and matrix factorizations, but they are not the
same quotient and they do not have the same weak equivalences.

This roadmap builds the reusable categorical and algebraic interfaces that keep those distinctions
formal. Its flagship calculation is the symmetric Frobenius algebra
`A = k[x]/(x^n)`: the stable module `A/(x^i)` has a two-periodic projective resolution, and the
same alternating maps `x^i` and `x^(n-i)` are a matrix factorization of `x^n` over `k[x]`.
The calculation works over every field; no characteristic-zero hypothesis is hidden in it.

The intended homes in Tau Ceti are:

- `TauCeti/CategoryTheory/Exact/Stable/` for ideals, Frobenius categories, and their stable
  triangulations;
- `TauCeti/Algebra/Homology/Periodic/` for differential modules and periodic complexes;
- `TauCeti/Algebra/Homology/Curved/` for curved DG algebras, modules, and derived categories of
  the second kind;
- `TauCeti/CommutativeAlgebra/MatrixFactorization/` for finite matrix factorizations and
  hypersurface comparisons.

## Boundary and dependencies

This roadmap consumes the genuine Quillen exact structures, exact functors, relative
projective/injective objects, and Grothendieck-group conventions of
[Grothendieck groups, Cartan maps, and Euler forms](../GrothendieckEulerForms/README.md). It consumes
the internally `ℤ`-graded algebra, degree-shift, Koszul, DG-category, and DG-module conventions of
[DG and A-infinity algebra](../DGAInfinity/README.md). It does not restate either foundation.

The [zigzag, preprojective, and Ginzburg algebra roadmap](../ZigzagPreprojective/README.md) supplies
symmetric Frobenius traces on an important class of examples. This roadmap supplies the generic
stable and curved machinery that can be applied to those examples; it does not reconstruct their
quivers, bases, or relations.

[Hopfological algebra](../HopfologicalAlgebra/README.md) consumes the stable quotient and
triangulated machinery supplied here. This stable/periodic/curved layer owns the triangulated
stable category; the hopfological layer owns the tensor-monoidal compatibility of its quotient.
A hopfological null-system is not declared to be a projective-injective ideal, an acyclic-complex
Verdier kernel, or a curved absolute-acyclic class unless a comparison theorem proves that
assertion under named hypotheses.

The following are outside this roadmap:

- choosing a Hopf algebra for an ADE or `E₈` application;
- quotienting an affine root system by its imaginary root;
- proving an `E₈` finiteness conjecture;
- categorical Niemeier or Leech-lattice glue;
- constructing particular zigzag, preprojective, Ginzburg, or hopfological algebras;
- Fukaya categories, analytic Landau–Ginzburg models, and geometric categories of singularities
  beyond the affine algebraic comparison stated below.

## Conventions

These choices are part of the specification.

| Topic | Convention |
|---|---|
| Modules | Right modules are primary. In Lean, a right `A`-module is a `Module Aᵐᵒᵖ M`. A left `A`-module is transported to a right `Aᵐᵒᵖ`-module. |
| Exact categories | A Quillen exact structure on an additive category; admissible monomorphisms, admissible epimorphisms, and conflations use the dependency roadmap's vocabulary. |
| Grading | Cohomological `ℤ`-grading; `d` has degree `+1`. Parity is reduction modulo two. |
| Koszul rule | Moving degree-`q` data past a homogeneous degree-`p` element contributes `(-1)^(p*q)`. |
| Shift | `X[1]^p = X^(p+1)` and `d_[1] = -d`. For a duplex, shift swaps even and odd pieces and negates both differentials. |
| Composition | Mathlib order: `f ≫ g` means first `f`, then `g`. |
| Homotopy | For an odd `h`, its boundary is `d_N h + h d_M`; for a homogeneous map `f` of degree `r`, `δ(f)=d_N f-(-1)^r f d_M`. |
| Curvature | The stored element is the **right-module curvature** `w`: `d_A²(a)=a*w-w*a`, `d_A(w)=0`, and `d_M²(m)=m*w`. |
| Positselski translation | His standard curvature `h` satisfies `d_A²(a)=h*a-a*h`, left `d²(m)=h*m`, and right `d²(m)=-m*h`. Thus our `w=-h`. |
| Graded opposite | For homogeneous `a,b`, `op(a) * op(b)=(-1)^(|a||b|) op(b*a)` and `d_op(op(a))=op(d_A(a))`. With the stored right-curvature convention, `Aᵐᵒᵖ` has curvature `-op(w)`. |
| Central potential | If `w` is graded-central of degree `2`, then `d_A²=0`. If in addition `d_A=0`, right curved modules satisfy the literal equation `d_M²(m)=m*w`. In parity grading, `w` is even. |
| Matrix factorization | For commutative `S` and `w:S`, maps `P₀ → P₁ → P₀` have both composites multiplication by `w`. |

The sign in the algebra-curvature equation is load-bearing. Storing Positselski's `h` while using
the right-module equation `d_M²=m*w` would be inconsistent. Connection change is recorded in the
same convention: if `a` has degree one and `d^a=d+[a,-]`, then
`w^a=w-d(a)-a²`. Strict curved morphisms preserve `d` and `w`; change-of-connection morphisms are a
separate bundled notion with these equations, not coerced to strict morphisms.

### Universes, size, and idempotents

The generic exact category has objects in `Type u` and homs in `Type v`. Stable ideal quotients
retain the same objects and hom universes. No global smallness assumption is imposed on module
categories. Constructions that require small localizations, sets of morphisms, or Grothendieck
groups take an essentially small full subcategory and use Mathlib's small-model/`Shrink` machinery;
they do not install a false `SmallCategory` instance on all modules.

Every module theorem says whether it concerns all modules, finitely generated modules, or
finite-dimensional modules. Bounded derived and singularity categories in the comparison
theorems use finitely generated right modules. Infinite coproducts in coderived categories and
infinite products in contraderived categories use the all-module category.

Idempotent completion is visible. A functor is stated as an equivalence before Karoubi completion
only when the cited theorem and its hypotheses give that equivalence. Otherwise the target is an
equivalence after `KaroubiEnvelope`, together with the comparison functor before completion.

## Existing API inventory

Use, extend, and interoperate with:

- Mathlib's `CategoryTheory.Quotient`, `HomRel`, `Congruence`,
  `CategoryTheory.Quotient.preadditive`, and the quotient functor/lift/uniqueness API;
- `CategoryTheory.Projective`, `CategoryTheory.Injective`, projective and injective objects,
  enough-projective/enough-injective classes, and resolutions;
- `CategoryTheory.HomologicalComplex`, `ComplexShape`, homotopies, homotopy categories, shifts,
  mapping cones, triangulated structures, acyclic complexes, quasi-isomorphisms, localizations,
  and `DerivedCategory`;
- `CategoryTheory.DifferentialObject` and
  `Mathlib.Algebra.Homology.DifferentialObject`, including the equivalence between differential
  objects in graded objects with shift and homological complexes;
- Mathlib's localization and Verdier-localization interfaces, including preadditive and
  triangulated localizations;
- Tau Ceti's quiver-representation, projective-representation, and Euler-form APIs where examples
  need them.

Neither Mathlib nor Tau Ceti has a packaged Frobenius exact category, stable category/module
category, morphism ideal quotient, Gorenstein-projective or singularity category, periodic
homotopy/derived category, curved DG algebra/module, or matrix-factorization category. Adopt any
of these that lands upstream, following its naming. `Suggested.lean` therefore
prototypes an additive morphism ideal on top of Mathlib's quotient; concrete bounded-complex,
exact-derived, perfect-kernel, orbit/compression, and matrix-factorization homotopy constructions;
and the square equations for differential modules, duplexes, and curved DG objects. It does not
clone Mathlib's complex, localization, projective/injective, or triangulated vocabulary.

## Objects that must remain distinct

| Construction | Objects | Maps killed/inverted | When triangulated |
|---|---|---|---|
| Stable additive quotient `E/[P]` | Objects of `E` | maps factoring through projective-injectives | when `E` is Frobenius exact, with the Happel triangles |
| Homotopy category `K(E)` or `K₂(E)` | complexes or duplexes | null-homotopic maps | after shifts and cones; also the stable category of the degreewise-split Frobenius exact category |
| Periodic derived category `D₂(A)` | two-periodic complexes | invert quasi-isomorphisms, equivalently Verdier-quotient `K₂` by acyclics under the abelian hypotheses below | under the abelian/localization hypotheses |
| Singularity category `D_sg(R)` | bounded complexes of finitely generated modules | Verdier-quotient by bounded perfect complexes | as a Verdier quotient |
| Absolute/coderived/contraderived curved category | curved DG modules | Verdier-quotient by the corresponding second-kind acyclic class | from the curved homotopy category and its thick/localizing/colocalizing kernel |
| Hopfological quotient | modules over a module algebra | the hopfological null-system specified there | only by the separate hopfological theorem |

In particular, “acyclic” means zero homology only where `d²=0` and kernels/images exist.
Contractible means the identity is null-homotopic. Every contractible square-zero complex is
acyclic, but the converse fails. A curved module with `w≠0` has no kernels/images forming homology
in general, so “quasi-isomorphism” is not its primitive weak equivalence.

## Layer 0: additive ideals and Frobenius exact categories

Build a bundled two-sided morphism ideal `I` in a preadditive category:
`I(X,Y)` is an `AddSubgroup (X ⟶ Y)` stable under pre- and postcomposition. Define its congruence
by `f ~ g ↔ f-g ∈ I(X,Y)` and construct the quotient through Mathlib's
`CategoryTheory.Quotient`. Prove:

- the quotient is preadditive and the quotient functor is additive, full, and essentially
  surjective;
- the hom group agrees with the quotient of the original hom group by `I(X,Y)`;
- an additive functor `F` factors through the quotient exactly when it kills `I`, with the
  functor, natural-transformation, and uniqueness universal properties;
- additive functors carrying one ideal into another induce quotient functors; natural
  transformations descend; identities and composition are coherent;
- equivalences carrying `I` onto `J` induce quotient equivalences;
- opposite categories and scalar-linear enrichments are supported using Mathlib's linear quotient
  API.

For a class `P` of objects, define the ideal generated by maps `X → Q → Y` with `P(Q)`. The
definition is its additive closure, so no closure-under-biproduct assumption is needed merely to
form the quotient. Prove that if `P` contains zero and is closed under finite biproducts and
isomorphism, every element of the generated ideal itself factors through one `P`-object.

Consume the dependency roadmap's exact structure and define:

- relative projective and relative injective objects through admissible lifting properties;
- enough relative projectives and injectives;
- a **Frobenius exact category** as an exact category with both enough classes and equality of the
  relative projective and relative injective predicates;
- the projective-injective subcategory, closed under isomorphism, finite biproducts, and retracts;
- the stable category `Stable E` as the additive quotient by its factoring ideal.

Do not make the stable quotient triangulated in this layer. For an arbitrary additive category and
arbitrary ideal it is only preadditive/additive.

For a field `k` and finite-dimensional `k`-algebra `A`, define a Frobenius functional
`λ:A→k` by nondegeneracy of `(a,b)↦λ(ab)`, and prove its equivalence to the standard finite-
dimensional right-module isomorphism `A ≅ A⁺`, using the right action
`(φ·a)(b)=φ(a*b)` on the dual and the map `a ↦ (b ↦ λ(a*b))`. Define symmetric Frobenius
functionals by `λ(ab)=λ(ba)` and pin the Nakayama automorphism by
`λ(a*b)=λ(b*ν(a))` for a general Frobenius functional.
Prove that a Frobenius algebra is left and right self-injective. Also prove the module-category
Frobenius theorem for a finite-dimensional `k`-algebra assumed self-injective on both sides.
Do not assert that unrelated notions called “Frobenius” are definitionally equal.

## Layer 1: the triangulated stable category

Let `E` be a Frobenius exact category. For every `X` choose conflations
`X ↪ I_X ↠ ΣX` with `I_X` projective-injective, and dually
`ΩX ↪ P_X ↠ X`. Descend the pushout/pullback constructions to the stable quotient and prove:

- `Σ` and `Ω` are additive quasi-inverse autoequivalences of `Stable E`;
- different choices give canonically naturally isomorphic functors;
- a conflation `X ↪ Y ↠ Z` produces the standard triangle
  `X → Y → Z → ΣX`;
- the chosen distinguished triangles satisfy the triangulated axioms, including rotation,
  morphisms of triangles, and octahedrality;
- the result agrees with Mathlib's `Pretriangulated`/`Triangulated` interfaces and shift notation;
- direct sums, opposites, and the idempotent-completion comparison respect the triangulation.

This is Happel's construction. The acceptance statement carries the full hypothesis
“Frobenius exact category”; having enough projectives alone, enough injectives alone, or an
additive quotient alone is insufficient.

An exact functor between Frobenius exact categories that sends projective-injectives to
projective-injectives descends to an additive stable functor. Construct its suspension comparison
from the chosen conflations and prove it is a triangle functor. Establish the natural-transformation
and equivalence APIs, including restriction to extension-closed Frobenius exact subcategories.

## Layer 2: self-injective modules, total acyclicity, and singularities

For a finite-dimensional `k`-algebra `A` that is self-injective on both sides, put the ordinary
abelian exact structure on finite-dimensional right `A`-modules. Prove that it is Frobenius and
that its projective-injectives are exactly the finite-dimensional projective modules. Every
finite-dimensional Frobenius algebra satisfies these self-injectivity hypotheses. Symmetric
Frobenius algebras form an important special case, not every Frobenius algebra.
Construct `stmod-A` and its triangulation. Keep it distinct from the quotient of the category of
all modules, usually written `StMod-A`.

For a left-and-right noetherian ring `R`, define a totally acyclic complex of finitely generated
projective right modules: the complex is acyclic and `Hom_R(P,R)` is acyclic. Define finitely
generated Gorenstein-projective right modules as degree-zero cycles in such complexes. Prove that
this definition is independent of the chosen complete resolution and build:

- the exact Frobenius category `Gproj-R`, with the exact structure inherited from finitely
  generated modules;
- projective-injective objects exactly the finitely generated projective modules;
- the stable equivalence between `Gproj-R` and the homotopy category of totally acyclic complexes
  of finitely generated projectives, by cycle and complete-resolution functors.

An **Iwanaga–Gorenstein ring** here means left and right noetherian with both self-injective
dimensions finite. Under precisely that hypothesis, define

`D_sg(R) = D^b(mod-R) / K^b(proj-R)`

as a Verdier quotient and prove Buchweitz's triangle equivalence
`stable(Gproj-R) ≃ D_sg(R)`. Give both the stalk/cokernel functor and the complete-resolution
quasi-inverse. State all left/right noetherian and finite self-injective-dimension assumptions in
the theorem, not in prose or ambient namespaces.

Specialize:

- if `R` is a finite-dimensional self-injective algebra, every finite-dimensional right module
  is Gorenstein-projective, so `stmod-R ≃ D_sg(R)`;
- if `R` is left/right noetherian of finite global dimension, `D_sg(R)` is zero;
- for an essentially small Frobenius exact category `E`, construct the Keller–Vossieck
  Example 2.3 comparison from `Stable E` to the exact-derived quotient
  `D^b(E)/K^b(ProjInj E)` and prove it is a triangle equivalence. Here `D^b(E)` is the bounded
  derived category of the specified Quillen exact structure. Supply a separate
  idempotent-completion compatibility theorem when `E` is idempotent complete; do not replace
  `D^b(E)` by `K^b(E)`—that analogous quotient need not be equivalent.

The second bullet is not a claim that the stable category of an arbitrary ring of finite global
dimension is zero. The self-injective specialization and the finite-global-dimension
specialization are different hypotheses.

## Layer 3: differential modules and periodic complexes

Build three related object types.

1. A **differential module** is one right `R`-module `M` with an `R`-linear endomorphism
   `d:M→M` satisfying `d²=0`. It is one-periodic.
2. A **genuine two-periodic complex** is a parity-graded pair
   `M₀ ⇄ M₁` with both consecutive composites zero.
3. More generally, for `n≥1`, an `n`-periodic complex is a
   `ZMod n`-indexed family with degree-one differential and consecutive composites zero.

Do not identify (1) and (2). Forgetting parity sends a two-periodic complex to a differential
module on `M₀⊕M₁`. A differential module has no canonical inverse construction. A **duplex** in
this roadmap is the parity-graded curved object of Layer 5; its curvature-zero specialization is
exactly (2).

Supply categories, additive/linear structures, evaluation functors, parity and cyclic shifts,
even closed morphisms, odd and general homogeneous morphisms, homotopies, null-homotopic maps,
mapping cones, and totalizations. Reuse Mathlib's homological-complex and differential-object APIs
where their shapes apply, and prove equivalences rather than maintaining parallel vocabularies.
In the one-periodic bridge, use a coherent natural identification of the one-step shift with the
identity and derive Mathlib's shifted-square law from the differential module's stored `d²=0` law;
the shifted-square equation is not an additional input.

For any additive category `A`, put the componentwise split exact structure on its differential
modules and periodic complexes. Prove that these are Frobenius exact categories, identify their
projective-injectives with the contractible objects (equivalently retracts of the elementary
periodic disks), and identify their stable categories with `K₁(A)` and `K_n(A)`. This supplies
their triangulations by both the stable-category construction and mapping cones; prove the two
triangulations agree.

If `A` is abelian, define parity/cyclic homology objects, acyclic periodic complexes, and
quasi-isomorphisms. Construct

`D_n(A) = K_n(A) / Ac_n(A)`

as the Verdier localization at quasi-isomorphisms and prove the two universal descriptions agree.
The abelian hypotheses are required: a merely additive base supports the split-exact homotopy
category but not kernel/image homology.

## Layer 4: compression, periodic resolutions, and relative projectives

For an additive category with the finite biproducts in use, define compression/folding

`Δ_n : C^b(A) → C_n(A),    (Δ_n X)^r = ⨁_{i ≡ r mod n} X^i.`

The sums are finite because `X` is bounded. Fix the induced differential and Koszul signs and
prove that compression preserves homotopies, cones, and triangles. It descends to
`K^b(A)→K_n(A)` and, for abelian `A`, to `D^b(A)→D_n(A)`.

The shift-orbit comparison is a theorem, not a definition. In the orbit/compression/hull theorem
paragraph, assume throughout that `Λ` is a finite-dimensional algebra of finite global dimension
over a field, exactly as in Stai §§3–4. Construct the functor from the orbit category
`D^b(mod-Λ)/[n]` to `D_n(mod-Λ)`, prove its full faithfulness as in Lemma 3.12, identify its
essential image with the gradable periodic objects, and construct its triangulated hull as in
Theorem 4.3. Do not claim that an orbit category is automatically triangulated or essentially
surjective.

For differential and periodic modules over an algebra, define:

- **relatively projective**: the underlying ungraded module, or every parity/cyclic component as
  appropriate, is projective;
- **projective flag**: a finite filtration split on underlying modules, with projective
  subquotients carrying zero differential and a strictly triangular differential;
- **homotopically projective**: maps to every acyclic object vanish in the homotopy category.

For a finite-dimensional algebra `Λ` of finite global dimension, prove Stai's equivalence between
homotopically projective objects and objects isomorphic in `K₁` to projective-flag objects, and
Proposition 3.10 identifying them with relatively projective differential modules. Deduce
`D_n(mod-Λ) ≃ K_n(proj-Λ)` with its finite-global-dimension hypothesis visible.

Record the failure without that hypothesis. For `Λ=k[t]/(t²)` over any field, the differential
module `(Λ,d=m_t)` is acyclic because `ker d=im d=(t)`, its underlying module is projective, but it
is not contractible. It is nonzero in `K₁(proj-Λ)` and zero in `D₁(mod-Λ)`. This is the acceptance
test that prevents “acyclic”, “contractible”, “relatively projective”, and “homotopically
projective” from collapsing into synonyms.

Develop periodic projective resolutions as periodic tails with a finite preperiod, their
compression and unfolding to ordinary complexes, minimality over artinian/local rings, and
chain-homotopy invariance. A theorem asserting eventual period one or two over a hypersurface uses
Eisenbud's hypotheses: a regular local ring `S`, a nonzero nonunit non-zero-divisor `w`,
`R=S/(w)`, and a finitely generated `R`-module. The bound and minimality assumptions must match
Eisenbud's Theorem 6.1.

## Layer 5: curved DG algebras, modules, and duplexes

Extend the DG/A-infinity roadmap's graded-algebra representation. A right-convention curved DG
algebra over a commutative ring `k` consists of:

- a `ℤ`-graded unital associative `k`-algebra `A`;
- a degree-one `k`-linear graded derivation `d_A`;
- curvature `w∈A²`;
- `d_A²(a)=a*w-w*a` and `d_A(w)=0`.

Curvature is not assumed central in this definition. Prove the graded-commutator form and the
Bianchi identity, base change under explicit flatness where needed, strict morphisms, connection
changes, and the zero-curvature equivalence with ordinary DG algebras. For the graded opposite,
prove on homogeneous elements the pinned formula
`op(a)*op(b)=(-1)^(|a||b|)op(b*a)`, take `d_op(op(a))=op(d_A(a))`, and verify directly that its
right curvature is `-op(w)`, not `op(w)`. A right curved DG module `M` has a degree-one
differential satisfying

`d_M(m*a)=d_M(m)*a+(-1)^|m| m*d_A(a),    d_M²(m)=m*w.`

Define left modules through the opposite algebra and prove the displayed translation
`d²(m)=-w*m`. Do not silently give left modules the right-module square.

For modules of the same curvature, the graded Hom differential squares to zero. Build the DG
category of curved modules, its closed degree-zero category, shift, cone, and homotopy category.
The homotopy category is triangulated by shifts and cones even though individual curved modules
have no homology. Tensor products are only formed after spelling the handedness and curvature:
the two curvature actions must cancel or combine to the declared target curvature. Prove each
formula rather than inferring it from the uncurved tensor API.

The central, zero-algebra-differential specialization receives a direct API. For graded-central
`w` of degree two, a curved module satisfies `d²=(-)*w`. In parity grading, a **curved duplex** is
a pair `M₀ ⇄ M₁` whose two composites are right multiplication by the same even central `w`.
At `w=0` it is a genuine two-periodic complex. These two equations are separate constructors and
simp lemmas; `d²=0` is never proved from `d²=w` without the hypothesis `w=0`.

## Layer 6: curved acyclicity and derived categories of the second kind

Let the underlying graded-module category be abelian, with the exact coproducts or products
required by each construction. For a short exact sequence of curved modules, construct its total
curved module. Inside the curved homotopy category define:

- **absolutely acyclic** objects: the smallest thick triangulated subcategory containing all such
  totalizations;
- **coacyclic** objects: the smallest triangulated subcategory containing them and closed under
  the specified small coproducts;
- **contraacyclic** objects: the smallest triangulated subcategory containing them and closed
  under the specified small products.

Construct `D_abs`, `D_co`, and `D_ctr` as Verdier quotients and prove their universal properties.
There is no “ordinary derived category of curved modules” defined by homology. Prove the canonical
inclusions `Ac_abs ⊆ Ac_co` and `Ac_abs ⊆ Ac_ctr`. They induce functors
`D_abs → D_co` and `D_abs → D_ctr`, respectively. There is no canonical comparison in either
direction between `D_co` and `D_ctr` without an additional theorem.

Formalize Positselski's comparison results with their actual hypotheses:

- for primary right modules, if the abelian category of graded right modules over the underlying
  graded ring has finite homological dimension (finite right graded global dimension), absolute,
  co-, and contraacyclic classes coincide, by applying Theorem 7.8(a) to the graded opposite;
- in the uncurved DG specialization—literally curvature `w=0`—Theorem 7.8(b) additionally requires
  **either** `A^n=0` for every `n>0`, **or** all three conditions `A^n=0` for every `n<0`, `A⁰`
  classically semisimple, and `A¹=0`. Under the same finite right graded-global-dimension
  hypothesis, and only under one of those alternatives, ordinary acyclic, absolute, co-, and
  contraacyclic objects coincide;
- the graded-injective model for the coderived category uses Theorem 7.9(a)'s exact right-module
  translation of condition `(*)`: every countable direct sum of injective graded right modules
  has finite injective dimension as a graded right module;
- the graded-projective model for the contraderived category uses Theorem 7.9(b)'s exact
  right-module translation of condition `(**)`: every countable product of projective graded
  right modules has finite projective dimension as a graded right module.

Translate every statement to right modules through opposites, recording which noetherian,
product, coproduct, and finite-dimensional condition changes side.

## Layer 7: matrix factorizations

For a commutative ring `S` and potential `w∈S`, define a matrix factorization as finitely generated
projective modules `P₀,P₁` and maps

`P₀ --d₀--> P₁ --d₁--> P₀,    d₁d₀=w·id,    d₀d₁=w·id.`

This is a finite-projective curved duplex. Build its additive category, even morphisms, the
`ℤ/2`-graded Hom complex, null-homotopies, parity shift, direct sums, tensor products with summed
potentials, duals with the correct sign/potential, mapping cones, and homotopy category
`HMF(S,w)`. Prove the homotopy category triangulated. The exact category of factorizations with
componentwise split exact sequences is Frobenius; identify its projective-injectives with
contractible factorizations and prove that its stable category is `HMF(S,w)`.

Pin duality as follows. For `P=(P₀ --d₀→ P₁ --d₁→ P₀)` with finite projective
components, put `(Pᵛ)₀=P₀ᵛ`, `(Pᵛ)₁=P₁ᵛ`,
`d₀ᵛ=(d₁)ᵗ : P₀ᵛ→P₁ᵛ`, and `d₁ᵛ=-(d₀)ᵗ : P₁ᵛ→P₀ᵛ`.
Thus duality is a contravariant functor from potential `w` to potential `-w`; the two composites
are multiplication by `-w`. Any alternate placement of the single minus sign must be related to
this convention by an explicit natural isomorphism.

Keep three hypersurface results separate and compose them only after checking all their
hypotheses.

1. **Eisenbud's local theorem.** Let `(S,𝔪)` be a commutative regular local ring and let
   `w∈𝔪` be a nonzero nonunit non-zero-divisor. For `R=S/(w)`, use finite **free** matrix
   factorizations and finitely generated maximal Cohen–Macaulay `R`-modules. State the eventual
   two-periodicity and the cokernel/stable-MCM comparison with the exact minimality clauses of
   Eisenbud §5 and Theorem 6.1.
2. **Orlov's global finite-projective theorem.** Let `X=Spec S` be a smooth affine variety, or
   more generally the affine regular-scheme case satisfying Orlov's `(ELF)` conditions:
   separated, noetherian, finite Krull dimension, and enough finite-rank locally free sheaves.
   Require the morphism `W:X→A¹` to be flat, let `X₀` be its zero fiber, and use finitely
   generated projective `S`-modules. Then Orlov Proposition 3.3 and Theorem 3.9 give the exact
   equivalence `HMF(S,w) ≃ D_sg(X₀)`. This theorem does not insert an idempotent completion
   under those hypotheses.
3. **Buchweitz's comparison.** When `R` is left-and-right noetherian Iwanaga–Gorenstein, identify
   `stable(Gproj-R)` with `D_sg(R)` as in Layer 2; in the commutative hypersurface setting,
   explicitly verify when the finitely generated Gorenstein-projectives are the stated MCM
   modules.

A ring-theoretic non-zero-divisor condition is **not** a replacement for Orlov's flat morphism
hypothesis. Do not apply Orlov's theorem at `w=0`. If a different global or non-affine source
gives only density up to direct summands, state the result after `KaroubiEnvelope` and retain the
comparison functor before completion.

Compare finite matrix factorizations with the corresponding full subcategory of curved DG modules
and duplexes. The forgetful functor to a two-periodic complex exists only when `w=0` or after base
change to `S/(w)`, where both composites become zero. Construct that base-change functor and relate
its cokernel and periodic resolution to the singularity comparison.

## Layer 8: comparison functors and reconciliation

Collect the constructions into named functors and commuting diagrams:

- ordinary bounded complexes to periodic complexes by compression;
- periodic homotopy to periodic derived categories by Verdier localization;
- stable Gorenstein-projectives to singularity categories by stalk/complete resolution;
- matrix factorizations to curved duplexes by forgetting finite projectivity;
- matrix factorizations over `(S,w)` to two-periodic complexes over `S/(w)` by base change;
- matrix factorizations to stable MCM modules by cokernel;
- ordinary DG modules to curved DG modules at `w=0`;
- right-module constructions to left-module constructions over the opposite algebra.

For each functor, state object and morphism formulas, exact/additive/DG/triangle structure,
kernel or weak-equivalence behavior, full faithfulness, essential image, and every hypothesis
under which an equivalence is claimed. Prove naturality under ring maps only with the centrality,
potential-preservation, flatness, finite-generation, and regularity hypotheses required by the
particular functor.

No two categories in the distinction table become definitionally equal. Reconciliation is by
explicit functors and equivalences.

## Worked acceptance examples

### The stable category of `k[x]/(x^n)`

Let `k` be any field and `n≥2`. Put `A=k[x]/(x^n)`. The functional extracting the coefficient of
`x^(n-1)` is a symmetric Frobenius functional: the pairing `λ(ab)` is nondegenerate and symmetric.
Prove this directly from the basis `1,x,…,x^(n-1)`, with no characteristic restriction.

For `1≤i≤n` let `M_i=A/(x^i)`. Prove:

- `M₁,…,M_n` are the indecomposable finite-dimensional right `A`-modules up to isomorphism;
- `M_n=A` is projective and hence zero in `stmod-A`;
- for `1≤i<n`, `ΩM_i≅M_(n-i)` and `Ω²M_i≅M_i` in the stable category;
- the minimal free resolution alternates multiplication by `x^i` and `x^(n-i)`;
- for `1≤i,j<n`,
  `dim_k \underline{Hom}_A(M_i,M_j)=min(i,j,n-i,n-j)`.

The last equality may also be proved as
`min(i,j)-max(0,i+j-n)` and reconciled arithmetically. Check `n=2` and `n=3` concretely.

### A square-zero duplex

For a commutative ring `R` and an `R`-module `M`, take both parity pieces to be `M⊕M` and both
differentials to be `(a,b)↦(0,a)`. Prove both composites are zero, build the corresponding genuine
two-periodic complex, compute its parity homology, its shift, and a cone. Forget parity and compare
with the differential module on the direct sum; exhibit why this forgetful construction has no
canonical inverse.

Over `k[t]/(t²)` also carry out the acyclic noncontractible differential-module example from
Layer 4. The two examples serve different purposes: the first checks the object/sign API, while
the second separates the homotopy and derived quotients.

### A matrix factorization

Let `S=k[x]`, `w=x^n`, and `1≤i<n`. Construct

`S --x^i--> S --x^(n-i)--> S.`

Prove both composites are multiplication by `x^n`, base-change it to a two-periodic free
resolution over `A=S/(x^n)`, and identify its cokernel with `M_i`. Verify directly that
`k[x]` is finite free, hence flat, over `k[t]` via `t↦x^n`; then show that its classes correspond
under the separate Eisenbud, Buchweitz, and Orlov hypotheses through
`HMF(S,w)`, `stable(MCM A)`, and `D_sg(A)`. Reconcile parity shift with syzygy and check that two
shifts return `M_i`.

## Completion criteria

The roadmap is complete when:

- additive ideals and their quotient universal property are usable independently of Frobenius
  categories;
- Frobenius exact stable categories carry the Happel triangulation functorially;
- self-injective, Gorenstein-projective, totally acyclic, and singularity comparisons have their
  exact hypotheses and explicit quasi-inverse functors;
- differential modules, genuine two-periodic complexes, and curved duplexes are different types
  linked by explicit specializations and forgetful functors;
- periodic homotopy and derived categories, compression, projective flags, and periodic
  resolutions are built and their finite-global-dimension boundary is tested;
- right curved DG algebra/module signs agree with opposites, Hom differentials, shifts, cones, and
  the translation from Positselski;
- absolute, co-, and contra-derived curved categories have their generating closures and
  localization universal properties;
- matrix factorizations have a full homotopy/triangulated API and the hypersurface equivalences;
- all three worked examples are formalized and the comparison diagrams commute;
- documentation never calls a stable ideal quotient a Verdier quotient, never calls a curved
  module acyclic by homology, and never treats a hopfological quotient as one of the quotients
  constructed here without a theorem.

## Primary references

- Dieter Happel, [*Triangulated Categories in the Representation Theory of Finite Dimensional
  Algebras*](https://doi.org/10.1017/CBO9780511629228), LMS Lecture Note Series 119, Cambridge
  University Press (1988), Chapter I §2, especially Theorem I.2.6: the triangulated stable category
  of a Frobenius category.
- Theo Bühler, [*Exact Categories*](https://doi.org/10.1016/j.exmath.2009.04.004), Expositiones
  Mathematicae 28 (2010), 1–69, §§7, 10–13: exact categories, projectives/injectives, and
  Frobenius categories.
- Bernhard Keller, [*Chain complexes and stable
  categories*](https://webusers.imj-prg.fr/~bernhard.keller/publ/csc.pdf), Manuscripta
  Mathematica 67 (1990), 379–417, especially §§1–4: exact structures on complexes and stable/
  homotopy comparisons.
- Ragnar-Olaf Buchweitz, [*Maximal Cohen–Macaulay Modules and Tate
  Cohomology*](https://bookstore.ams.org/SURV/262), Mathematical Surveys and Monographs 262,
  American Mathematical Society (2021; lightly edited from the 1986 manuscript), §4 and
  Theorem 4.4.1: complete resolutions, stable MCM modules, and the singularity category.
- Bernhard Keller and Dieter Vossieck, [*Sous les catégories
  dérivées*](https://webusers.imj-prg.fr/~bernhard.keller/publ/scdabs.html), C. R. Acad. Sci.
  Paris Série I 305 (1987), 225–228: stable/derived quotient comparison.
- Luchezar L. Avramov, Ragnar-Olaf Buchweitz, and Srikanth Iyengar,
  [*Class and rank of differential modules*](https://doi.org/10.1007/s00222-007-0041-6),
  Inventiones Mathematicae 169 (2007), 1–35, especially §§1–2: differential modules and free
  flags.
- Torkil Stai, [*The triangulated hull of periodic
  complexes*](https://www.intlpress.com/site/pub/files/_fulltext/journals/mrl/2018/0025/0001/MRL-2018-0025-0001-a009.pdf),
  Mathematical Research Letters 25 (2018), 199–236, §§3.1–3.4, Proposition 3.10, Lemma 3.12,
  and Theorem 4.3: periodic homotopy/derived categories, projective flags, compression, and
  triangulated hulls.
- Leonid Positselski, [*Differential graded Koszul duality: an introductory
  survey*](https://arxiv.org/abs/2207.07063), Bulletin of the London Mathematical Society 55
  (2023), 1553–1640, §§6.2 and 7.6, Definitions 7.4–7.6 and Theorems 7.8–7.9: curved DG signs and
  derived categories of the second kind.
- David Eisenbud, [*Homological algebra on a complete intersection, with an application to group
  representations*](https://doi.org/10.2307/1999875), Transactions of the American Mathematical
  Society 260 (1980), 35–64, §5 and Theorem 6.1: matrix factorizations and eventual
  two-periodicity over hypersurfaces.
- Dmitri Orlov, [*Triangulated categories of singularities and D-branes in Landau–Ginzburg
  models*](https://arxiv.org/abs/math/0302304), Proceedings of the Steklov Institute of
  Mathematics 246 (2004), 227–248, §§1.2 and 3, Proposition 3.3 and Theorem 3.9: for affine
  regular `(ELF)` schemes and a flat superpotential, finite-projective pairs and their exact
  singularity-category equivalence.
- Igor Frenkel, Mikhail Khovanov, and Olivier Schiffmann,
  [*Homological realization of Nakajima varieties and Weyl group
  actions*](https://doi.org/10.1112/S0010437X05001727), Compositio Mathematica 141 (2005),
  1479–1503, §§2–4: algebraic curved complexes, duplexes, homotopy categories, and the stable
  quotient motivation used here. Their application-specific representation theory is outside
  this roadmap.
